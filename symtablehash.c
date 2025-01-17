/* symtablehash.c
 * Author: Alexei Korolev
 */

#include <stdio.h>
#include "symtable.h"
#include <assert.h>
#include <stdlib.h>
#include <string.h>

/* A Node_T is a pointer to a struct Node */
typedef struct Node* Node_T;

/* List of prime sizes to expand hash table to once
capacity is reached. */
const size_t SIZES[] = {509, 1021, 2039, 4093,
   8191, 16381, 32749, 65521};

/* Number of resizing options. Should be > 1*/
const size_t NUMBER_OF_SIZES = 8;

/* Node object to contain key-value pairs */
struct Node {
   /* contains the key in the key-value pair */
   char *key;
   /* contains the value in the key-value pair */
   void *value;
   /* pointer to the next node*/
   Node_T next;
};

/* SymTable object to store the table and its metadata */
struct SymTable {
   /* a table of pointers to the begining of the Node chains */
   Node_T *table;
   /* the index of the SIZES array corresponding to the current
      size of table */
   int curArrSize;
   /* the number of elements in the SymTable */
   size_t size;
};

/* Return a hash code for pcKey that is between 0 and uBucketCount-1,
   inclusive. */
static size_t SymTable_hash(const char *pcKey, size_t uBucketCount)
{
   const size_t HASH_MULTIPLIER = 65599;
   size_t u;
   size_t uHash = 0;

   assert(pcKey != NULL);

   for (u = 0; pcKey[u] != '\0'; u++)
      uHash = uHash * HASH_MULTIPLIER + (size_t)pcKey[u];

   return uHash % uBucketCount;
}


SymTable_T SymTable_new(void) {
   SymTable_T newTable = calloc(1, sizeof(struct SymTable));
   if (newTable == NULL) {return NULL;}

   newTable->table = calloc(SIZES[0], sizeof(Node_T));

   if (newTable->table == NULL) {
      free (newTable);
      return NULL;
   }

   newTable->size = 0;
   newTable->curArrSize = 0;
   return newTable;
}

/* Returns a new Node_T using the provided key and value pair
 if memory allocation successful, NULL otherwise */
static Node_T Node_new(const char *key, const void *value) {
   Node_T newNode;

   assert(key != NULL);

   newNode = calloc(1, sizeof(struct Node));
   
   if (newNode == NULL) {return NULL;}

   newNode->key = malloc(strlen(key) + 1);

   if (newNode->key == NULL) {
      free(newNode);
      return NULL;
   }

   strcpy(newNode->key, key);
   newNode->value = (void *)value;
   return newNode;
}

void free_LL(Node_T node) {
   if (node == NULL) {return;}
   if (node->next != NULL) { free_LL(node->next); }
   free(node);
   return;
}

void SymTable_free(SymTable_T oSymTable) {
   size_t i = 0;
   size_t size; 
   assert(oSymTable != NULL);
   
   size = SIZES[oSymTable->curArrSize];
   for (i = 0; i < size; i++){
      free_LL(oSymTable->table[i]);
   }

   free(oSymTable->table);
   free(oSymTable);
}

size_t SymTable_getLength(SymTable_T oSymTable) {
   assert(oSymTable != NULL);
   return oSymTable->size;
}

int putElement(Node_T *table, const char *key,
                const void *value, const size_t arrSize) {
   
   size_t index;
   Node_T newNode;
   Node_T curNode;

   assert(table != NULL);
   assert(key != NULL);

   index = SymTable_hash(key, arrSize);
   newNode = Node_new(key, value);
   if (newNode == NULL) {return 0;}

   curNode = table[index];

   if (curNode == NULL) {table[index] = newNode; return 1;}
   
   while (curNode->next != NULL) {
      curNode = curNode->next;
   }

   curNode->next = newNode;
   return 1;
}


/* Tries to expand oSymTable to the next size as defined in SIZES.
Expands only when the number of elements matches the size of 
oSymTable->table. If expansion is successful, returns 1. Otherwise,
returns 0. */
int expandTable(SymTable_T oSymTable) {
   Node_T *newTable;
   
   assert(oSymTable != NULL);

   if (oSymTable->size >= SIZES[NUMBER_OF_SIZES - 2]) {return 1;}

   if (oSymTable->size >= SIZES[oSymTable->curArrSize]) {
      size_t original_size = SIZES[oSymTable->curArrSize];
      size_t new_size = SIZES[++(oSymTable->curArrSize)];
      size_t index = 0;
      /*expand*/
      
      newTable = calloc(new_size, sizeof(Node_T));

      if (newTable == NULL) {return 0;}

      /* rehash everything into new table */
      for (index = 0; index < original_size; index++) {
         Node_T curNode = oSymTable->table[index];

         /* loop through the separate chain */
         while (curNode != NULL) {
            size_t newIndex = SymTable_hash(curNode->key, new_size);
            Node_T alreadyPresentNode = newTable[newIndex];
            Node_T curNodeCopy = Node_new(curNode->key, curNode->value);
            
            newTable[newIndex] = curNodeCopy;

            curNodeCopy->next = alreadyPresentNode;

            curNodeCopy = curNode->next;
            free(curNode->key);
            free(curNode);
            curNode = curNodeCopy;
         }
      }

      /* free old table */
      free(oSymTable->table);
      oSymTable->table = newTable;
      return 1;
      
   } else {
      return 1;
   }
}

int SymTable_put(SymTable_T oSymTable,
                 const char *pcKey, const void *pvValue) {
   Node_T newNode = NULL;
   size_t index;
   Node_T curNode;
   Node_T prevNode = NULL;
   
   assert(oSymTable != NULL);
   assert(pcKey != NULL);

   newNode = Node_new(pcKey, pvValue);
   if (newNode == NULL) {return 0;}

   index = SymTable_hash(pcKey, SIZES[oSymTable->curArrSize]);

   curNode = oSymTable->table[index];

   if (curNode == NULL) {
      oSymTable->table[index] = newNode;
      oSymTable->size++;
      return expandTable(oSymTable);
   }

   do {
      if (strcmp(pcKey, curNode->key) == 0) {
         free(newNode->key);
         free(newNode);
         return 0;
      }
      prevNode = curNode;
      curNode = curNode->next;
   } while(curNode != NULL);

   prevNode->next = newNode;

   oSymTable->size++;
   return expandTable(oSymTable);
   
}

Node_T getNodeFromKey(SymTable_T oSymTable, const char *key) {
   size_t index;
   Node_T curNode;

   assert(oSymTable != NULL);
   assert(key != NULL);

   index = SymTable_hash(key, SIZES[oSymTable->curArrSize]);
   curNode = oSymTable->table[index];

   if (curNode == NULL) {return NULL;}

   while (curNode != NULL) {
      if (strcmp(key, curNode->key) == 0) {
         return curNode;
      }
      curNode = curNode->next;
   }

   return NULL;
}

void *SymTable_replace(SymTable_T oSymTable,
                       const char *pcKey, const void *pvValue) {
   Node_T foundNode = getNodeFromKey(oSymTable, pcKey);
   void* oldValue;

   if (foundNode == NULL) {return NULL;}

   oldValue = (void *)foundNode->value;
   foundNode->value = (void *)pvValue;
   return oldValue;
}

int SymTable_contains(SymTable_T oSymTable, const char *pcKey) {
   assert(oSymTable != NULL);
   assert(pcKey != NULL);
   
   return getNodeFromKey(oSymTable, pcKey) != NULL;
}


void *SymTable_get(SymTable_T oSymTable, const char *pcKey) {
   Node_T foundNode;

   assert(oSymTable != NULL);
   assert(pcKey != NULL);

   foundNode = getNodeFromKey(oSymTable, pcKey);
   
   if (foundNode == NULL) {return NULL;}

   return (void *)foundNode->value;
}


void *SymTable_remove(SymTable_T oSymTable, const char *pcKey) {
   size_t index;
   Node_T curNode;
   Node_T prevNode = NULL;

   assert(oSymTable != NULL);
   assert(pcKey != NULL);

   index = SymTable_hash(pcKey, SIZES[oSymTable->curArrSize]);
   curNode = oSymTable->table[index];
   
   if (curNode == NULL) {return NULL;}

   while (curNode != NULL) {
      if (strcmp(pcKey, curNode->key) == 0) {
         /* remove node */
         void *removedValue = (void *)curNode->value;
         
         if (prevNode == NULL) {
            oSymTable->table[index] = curNode->next;
         }else {
            prevNode->next = curNode->next;
         }

         free(curNode->key);
         free(curNode);

         oSymTable->size--;

         return removedValue;
      }
      prevNode = curNode;
      curNode = curNode->next;
   }

   return NULL;
}

void SymTable_map(SymTable_T oSymTable,
     void (*pfApply)(const char *pcKey, void *pvValue, void *pvExtra),
                  const void *pvExtra) {
   size_t size;
   size_t i = 0;

   assert(oSymTable != NULL);
   assert(pfApply != NULL);
   
   size = SIZES[oSymTable->curArrSize];

   for (i = 0; i < size; i++) {
      Node_T curNode = oSymTable->table[i];
      
      while (curNode != NULL) {
         pfApply(curNode->key, curNode->value, (void *)pvExtra);
         curNode = curNode->next;
      }
   }
   
}


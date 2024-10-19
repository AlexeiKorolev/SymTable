#include <stdio.h>
#include "symtable.h"
#include <assert.h>
#include <stdlib.h>
#include <string.h>

typedef struct Node* Node_T;

const size_t SIZES[] = {509, 1021, 2039, 4093,
   8191, 16381, 32749, 65521};

struct Node {
   char *key;
   void *value;
   Node_T next;
};

struct SymTable {
   Node_T *table;
   int curArrSize;
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
   SymTable_T newTable = malloc(sizeof(struct SymTable));
   if (newTable == NULL) {return NULL;}

   newTable->table = malloc(sizeof(struct Node) * SIZES[0]);

   if (newTable->table == NULL) {
      free (newTable);
      return NULL;
   }

   newTable->size = 0;
   newTable->curArrSize = 0;
   return newTable;
}

Node_T Node_new(const char *key, const void *value) {
   Node_T newNode = malloc(sizeof(struct SymTable));

   assert(key != NULL);
   
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
   assert(oSymTable != NULL);

   for (i = 0; i < oSymTable->curArrSize; i++){
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
   
   size_t index = SymTable_hash(key, arrSize);
   Node_T newNode = Node_new(key, value);
   Node_T curNode;

   if (newNode == NULL) {return 0;}

   curNode = table[index];

   if (curNode == NULL) {table[index] = newNode; return 1;}
   
   while (curNode->next != NULL) {
      curNode = curNode->next;
   }

   curNode->next = newNode;
   return 1;
}

int expandTable(SymTable_T oSymTable) {
   Node_T *newTable;
   
   assert(oSymTable != NULL);

   if (oSymTable->size >= SIZES[6]) {return 0;}

   if (oSymTable->size >= SIZES[oSymTable->curArrSize]) {
      size_t original_size = SIZES[oSymTable->curArrSize];
      size_t new_size = SIZES[++(oSymTable->curArrSize)];
      size_t index = 0;
      /*expand*/
      
      newTable = malloc(sizeof(struct Node) * new_size);

      if (newTable == NULL) {return 0;}

      /* rehash everything into new table */
      for (index = 0; index < original_size; index++) {
         Node_T curNode = oSymTable->table[index];

         /* loop through the separate chain */
         while (curNode != NULL) {
            size_t newIndex = SymTable_hash(curNode->key, new_size);
            Node_T newCurNode = newTable[newIndex];

            if (newCurNode == NULL) {newTable[newIndex] = curNode;}
            
            /* add to the end */
            while (newCurNode->next != NULL) {
               newCurNode = newCurNode->next;
            }

            newCurNode->next = newCurNode;
         }
      }

      /* free old table */
      free(oSymTable->table);
      oSymTable->table = newTable;
      return 1;
      
   } else {
      return 0;
   }
}

int SymTable_put(SymTable_T oSymTable,
                 const char *pcKey, const void *pvValue) {
   Node_T newNode = Node_new(pcKey, pvValue);
   size_t index;
   
   assert(oSymTable != NULL);
   assert(pcKey != NULL);
   
   if (newNode == NULL) {return 0;}

   index = SymTable_hash(pcKey, SIZES[oSymTable->curArrSize]);

   Node_T curNode = oSymTable->table[index];

   if (curNode == NULL) {oSymTable->table[index] = newNode;}
   
   while(curNode != NULL) {curNode = curNode->next;}

   curNode->next = newNode;

   oSymTable->size++;

   return expandTable(oSymTable);
}

Node_T getNodeFromKey(SymTable_T oSymTable, const char *key) {
   size_t index = SymTable_hash(key, SIZES[oSymTable->curArrSize]);
   Node_T curNode = oSymTable->table[index];

   if (curNode == NULL) {return NULL;}

   while (curNode != NULL) {
      if (strcmp(key, curNode->key) == 0) {
         return curNode;
      }
   }

   return NULL;
}

void *SymTable_replace(SymTable_T oSymTable,
                       const char *pcKey, const void *pvValue) {
   Node_T foundNode = getNodeFromKey(oSymTable, pcKey);

   if (foundNode == NULL) {return NULL;}

   void *oldValue = foundNode->value;
   foundNode->value = (void *)pvValue;
   return oldValue;
}

int SymTable_contains(SymTable_T oSymTable, const char *pcKey) {
   return getNodeFromKey(oSymTable, pcKey) != NULL;
}

void *SymTable_get(SymTable_T oSymTable, const char *pcKey) {
   Node_T foundNode = getNodeFromKey(oSymTable, pcKey);

   if (foundNode == NULL) {return NULL;}

   return (void *)foundNode->value;
}

void *SymTable_remove(SymTable_T oSymTable, const char *pcKey) {
   size_t index = SymTable_hash(pcKey, SIZES[oSymTable->curArrSize]);
   Node_T curNode = oSymTable->table[index];
   Node_T prevNode = NULL;

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
   const size_t size = SIZES[oSymTable->curArrSize];
   size_t i = 0;

   for (i = 0; i < size; i++) {
      Node_T curNode = oSymTable->table[i];
      
      while (curNode != NULL) {
         pfApply(curNode->key, curNode->value, (void *)pvExtra);
      }
   }
   
}


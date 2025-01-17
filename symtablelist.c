#include <stdio.h>
#include "symtable.h"
#include <stdlib.h>
#include <string.h>
#include <assert.h>

typedef struct Node *Node_T;

struct Node {
   char *key;
   const void *value;
   Node_T next;
};

struct SymTable {
   size_t size;
   Node_T head;
};

SymTable_T SymTable_new(void) {
   SymTable_T c = calloc(1, sizeof(struct SymTable));
   
   if (c == NULL) { return NULL; }
   
   c->size = 0;
   return c;
}

void free_LL(Node_T next) {
   if (next->next != NULL) { free_LL(next->next); }
   free(next->key);
   free(next);
}

void SymTable_free(SymTable_T oSymTable) {
   assert(oSymTable != NULL);
   if (oSymTable->head == NULL) {
      free(oSymTable);
      return;
   }
   free_LL(oSymTable->head);
   free(oSymTable);
}

size_t SymTable_getLength(SymTable_T oSymTable) {
   assert(oSymTable != NULL);
   return oSymTable->size;
}

Node_T Node_new(const char* key, const void *value) {
   Node_T newNode = calloc(1, sizeof(struct Node));

   assert(key != NULL);
   /*assert(value != NULL);*/
   
   if (newNode == NULL) { return NULL; }

   newNode->key = malloc(strlen(key) + 1);

   if (newNode->key == NULL) {
      free(newNode);
      return NULL;
   }

   strcpy(newNode->key, key);
   newNode->value = value;

   return newNode;
}

int SymTable_put(SymTable_T oSymTable, const char *pcKey,
                 const void *pcValue) {
   Node_T curNode = oSymTable->head;
   Node_T prevNode = NULL;
   Node_T newNode;

   assert(oSymTable != NULL);
   assert(pcKey != NULL);
   /*assert(pcValue != NULL);*/
   
   if (curNode == NULL) {
      newNode = Node_new(pcKey, pcValue);
      if (newNode == NULL) {return 0;}
      oSymTable->head = newNode;
      oSymTable->size++;
      return 1;
   }

   while (curNode != NULL) {
      if (strcmp(pcKey, curNode->key) == 0) { return 0; }
      prevNode = curNode;
      curNode = curNode->next;
   }

   newNode = Node_new(pcKey, pcValue);
   if (newNode == NULL) {return 0;}
   prevNode->next = newNode;
   oSymTable->size++;
   return 1; /* Success! */
}

void* SymTable_replace(SymTable_T oSymTable, const char *pcKey,
                       const void *pvValue) {
   Node_T curNode = oSymTable->head;

   assert(oSymTable != NULL);
   assert(pcKey != NULL);
   /*assert(pvValue != NULL);*/

   while (curNode != NULL) {
      if (strcmp(pcKey, curNode->key) == 0) {
         void *oldValue = (void *)curNode->value;
         curNode->value = pvValue;
         return oldValue;
      }
      curNode = curNode->next;
   }

   return NULL;
}

int SymTable_contains(SymTable_T oSymTable, const char *pcKey) {
   Node_T curNode = oSymTable->head;

   assert(oSymTable != NULL);
   assert(pcKey != NULL);

   while (curNode != NULL) {
      if (strcmp(pcKey, curNode->key) == 0) { return 1; }
      curNode = curNode->next;
   }
   return 0;
}

void *SymTable_get(SymTable_T oSymTable, const char *pcKey) {
   Node_T curNode = oSymTable->head;

   assert(oSymTable != NULL);
   assert(pcKey != NULL);
   
   while (curNode != NULL) {
      if (strcmp(pcKey, curNode->key) == 0) {
         return (void *)curNode->value;
      }
      curNode = curNode->next;
   }
   return NULL;
}

void *SymTable_remove(SymTable_T oSymTable, const char *pcKey) {
   Node_T curNode = oSymTable->head;
   Node_T prevNode = NULL;

   assert(oSymTable != NULL);
   assert(pcKey != NULL);

   while (curNode != NULL) {
      if (strcmp(pcKey, curNode->key) == 0) {
         void *oldValue = (void *)curNode->value;
         
         if (prevNode == NULL) { oSymTable->head = curNode->next; }
         else { prevNode->next = curNode->next; }

         free(curNode->key);
         free(curNode);

         oSymTable->size--;
         
         return oldValue;
      }
      prevNode = curNode;
      curNode = curNode->next; 
   }
   return NULL;
}

void SymTable_map(SymTable_T oSymTable,
     void (*pfApply)(const char *pcKey, void *pvValue, void *pvExtra),
                  const void *pvExtra) {
   Node_T curNode = oSymTable->head;

   assert(oSymTable != NULL);
   assert(pfApply != NULL);
   /*assert(pvExtra != NULL);*/

   while(curNode != NULL) {
      pfApply(curNode->key, (void *)curNode->value, (void *)pvExtra);
      curNode = curNode->next;
   }
}

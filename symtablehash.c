#include <stdio.h>
#include "symtable.h"
#include <assert.h>
#include <stdlib.h>
#include <string.h>

typedef struct Node* Node_T;

const int SIZES[] = {509, 1021, 2039, 4093, 8191, 16381, 32749, 65521};

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
   newTable->curArrSize = SIZES[0];
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
   int i = 0;
   assert(oSymTable != NULL);

   for (i = 0; i < oSymTable->curArrSize; i++){
      free_LL(oSymTable->table[i]);
   }
}

size_t SymTable_getLength(SymTable_T oSymTable);

int SymTable_put(SymTable_T oSymTable,
                 const char *pcKey, const void *pvValue);

void *SymTable_replace(SymTable_T oSymTable,
                       const char *pcKey, const void *pvValue);

int SymTable_contains(SymTable_T oSymTable, const char *pcKey);

void *SymTable_get(SymTable_T oSymTable, const char *pcKey);

void *SymTable_remove(SymTable_T oSymTable, const char *pcKey);

void SymTable_map(SymTable_T oSymTable,
     void (*pfApply)(const char *pcKey, void *pvValue, void *pvExtra),
     const void *pvExtra);


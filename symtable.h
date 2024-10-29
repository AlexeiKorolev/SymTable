/* 
 * symtable.h
 * Author: Alexei Korolev
 */

#include <stdio.h>

/* A SymTable_T is a pointer to a struct SymTable */
typedef struct SymTable *SymTable_T;

/* Creates a SymTable struct and returns a pointer to it
   if memory allocation is successful. Otherwise, returns NULL */
SymTable_T SymTable_new(void);

/* Frees all memory allocated by oSymTable. Does not free stored value
   pointers. */
void SymTable_free(SymTable_T oSymTable);

/* Returns the number of key-value pairs currently in oSymTable */
size_t SymTable_getLength(SymTable_T oSymTable);

/* Attempts to place the key-value pair pcKey and pvValue into
oSymTable. Creates a defensive copy of pcKey. Fails if pcKey 
already exists in oSymTable. Fails if memory allocation fails.
Returns 1 if successful, returns 0 otherwise and keeps oSymTable
unchanged */
int SymTable_put(SymTable_T oSymTable,
                 const char *pcKey, const void *pvValue);

/* Attempts to replace the value of pcKey in oSymTable with pvValue.
Returns the original value if successful, and NULL otherwise. If
pcKey does not exist within oSymTable, then returns NULL */
void *SymTable_replace(SymTable_T oSymTable,
                       const char *pcKey, const void *pvValue);

/* Returns 1 if pcKey exists within oSymTable, and 0 otherwise. Does
   not alter oSymTable */
int SymTable_contains(SymTable_T oSymTable, const char *pcKey);

/* Returns the value associated to pcKey in oSymTable. If pcKey does 
   not exist within oSymTable, returns NULL */ 
void *SymTable_get(SymTable_T oSymTable, const char *pcKey);

/* Attempts to remove the key pcKey and its value from oSymTable. 
Returns the removed value if successful. Returns NULL if pcKey does
not exist within oSymTable */
void *SymTable_remove(SymTable_T oSymTable, const char *pcKey);

/* Applies the function pfApply to all key-value pairs in oSymTable.
pfApply should be defined to accept pcKey, pvValue, and a void *pvExtra
as parameters.*/
void SymTable_map(SymTable_T oSymTable,
     void (*pfApply)(const char *pcKey, void *pvValue, void *pvExtra),
     const void *pvExtra);

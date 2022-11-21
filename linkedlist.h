#include <stdio.h>
#include <string.h>
#include <stdlib.h>
#include <stdbool.h>

struct node {
   char* id;
   int isConst;
   struct node *next;
};

struct node *head = NULL;
struct node *current = NULL;

//display the list
void printList() {
   struct node *ptr = head;
   printf("\n[ ");
	
   //start from the beginning
   while(ptr != NULL) {
      printf("(%s,%d) ",ptr->id,ptr->isConst);
      ptr = ptr->next;
   }
	
   printf(" ]");
}

//insert link at the first location
void insert_id(char* id, int isConst) {
   //create a link
   struct node *link = (struct node*) malloc(sizeof(struct node));
	
   link->id = id;
   link->isConst = isConst;
	
   //point it to old first node
   link->next = head;
	
   //point first to new first node
   head = link;
}

int compare(char* a, char* b) {
  if(strlen(a) != strlen(b)) {
    return 0;
  }
  
  for(int i = 0; i < strlen(a); i++) {
    if(a[i] != b[i]) 
      return 0;
  }

  return 1;
}

//find a link with given key
struct node* find_id(char* idSearch) {

   //start from the first link
   struct node* current = head;

   //if list is empty
   if(head == NULL) {
      return NULL;
   }

   //navigate through list
   while(compare(current->id, idSearch) != 1) {
	
      //if it is last node
      if(current->next == NULL) {
         return NULL;
      } else {
         //go to next link
         current = current->next;
      }
   }      
	
   //if data found, return the current Link
   return current;
}
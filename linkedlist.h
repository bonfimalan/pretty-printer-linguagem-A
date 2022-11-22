#include <stdio.h>
#include <string.h>
#include <stdlib.h>
#include <stdbool.h>

struct node
{
	char *id;			// identificador
	int isConst;		// 1 caso constante/0 caso variavel
	struct node *next;	// ponteiro para o próximo nó a lista
};

struct node *head = NULL;		// ponteiro para o inicio da lista
struct node *current = NULL;	// ponteiro utilizado em pesquisas

// insere um símbolo na tabela de símbolos, recebendo o identificador, 1 caso constante ou 0 caso variavel
void insert_id(char *id, int isConst)
{
	// cria um novo nó
	struct node *link = (struct node *)malloc(sizeof(struct node));

	link->id = id;
	link->isConst = isConst;

	// o novo nó é colocado no inicio da lista
	link->next = head;

	// o ponteiro head passa a apontar para o o novo nó
	head = link;
}

// compara duas strings, retorna 1 se forem iguais ou 0 se forem diferentes
int compare(char *a, char *b)
{
	if (strlen(a) != strlen(b))
	{
		return 0;
	}

	for (int i = 0; i < strlen(a); i++)
	{
		if (a[i] != b[i])
			return 0;
	}

	return 1;
}

/*
	Busca um símbolo na tabela, recebendo um identificador como parâmetro.
	Retorna NULL caso o identificador não esteja na tabela
 */
struct node *find_id(char *idSearch)
{

	// começa pelo inicio da lista
	struct node *current = head;

	// se a lista for vazia
	if (head == NULL)
	{
		return NULL;
	}

	// navega pela lista
	while (compare(current->id, idSearch) != 1)
	{

		// se for o último node, ou seja, percorreu a lista toda e não encontrou o identificador
		if (current->next == NULL)
		{
			return NULL;
		}
		else
		{
			// vai para o próximo nó
			current = current->next;
		}
	}

	// retorna o nó, caso tenha sido encontrado
	return current;
}
%{
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
char temp[10],pun[10];
struct node {
char id[10], type[10];
struct node *next;
};
struct node *h = NULL, *p = NULL, *t = NULL;
%}
%%
int|float|char|double {
strcpy(temp, yytext);
}
[a-zA-Z][a-zA-Z0-9]* {
p = (struct node*)malloc(sizeof(struct node));
if (p == NULL) {
fprintf(stderr, "Overflow\n");
exit(1);
} else {
strcpy(p->type, temp);
strcpy(p->id, yytext);
p->next = NULL;
if (h == NULL) {
h = p;
} else {
t = h;
while (t->next != NULL) {
t = t->next;
}
t->next = p;
}
}
}
"," {strcpy(pun,yytext);}
";" {
p = h;
printf("ID\tData_Type\tAddress\n");
while (p != NULL) {
printf("%s\t%s\t\t%p\n", p->id, p->type, (void*)p);
p = p->next;}
}
%%
int main() {
yylex();
return 0;
}

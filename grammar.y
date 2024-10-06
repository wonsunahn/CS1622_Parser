%{
#include  <stdio.h>
#include  "proj2.h"

static void yyerror(char *str);

tree SyntaxTree;

/* TODO: Add variable definitons as needed. */

%}

%union {
  int intg;
  tree tptr;
}

/* Terminal (token) declarations */
%token <intg>  PROGRAMnum IDnum SEMInum CLASSnum  DECLARATIONSnum  ENDDECLARATIONSnum
%token <intg>  COMMAnum EQUALnum LBRACEnum RBRACEnum LBRACnum RBRACnum LPARENnum RPARENnum VOIDnum
%token <intg>  INTnum METHODnum VALnum DOTnum ASSGNnum RETURNnum IFnum ELSEnum WHILEnum
%token <intg>  LTnum LEnum EQnum NEnum GEnum GTnum PLUSnum MINUSnum ORnum TIMESnum DIVIDEnum ANDnum
%token <intg>  NOTnum ICONSTnum SCONSTnum

/* Non-terminal (tree node) declarations */
%type  <tptr>  Program ClassDecl_rec ClassDecl ClassBody MethodDecl_z1 MethodDecl_rec Decls
%type  <tptr>  FieldDecl_rec FieldDecl Tail FieldDecl_body VariableDeclId Bracket_rec1 Bracket_rec2
%type  <tptr>  VariableInitializer ArrayInitializer ArrayInitializer_body  ArrayCreationExpression
%type  <tptr>  ArrayCreationExpression_tail MethodDecl FormalParameterList_z1 FormalParameterList
%type  <tptr>  FormalParameterList_rec IDENTIFIER_rec Block Type Type_front 
%type  <tptr>  StatementList Statement_rec Statement AssignmentStatement MethodCallStatement
%type  <tptr>  MethodCallStatement_tail Expression_rec ReturnStatement IfStatement If_rec WhileStatement
%type  <tptr>  Expression Comp_op SimpleExpression Term Factor Expression_rec2
%type  <tptr>  UnsignedConstant Variable Variable_tail Variable_rec Variable_1 


%%

/* TODO: Add grammar rules and semantic actions for each non-terminal. */

%%

int yycolumn, yyline;

FILE *treelst;

/* Test driver main function for the parser. */
int main()
{
  treelst = stdout;
  yyparse();
  printtree(SyntaxTree, 0);
  return 0;
}

void yyerror(char *str)
{
  printf("yyerror: %s at line %d\n", str, yyline);
}

#include "lex.yy.c"



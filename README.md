- [Project 1: Lexical Analysis](#project-1--lexical-analysis)
  * [Description](#description)
  * [Codespace Development Environment](#codespace-development-environment)
  * [Directory Structure and Makefile Script](#directory-structure-and-makefile-script)
  * [Implementation](#implementation)
    + [Token Definitions in MINI-JAVA](#token-definitions-in-mini-java)
    + [Completing lex.l](#completing-lexl)
    + [Completing table.cpp](#completing-tablecpp)
    + [Debugging](#debugging)
  * [Grading](#grading)
  * [Submission](#submission)

# Project 2: Syntax Analysis

DUE: November 7 (Thursday), 2024 Before Class

Please accept Project 2 on **GitHub Classroom** using the following link: TBD

The GitHub Classroom repository works the same way as your Project 1 repository.

## Description

In this phase of the project, you will write a lexical analyzer for the CS 1622
programming language, MINI-JAVA. The analyzer will consist of a scanner,
written in LEX, and routines to manage a string table, written in C/C++. The
next phase of the compiler project, syntax analysis, will use tokens generated
by lexical analysis to construct the syntax tree.

Please follow the below instructions.

## Codespace Development Environment

Please refer to the Project 1 CodeSpace Development Environment section to set
up the same development environment.

Once you install flex, you should be able to build the parser binary by invoking
the build target of the Makefile script on the terminal:

```
make build
```

This should result in the following output:

```
$ make build
flex lex.l 
yacc -d -v  grammar.y 
gcc -g -c y.tab.c
gcc -g -c proj2.c
g++ -g -c table.cpp
gcc -g -c driver.c
gcc -g -o parser y.tab.o proj2.o table.o driver.o -ll -lstdc++
```

After creating the parser binary, you are able to use the Debugger menu to step
through the code, put breakpoints, just like for Project 1.  Refer to the
[Debugging] section for more details.

## Directory Structure and Makefile Script

Here is an overview of the directory structure in alphabetical order.  The files that you are expected to modify are marked in bold:

* driver.c : The test driver for the parser that contains the main function.
* **lex.l** : Implements the lexer using the Lex language.  **Modify**.
* Makefile: The build script for the make tool.
* **table.cpp** : Implements the string table.  **Modify**.
* token.h / token.c : #define macros for token types and the getTokenString function.
* diffs_default/ : Directory where comparisons between outputs/ and outputs_solution/ are stored, generated by the <tt>diff</tt> command.
* diffs_side_by_side/ : Directory where side-by-side comparisons between outputs/ and outputs_solution/ are stored, generated by the <tt>diff</tt> command with the <tt>-y</tt> option added.
* outputs/ : Directory where outputs after running your parser on source files under tests/ are stored.
* outputs_solution/ : Directory where solution outputs after running the reference parser on source files under tests/ are stored.
* tests/ : Source files for testing and grading your parser.

As mentioned above, in order to just build the parser binary, you only need to invoke the build make target:

```
make build
```

To run the parser against the source files under tests/ after building, invoke the default make target:

```
make
```

The make script generates outputs and diffs in exactly the same way as in
Project 1.  If you wish to remove all files generated from the make script and
start from scratch, invoke the 'clean' target:

```
make clean
```

## Implementation

Your goal is to modify lex.l, table.cpp, and grammar.y so that your outputs are
identical to the solution outputs.  If you achieve that, the make build script
will show no errors when invoked, and all the .diff files under diffs_default/
will be empty when listed, just like for Project 1.

You will achieve this by replacing the TODO comments in the source files as
instructed in the comments.

### Completing lex.l


### Completing table.cpp


### Debugging

You can click on the Debugger menu on the VSCode IDE to get to the RUN AND
DEBUG pane.  There you will see a play icon next to a drop box with <tt>Launch parser</tt>
selected.  You can click on that play icon to start debugging.  The
<tt>Launch parser</tt> selection is a launch configuration defined in the
[.vscode/launch.json](.vscode/launch.json) file.  In that file, you will see
that the <tt>args</tt> property is set with an input redirection to
<tt>${workspaceFolder}/tests/helloworld.mjava</tt>.  If you wish to debug with some
other input file, please change helloworld.mjava to some other .mjava file
under the tests/ folder.

If you are not familiar with VSCode debugging, here is a tutorial:
https://code.visualstudio.com/docs/editor/debugging

Note that you are not allowed to put breakpoints on lex.l, because it is not a
C/C++ source file.  However, you can put breakpoints on lex.yy.c that is
generated from lex.l.

## Grading

Each of the 12 tests under the tests/ folder is worth 10 points for a total of
120 points.  A diff failure on the output for one of these .mjava files will
result in a deduction of 10 points.

## Submission

When all tests pass, you are ready to submit.  Please submit your GitHub
Classroom repository to GradeScope at the "Project 2" link.  Once you submit,
GradeScope will run the autograder to grade you and give feedback.  If you get
deductions, fix your code based on the feedback and resubmit.  Repeat until you
don't get deductions.  The tests performed on GradeScope is identical to the
tests under the tests/ folder.

Don't forget that you have to Commit and Push your changes to upload them to
the repository.  Please review this tutorial if you don't remember how:

https://docs.github.com/en/codespaces/developing-in-a-codespace/using-source-control-in-your-codespace#committing-your-changes

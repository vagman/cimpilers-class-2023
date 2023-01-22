### Compilers Class - Assignment February 2023

In a subset of natural language, the names of points in space are defined as the string of a single symbol, line names are defined as two symbols, triangle names are defined as three symbols, etc. up to the case of octagons. Repeating a symbol isn't allowed. Design and build Flex program that will only accept the correct definitions. 

Examples of correct definitions:
* triangle BCD
* square BCDA

Examples of incorrect definitions: 
* square AB
* triangle AAD
* corner BC

Accepted programming languages: FLEX (combined with C/C++).

### Run
 ~ ```lex exercise_3.l```
 
 ~ ```gcc lex.yy.c```
 
 ~ ```a.out```
 
 ![](https://github.com/vagman/compilers-class-2023/blob/main/output/example1.png)
 
 ![](https://github.com/vagman/compilers-class-2023/blob/main/output/example2.png)
 
 ### Genral Info
* [Windows Subsystem Linux 2](https://learn.microsoft.com/en-us/windows/wsl/install) (WSL)
* [Flex](https://askubuntu.com/questions/164293/how-to-install-flex): v.2.6.4
* VS Code [Lex Extension](https://marketplace.visualstudio.com/items?itemName=luniclynx.lex) that I found really helpful.


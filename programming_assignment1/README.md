This file just for tell how this works.
I tried to do this assignment by using awk.
Awk is powerful tool to files larger amount of files.

build_easy.sh bash is used to find all .c files among all directories one by one recursively.
awk runs for each file.

To keep it general for any source code it matches and picks up first block of comment
which is generally description of file.

we can execute it by: 
./build_easy /path of source code/

I have used sqlite-master/ open source source code.
Folder contains sample source codes of nasm assemblers and sqlite
their paths can be passed to get description file.

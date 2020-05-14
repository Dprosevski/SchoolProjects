CFLAGS = -O
CC = g++ -std=c++11

RunAll: main.o bTree.o linkedList.o
	$(CC) $(CFLAGS) -o RunAll main.o bTree.o linkedList.o

main.o: main.cpp
	$(CC) $(CFLAGS) -c main.cpp

bTree.o: bTree.cpp
	$(CC) $(CFLAGS) -c bTree.cpp

linkedList.o: linkedList.cpp
	$(CC) $(CFLAGS) -c linkedList.cpp
	
clean:
	rm -f core *.o 
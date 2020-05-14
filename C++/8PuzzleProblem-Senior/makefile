CFLAGS = -O
CC = g++ -std=c++11

RunCode: Source.o Node.o
	$(CC) $(CFLAGS) -o RunCode Source.o Node.o

main.o: Source.cpp
	$(CC) $(CFLAGS) -c Source.cpp

bTree.o: Node.cpp
	$(CC) $(CFLAGS) -c Node.cpp
	
clean:
	rm -f core *.o 
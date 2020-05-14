CFLAGS = -O
CC = g++ -std=c++11

RunAll: main.o
	$(CC) $(CFLAGS) -o RunAll main.o

main.o: main.cpp
	$(CC) $(CFLAGS) -c main.cpp
	
clean:
	rm -f core *.o 
COMPILER = dmd

LDFLAGS ?= -g 

all: chess

release: $(OBJS)
	$(COMPILER) $(LDFLAGS) -o $(EXECUTABLE) $(OBJS) $(LDLIBS) 

clean:
	rm -f *.o
	rm -f Chess

chess:
	as ./src/handler.s
	mv a.out bruh.o
	dmd ./src/Chess.d ./src/engine/Piece.d ./src/engine/Board.d ./src/engine/Player.d ./src/LocalPlayer.d ./src/server/Server.d ./src/server/NetworkPlayer.d ./src/server/NetworkGame.d ./src/engine/Game.d ./src/LocalGame.d bruh.o

COMPILER = dmd

LDFLAGS ?= -g 

all: chess

release: $(OBJS)
	$(COMPILER) $(LDFLAGS) -o $(EXECUTABLE) $(OBJS) $(LDLIBS) 

clean:
	rm -f *.o
	rm -f Chess

chess:
	gcc ./src/handler.c -shared -fPIC -o hand.o
	echo "Generated shared library"
	dmd ./src/Chess.d ./src/engine/Piece.d ./src/engine/Board.d ./src/engine/Player.d ./src/LocalPlayer.d ./src/server/Server.d ./src/server/NetworkPlayer.d ./src/server/NetworkGame.d ./src/engine/Game.d ./src/LocalGame.d hand.o
	echo "Compiled and linked shared library-loader code"
	rm Chess.o
	echo "Cleaned"

chessClient:
	dmd ./src/ChessClient.d
module Chess;

import std.stdio;
import std.conv;
import std.string;
import Board;
// import server.Server;

void main() {
	string move;
	Board game = new Board();

	bool isServer = false;

	if (isServer)
	{
		// Server gameServer = new Server(cast(char[])"", 6969);
	}
	else
	{
		while (true) {
			write(game);
			write("Enter Move: ");
			move = strip(stdin.readln());
			game.make_move(move);
			writeln("\n###########\n");
		}
	}
	
}

import std.stdio;
import std.conv;
import std.string;
import Board;

void main() {
	string move;
	Board game = new Board();

	while (true) {
		write(game);
		write("Enter Move: ");
		move = strip(stdin.readln());
		if (!game.make_move(move)) {
			writeln("Invalid move!");
		}
		writeln("\n###########\n");
	}
}

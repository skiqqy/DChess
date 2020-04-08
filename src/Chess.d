import std.stdio;
import std.conv;
import std.string;
import Board;

void main() {
	string move;
	Board game = new Board();

	while (1) {
		write(game.toString);
		write("Enter Move: ");
		move = strip(stdin.readln());
		game.make_move(move);
		writeln("\n###########\n");
	}
}

import std.stdio;
import std.conv;
import std.string;
import Board;

void poes(int[] f)
{
	f[0] = 6;
	f.leghth++;
}

void main() {
	string move;
	Board game = new Board();

	int[2] f;
	writeln(f);
	poes(f);
	writeln(f);

	while (true) {
		write(game);
		write("Enter Move: ");
		move = strip(stdin.readln());
		game.make_move(move);
		writeln("\n###########\n");
	}
}

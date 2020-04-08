import std.stdio;
import std.conv;
import std.ascii;

class Piece {
	char piece;
	int color;
	
	this(char piece, int color) {
		this.piece = piece;
		this.color = color;
	}

	override string toString() {
		string c;
		if (color == 1) {
			return to!(string)(this.piece);
		} else {
			return to!(string)(toUpper(this.piece));
		}
	}
}

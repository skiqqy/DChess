import std.stdio;
import std.conv;
import std.ascii;
import Player : Color;

class Piece {
	char piece;
	private Color color;
	
	this(char piece, Color color) {
		this.piece = piece;
		this.color = color;
	}

	char getP() {
		return this.piece;
	}

	int getPC() {
		return this.color;
	}

	int is_enemy(int color) {
		if (this.color == 2) {
			return 0;
		} else if (this.color != color) {
			return 1;
		} else {
			return 0;
		}
	}

	override string toString() {
		string c;
		if (color == 1 || color == 2) {
			return to!(string)(this.piece);
		} else {
			return to!(string)(toUpper(this.piece));
		}
	}
}

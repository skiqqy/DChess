import std.stdio;
import std.conv;
import Piece;

class Board {
	Piece[8][8] board;

	this() {
		//int of the board
		int i, j;

		for (i = 0; i < 8; i++) {
			for (j = 0; j < 8; j++) {
				board[i][j] = null;
			}
		}

		for (i = 0; i < 8; i++) {
			board[1][i] = new Piece('p', 1);//black pawn
			board[6][i] = new Piece('p', 0);//white pawn
		}
	}

	override string toString() {
		string s = "";
		int i, j;
		for (i = 0; i < 8; i++) {
			for (j = 0; j < 8; j++) {
				if (board[i][j]) {
					s = s ~ board[i][j].toString;
				} else {
					s = s ~ '.';
				}
			}
			s = s ~ '\n';
		}

		return s;
	}
}

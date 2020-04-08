import std.stdio;
import std.conv;
import Piece;

class Board {
	Piece[8][8] board;

	this() {
		//init of the board
		int i, j;
		char[8] ps = ['c', 'h', 'b', 'q', 'k', 'b', 'h', 'c'];

		for (i = 0; i < 8; i++) {
			for (j = 0; j < 8; j++) {
				board[i][j] = new Piece('.', 2);
			}
		}

		for (i = 0; i < 8; i++) {
			board[1][i] = new Piece('p', 1);//bpawn
			board[6][i] = new Piece('p', 0);//wpawn
			board[0][i] = new Piece(ps[i], 1);//set black piece;
			board[7][i] = new Piece(ps[i], 0);// set white piece;
		}
	}

	override string toString() {
		string s = "";
		int i, j;
		for (i = 0; i < 8; i++) {
			for (j = 0; j < 8; j++) {
				s = s ~ board[i][j].toString;
			}
			s = s ~ '\n';
		}

		return s;
	}
}

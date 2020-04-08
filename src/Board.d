module Board;

import std.stdio;
import std.conv;
import std.string : split;
import Piece;

class Board {
	private Piece[8][8] board;
	private int curr_player;

	this() {
		//init of the board
		int i, j;
		char[8] ps = ['c', 'h', 'b', 'q', 'k', 'b', 'h', 'c'];
		
		this.curr_player = 0;
		for (i = 0; i < 8; i++) {
			for (j = 0; j < 8; j++) {
				this.board[i][j] = new Piece('.', 2);
			}
		}

		for (i = 0; i < 8; i++) {
			this.board[1][i] = new Piece('p', 1);//bpawn
			this.board[6][i] = new Piece('p', 0);//wpawn
			this.board[0][i] = new Piece(ps[i], 1);//set black piece;
			this.board[7][i] = new Piece(ps[i], 0);// set white piece;
		}
	}

	string get_curr_player_s() {
		if (this.curr_player) {
			return "Black";
		} else {
			return "White";
		}
	}

	int get_curr_player_i() {
		return this.curr_player;
	}

	int get_opp() {
		if (this.curr_player) {
			return 0;
		} else {
			return 1;
		}
	}

	/* Takes in an array (static of size 4) and treats
	* it as dynamically (no resizes so aliasing works)
	* and then gets the moves.
	*/
	void translate_move(string move_s, int[] move_i) {
		byte k = 0;
		foreach (string move; split(move_s, ""))
		{
			move_i[k] =  to!(int)(to!(char)(move));
			k++;
		}
	}

	void make_move(string move_s) {
		//make the move;
		int[4] move;
		translate_move(move_s, move);
		writeln(move);
		this.curr_player = get_opp();
	}

	override string toString() {
		string s = "Turn: " ~ get_curr_player_s ~ '\n';
		int i, j;
		string l_index = " |ABCDEFGH|\n";
	
		s ~= l_index;
		s ~= "------------\n";
		for (i = 0; i < 8; i++) {
			s ~= to!(string)(8-i) ~ '|';
			for (j = 0; j < 8; j++) {
				s ~= board[i][j].toString;
			}
			s ~= '|' ~ to!(string)(8-i) ~ '\n';
		}
		s ~= "------------\n";
		s ~= l_index;

		return s;
	}
}

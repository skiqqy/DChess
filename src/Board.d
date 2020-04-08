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

	void translate_move(string move_s, int[] move_i) {
		string[] bruh = split(move_s, "");
		writeln("Moves: ", bruh[0]);

		int[4] moveCharacters; 
		byte k = 0;
		foreach (string move; bruh)
		{
			move_i[k] =  to!(int)(    to!(char)(move));
			k++;
		}

		
		

		// char[] move_c = to!(char[])(split(move_s, ""));
		// int i;
		// char[] c_off = ['A','B','C','D','E','F','G','H'];
		// writeln(move_c);

		// move_i[0] = to!(int)(move_c[0]);//xi
		// move_i[1] = to!(int)(move_c[1]);//yi
		// move_i[2] = to!(int)(move_c[2]);//xf
		// move_i[3] = to!(int)(move_c[3]);//yf
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

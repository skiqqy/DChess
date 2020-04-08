module Board;

import std.stdio;
import std.conv;
import std.string : split;
import Piece;
import Player : Color;

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
				this.board[i][j] = new Piece('.', Color.EMPTY);
			}
		}

		for (i = 0; i < 8; i++) {
			this.board[1][i] = new Piece('p', Color.BLACK);//bpawn
			this.board[6][i] = new Piece('p', Color.WHITE);//wpawn
			this.board[0][i] = new Piece(ps[i], Color.BLACK);//set black piece;
			this.board[7][i] = new Piece(ps[i], Color.WHITE);// set white piece;
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
			if (k % 2 == 0) {
				move_i[k] -= 65;
			} else {
				move_i[k] -= 49;
				move_i[k] = 7 - move_i[k];
			}
			k++;
		}
	}

	bool make_move(string move_s) {
		//make the move;
		int[4] move;
		int flag;
		Piece p;
		translate_move(move_s, move);
		flag = legal_move(move);

		if (flag) {
			this.curr_player = get_opp();
			board[move[3]][move[2]] = board[move[1]][move[0]];
			board[move[1]][move[0]] = new Piece('.', Color.EMPTY);
			return true;
		} else {
			return false;
		}
	}

	int legal_move(int[] move) {
		int flag = 1;
		Piece p;
		if (move[0] > 7 || move[0] < 0 || move[1] > 7 || move[1] < 0 ||
			move[2] > 7 || move[2] < 0 || move[3] > 7 || move[3] < 0) {
			return 0;//move is out  of  bounds
		} else if (board[move[1]][move[0]].getP == '.') {
			return 0;//move is selecting an empy block
		}
		
		p = board[move[1]][move[0]];

		//////////////////////////////////////////
		if (p.getP == 'p') {
			int m, md;
			if (p.getPC) {
				m = 1;//bp
				md = 1;
				if (move[1] == 1) {
					md = 2;
				}
			} else {
				m = -1;
				md = -1;
				if (move[1] == 6) {
					md = -2;
				}
			}

			if (move[0] == move[2] &&
				(move[1] + m == move[3] || move[1] + md == move[3]) &&
				board[move[3]][move[2]].getP == '.') {
				flag = 1;
			} else {
				//could be taking enemy piece;
				int lt = -1, rt = 1;
				if ((move[0] + lt == move[2] || move[0] + rt == move[2]) &&
					 move[1] + m == move[3] &&
					 board[move[3]][move[2]].is_enemy(p.getPC)) {
					flag = 1;
				} else {
					flag = 0;
				}
			}
		}
		//////////////////////////////////////////
		return flag;
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

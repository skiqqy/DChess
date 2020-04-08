module Chess;

import std.stdio;
import std.conv;
import std.string;
import Board;
// import server.Server;
import LocalPlayer;
import Player;

void main() {
	

	/* For a local game */
	playGame(new LocalPlayer(Color.BLACK), new LocalPlayer(Color.WHITE));

	
}

void playGame(Player player1, Player player2)
{
	string move;
	Board game = new Board();
	Player currentPlayer = player1;

	while (true) {
			write(game);
			write("Enter Move: ");
			move = currentPlayer.getNextMove();
			game.make_move(move);
			writeln("\n###########\n");
			
			if(currentPlayer == player1)
			{
				currentPlayer = player2;
			}
			else
			{
				currentPlayer = player1;
			}
		}
}

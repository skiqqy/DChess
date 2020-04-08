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
	playGame([new LocalPlayer(Color.BLACK), new LocalPlayer(Color.WHITE)]);

	
}

void playGame(Player[] players)
{
	string move;
	Board game = new Board();
	Player currentPlayer = players[0];

	while (true) {
			write(game);
			write("Enter Move: ");
			move = currentPlayer.getNextMove();
			game.make_move(move);
			writeln("\n###########\n");
			
			switchPlayer(currentPlayer, players);
		}
}

void switchPlayer(ref Player currentPlayer, Player[] players)
{
	if(currentPlayer == players[0])
	{
		currentPlayer = players[1];
	}
	else
	{
		currentPlayer = players[0];
	}
}

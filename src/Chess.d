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
			askMove:
				write("Enter Move: ");
				move = currentPlayer.getNextMove();
				
				/* Make the move and check if it is valid */
				bool moveResult = game.make_move(move);

			/* If the move is invalid, prompt for it again */
			if(!moveResult)
			{
				goto askMove;
			}

			writeln("\n###########\n");
			
			/* Switch players */
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

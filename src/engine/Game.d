module engine.Game;

import std.stdio;
import std.conv;
import std.string;
import engine.Board;
// import server.Server;
import LocalPlayer;
import server.NetworkPlayer;
import server.Server;
import engine.Player;
import engine.Game;


public class Game
{
    /* The players of the game */
    protected Player[] players;

    this(Player[] players)
    {
        this.players = players;
    }

    this() {}

    abstract void pregameInit();

    /* Plays the game */
    void playGame()
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

    private void switchPlayer(ref Player currentPlayer, Player[] players)
    {
        /* Alternate players */
        currentPlayer == players[0] ? currentPlayer = players[1] : currentPlayer = players[0];
    }
}
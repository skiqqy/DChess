module Chess;

import std.stdio;
import std.conv;
import std.string;
// import server.Server;
import LocalPlayer;
import server.NetworkPlayer;
import server.Server;
import engine.Player;
import engine.Game;
import server.NetworkGame;
import LocalGame;
import core.stdc.signal;

extern(C) void signalHandler(int) nothrow @nogc @system;

void main()
{
	/* The game to be played */
	Game game;

	bool isNetworked = true;

	/* Set SIGINT handler */
	signal(SIGINT, &signalHandler);
	

	if(isNetworked)
	{
		/* Create a new NetworkGame object to represent the network version of the game */
		game = new NetworkGame("127.0.0.1", 6969);
	}
	else
	{
		/* For a local game */
		game = new LocalGame([new LocalPlayer(Color.BLACK), new LocalPlayer(Color.WHITE)]);
	}
	
	/* Initialize the gme */
	game.preGameInit();

	/* Start the game */
	game.playGame();

	/* Clean up the game */
	game.postGameCleanUp();
}
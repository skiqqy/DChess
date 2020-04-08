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

extern(C) void bruh(int) nothrow @nogc @system;

public void test()
{
	writeln("Bitch");
}

void main()
{

	/* The game to be played */
	Game game;

	bool isNetworked = false;

	/* Set SIGINT handler */
	signal(SIGINT, &bruh);
	

	if(isNetworked)
	{
		/* Networked game */
		game = new NetworkGame(cast(char[])"127.0.0.1", 6969, [new NetworkPlayer(null, Color.BLACK), new NetworkPlayer(null, Color.WHITE)]);
		
	}
	else
	{
		/* For a local game */
		game = new LocalGame([new LocalPlayer(Color.BLACK), new LocalPlayer(Color.WHITE)]);
	}
	
	game.playGame();
	
}
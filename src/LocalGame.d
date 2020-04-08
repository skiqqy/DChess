module LocalGame;

import engine.Game;
import engine.Player;
import std.stdio;

public class LocalGame : Game
{
    this(Player[] players)
    {
        super(players);
    }

    override void preGameInit()
    {
        writeln("TODO: Nothing");
    }

    override void postGameCleanUp()
    {
        writeln("TODO: Nothing");
    }
}
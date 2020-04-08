module server.NetworkPlayer;

import Player;
import std.socket;

public class NetworkPlayer : Player
{
    this(Socket clientConnection, Color color)
    {
        super(color);
    }

    override string getNextMove()
    {
        return "TODO";
    }
}
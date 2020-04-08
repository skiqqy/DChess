module server.NetworkGame;

import engine.Game;
import server.NetworkPlayer;
import server.Server;
import engine.Player;

public class NetworkGame : Game
{
    this(char[] address, ushort port)
    {
        super(cast(Player[])players);
    }
}
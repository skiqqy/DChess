module server.NetworkGame;

import engine.Game;
import server.NetworkPlayer;
import engine.Player;

public class NetworkGame : Game
{
    this(char[] address, ushort port, NetworkPlayer[] players)
    {
        super(cast(Player[])players);
    }
}
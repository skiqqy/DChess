module server.Server;

import std.socket;
import core.thread;
import std.conv;
import server.NetworkPlayer;
import engine.Player;

class Server
{

    private Socket serverSocket = null;

    private Player[] players;

    public void start()
    {
        /* Get two connections */
        players[0] = new NetworkPlayer(serverSocket.accept(), Color.WHITE);
        players[1] = new NetworkPlayer(serverSocket.accept(), Color.BLACK);
    }

    this(char[] address, ushort port)
    {
        /* Setup the Socket */
        serverSocket = new Socket(AddressFamily.INET, SocketType.STREAM, ProtocolType.TCP);
        serverSocket.bind(parseAddress(cast(string)(address~to!(char[])(port))));
        serverSocket.listen(2);
    }
    

}
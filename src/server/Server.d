module server.Server;

import std.socket;
import core.thread;
import std.conv;
import server.NetworkPlayer;
import engine.Player;

public class Server
{

    /* The server socket */
    private Socket serverSocket = null;

    private Player[] players;

    public void start()
    {
        /* Get two connections */
        writeln("Waiting for player 1...");
        players[0] = new NetworkPlayer(serverSocket.accept(), Color.WHITE);
        writeln("Waiting for player 2...");
        players[1] = new NetworkPlayer(serverSocket.accept(), Color.BLACK);
        writeln("All players arrived");
    }

    this(char[] address, ushort port)
    {
        /* Setup the Socket */
        serverSocket = new Socket(AddressFamily.INET, SocketType.STREAM, ProtocolType.TCP);
        serverSocket.bind(parseAddress(cast(string)(address~to!(char[])(port))));
        serverSocket.listen(2);
    }
    

}
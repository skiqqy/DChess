module server.Server;

import std.socket;
import core.thread;
import std.conv;
import server.Player;

class Server
{

    private Socket serverSocket = null;

    private Player[] players;

    public void start()
    {
        /* Get two connections */
        players[0] = new Player(serverSocket.accept());
        players[1] = new Player(serverSocket.accept());
    }

    this(char[] address, ushort port)
    {
        /* Setup the Socket */
        serverSocket = new Socket(AddressFamily.INET, SocketType.STREAM, ProtocolType.TCP);
        serverSocket.bind(parseAddress(cast(string)(address~to!(char[])(port))));
        serverSocket.listen();
    }
    

}
module server.NetworkGame;

import engine.Game;
import server.NetworkPlayer;
import server.Server;
import engine.Player;
import std.socket;
import core.thread;
import std.conv;
import server.NetworkPlayer;
import engine.Player;
import std.stdio;


public class NetworkGame : Game
{

    /* The server socket */
    private Socket serverSocket = null;

    this(string address, ushort port)
    {
        /* Setup the Socket */
        serverSocket = new Socket(AddressFamily.INET, SocketType.STREAM, ProtocolType.TCP);
        // serverSocket.bind(parseAddress(cast(string)(address~ cast(char[])to!(char[])(port))));
        serverSocket.bind(parseAddress(address~to!(string)(port)));
        serverSocket.listen(2);
    }

    override void pregameInit()
    {
        /* Setup `players` */
        players = new Player[2];
        
        /* Get two connections */
        writeln("Waiting for player 1...");
        players[0] = new NetworkPlayer(serverSocket.accept(), Color.WHITE);
        writeln("Waiting for player 2...");
        players[1] = new NetworkPlayer(serverSocket.accept(), Color.BLACK);
        writeln("All players arrived");
    }


}
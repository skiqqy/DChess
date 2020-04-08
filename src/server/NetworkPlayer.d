module server.NetworkPlayer;

import engine.Player;
import std.socket;
import std.stdio;

public class NetworkPlayer : Player
{
    private Socket clientConnection;

    this(Socket clientConnection, Color color)
    {
        super(color);
        this.clientConnection = clientConnection;
    }

    override string getNextMove()
    {
        writeln("Getting next move, blocked....");
        /* Protocol is 1 byte (size), then string of that length */
        byte[1] sizeBuffer;
        writeln("d");
        clientConnection.receive(sizeBuffer, SocketFlags.PEEK);
        writeln("fdjkhfdkjhfjdk");

        /* Read sizeBuffer many bytes */
        byte[] moveBuffer;
        moveBuffer.length+=sizeBuffer[0]+1;
        clientConnection.receive(moveBuffer);
        moveBuffer = moveBuffer[1..moveBuffer.length];

        return cast(string)moveBuffer;
    }
}
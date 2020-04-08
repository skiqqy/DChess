module server.NetworkPlayer;

import Player;
import std.socket;

public class NetworkPlayer : Player
{
    private Socket clientConnection;

    this(Socket clientConnection, Color color)
    {
        super(color);
    }

    override string getNextMove()
    {
        /* Protocol is 1 byte (size), then string of that length */
        byte[1] sizeBuffer;
        clientConnection.receive(sizeBuffer, SocketFlags.PEEK);

        /* Read sizeBuffer many bytes */
        byte[] moveBuffer;
        moveBuffer.length+=sizeBuffer[0]+1;
        clientConnection.receive(moveBuffer);
        moveBuffer = moveBuffer[1..moveBuffer.length];

        return cast(string)cast(char[])moveBuffer;
    }
}
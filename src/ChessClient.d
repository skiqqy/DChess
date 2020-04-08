module ChessClient;

import std.stdio;
import std.conv : to;
import std.socket;

void main()
{
    /* Get the address */
    string address = stdin.readln();
    address = address[0..address.length-1];
    // writeln(cast(byte[])address);

    /* Get the port */
    string port = stdin.readln();
    port = port[0..port.length-1];
    ushort portNumber = to!(ushort)(port);

    writeln("using address "~address~" and port "~port);

    Socket socket = new Socket(AddressFamily.INET, SocketType.STREAM, ProtocolType.TCP);
    socket.connect(parseAddress(address, portNumber));
}
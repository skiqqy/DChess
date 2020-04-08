module LocalPlayer;

import Player;
import std.stdio : stdin;
import std.string : strip;

/* Normal on-machine player */
public class LocalPlayer : Player
{
    this(Color d)
    {
        super(d);
        d++;
    }

    override string getNextMove()
    {
        return strip(stdin.readln());
    }
}
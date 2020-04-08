module LocalGame;

import engine.Game;
import Player;

public class LocalGame : Game
{
    this(Player[] players)
    {
        super(players);
    }
}
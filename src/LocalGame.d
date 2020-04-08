module LocalGame;

import engine.Game;
import engine.Player;

public class LocalGame : Game
{
    this(Player[] players)
    {
        super(players);
    }
}
module Player;

/* The color of the player */
    enum Color
    {
        WHITE,
        BLACK
    }

/* Represents a Player */
public class Player
{
    

    /* The player's color */
    private Color playerColor;

    this(Color color)
    {
        /* Set the color of the player */
        this.playerColor = color;
    }

    abstract string getNextMove();
}
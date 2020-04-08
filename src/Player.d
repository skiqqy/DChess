module Player;

/* Represents a Player */
public class Player
{
    /* The color of the player */
    enum Color
    {
        WHITE,
        BLACK
    }

    /* The player's color */
    private Color playerColor;

    this(Color color)
    {
        /* Set the color of the player */
        this.playerColor = color;
    }



}
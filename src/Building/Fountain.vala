public class Brutus.Fountain : Brutus.Building {
    private static Gdk.Pixbuf sprite;
    construct {
        if (sprite == null) {
            try {
                sprite = new Gdk.Pixbuf.from_file_at_size ("%s/sprites/fountain.svg".printf (Build.BRUTUSDIR), 2*TILE_WIDTH, -1);
            } catch (Error e) {
                critical (e.message);
            }
        }
    }

    public override void draw (Cairo.Context cr) {
        int mapHeight = support.container.mapHeight;
        int a = support.x * TILE_WIDTH - support.y * TILE_WIDTH; /* offset x */
        int b = support.x * TILE_HEIGHT + support.y * TILE_HEIGHT; /* offset y */
        
        Gdk.cairo_set_source_pixbuf (cr, sprite, mapHeight * TILE_WIDTH + a - sprite.width/2, 2 * TILE_HEIGHT + b - sprite.height);
        cr.paint ();
    }

    public override int get_real_height () {
        return sprite.height;
    }

    public override void build (Brutus.Tile support) {
        if (this.support != null) {
            critical ("Already built!");
            return;
        }

        this.support = support;
    }
}

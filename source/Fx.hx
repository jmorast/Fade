package ;
 
import org.flixel.FlxSprite;
import org.flixel.FlxG;
import nme.Lib;
import org.flixel.FlxParticle;
import org.flixel.FlxEmitter;
import org.flixel.FlxGroup;
 
class Fx extends FlxGroup
{
    // from http://www.haxeflixel.com/articles/game-registry
    // https://github.com/impaler/HaxeFlixelDemoes/tree/master/BulletManager2
    private var pixels:FlxGroup;

    public static function new()
    {
        super();
        pixels = new FlxGroup();

        //  Here we create an FlxGroup containing 40 FlxEmitters, all the same, 
        // used when the boxes touch or explode.
        var poolSize = 40;
        var i = 0;
        while (i < poolSize) {
            var particleCount = 10;
            
            var tempPixel = new FlxEmitter(10,10,particleCount);
            tempPixel.setXSpeed( -50, 50);
            tempPixel.setYSpeed( -50, 50);
            tempPixel.setRotation(0, 0);
            
            var p = 0;
            while (p < particleCount) {
                var whitePixel = new FlxParticle();
                whitePixel.makeGraphic(10,10);
                whitePixel.color=0xffff0000;
               // whitePixel.alpha = Math.random();
             //  whitePixel.alpha = 1;
                tempPixel.add(whitePixel);
                
                p++;
            }
            
            pixels.add(tempPixel);

            i++;
        }
        add(pixels);
    }

    override public function update():Void
    {
        super.update();
    }

    public function explodeBlock(ax:Int, ay:Int):Void
    {
        trace("explode:" + ax + ":" + ay);
         var pixel = cast(pixels.getFirstAvailable(FlxEmitter),FlxEmitter);
        
        if (pixel!=null)
        {
            pixel.x = ax;
            pixel.y = ay;
            pixel.start(true,2);
        }
        
    }
}

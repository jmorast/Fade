package ;
 
import nme.Lib;
import nme.Assets;
import org.flixel.FlxG;
import org.flixel.FlxSprite;
import org.flixel.FlxObject;
 
class Player extends FlxSprite
{
    public var addred = 0;
    public var addgreen = 0;
    public var addblue = 0;
    private var pred = 0;
    private var pgreen = 0;
    private var pblue = 0;
    private var color_multiplier = 30;
    public function new()
    {
        //Set the player location to the center and automatically load it's bitmap image :)
       // super(FlxG.width / 2, FlxG.height - 16,"assets/gfx/player.png");
	super();
    this.makeGraphic(20,20);
	this.color=0x00ff00;
    }
 
    override public function update():Void
    {
        super.update();
        this.x=FlxG.mouse.screenX+jitter();
        this.y=FlxG.mouse.screenY+jitter();
        if (addred != 0) {
            pred=pred+addred*color_multiplier;
            pred=normalize(pred);
        }
        if (addgreen != 0) {
            pgreen=pgreen+addgreen*color_multiplier;
            pgreen=normalize(pgreen);            
        }
        if (addblue != 0) {
            pblue=pblue+addblue*color_multiplier;
            pblue=normalize(pblue);           
        }
        addred = addgreen = addblue = 0;
        
        // alpha + red + green + blue, masked and shifted
        this.color = (0xFF) << 24 | (pred & 0xFF) << 16 | (pgreen & 0xFF) << 8 | (pblue & 0xFF);
	}
    private function normalize(cvalue:Int):Int {
        if (cvalue<0) return 0;
        if (cvalue>255) return 255;
        return cvalue;
    }
    
    private function jitter():Int {
    	var temp:Int = Std.int((Math.abs(pred-pgreen)+Math.abs(pred-pblue)+Math.abs(pgreen-pblue))/100);
    	if (Math.random() < 0.5) {
    		return Std.int(Math.random()*temp);
    	} else {
    		return -Std.int(Math.random()*temp);
    	}
    }


}

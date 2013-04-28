package;
 
import org.flixel.FlxG;
import org.flixel.FlxSprite;
import org.flixel.FlxPoint;
import org.flixel.plugin.photonstorm.FlxVelocity;
 
class Enemy extends FlxSprite
{
	public var EnemyType:Int;
	public var EnemyColor:String;
    
    override public function new()
    {
 		super();
 		this.makeGraphic(30,30);
 		EnemyType=Std.int(Math.random() * 3);
 		switch(EnemyType) {
 			case 0:
 				EnemyColor="Red";
 				this.color=0xffff0000;
 			case 1:
 				EnemyColor="Green";
 				this.color=0xff00ff00;
 			case 2:
 				EnemyColor="Blue";
 				this.color=0xff0000ff;
 		}
        exists = false;
    }

    public function launch():Void
    {
    	// Random starting location
    	//x = Std.int(Math.random() * FlxG.width);
    	//y = Std.int(Math.random() * FlxG.height);
    	// Random starting location 10 away from player
    	var distFromPlayer:Int = 0;
    	while (distFromPlayer < 50) {
    		x = Std.int(Math.random() * FlxG.width);
    		y = Std.int(Math.random() * FlxG.height);
    		var dx:Int = Std.int(x - Registry.player.x);
    		var dy:Int = Std.int(y - Registry.player.y);
    		distFromPlayer = Std.int(Math.sqrt(dx*dx + dy*dy));       		
    	}
        
    	// Random velocity
        //velocity.x = -50 + Std.int(Math.random() * 100);
        //velocity.y = -50 + Std.int(Math.random() * 100);
        FlxVelocity.moveTowardsObject(this,Registry.player,100);
        // Fire off at the player


        health = 4;
        exists = true;
    }
 
    override public function kill():Void
    {
        super.kill();
 
        FlxG.score += 20;
        trace("Collided with color " + EnemyColor);
        switch(EnemyType) {
        	case 0:
        		trace("More red");
        		Registry.player.addred=10;
        	case 1:
      	 		trace("More green");
        		Registry.player.addgreen=10;
        	case 2:
       			trace("More blue");
        		Registry.player.addblue=10;
        }
    }
 
    override public function update():Void
    {
        super.update();
 
        if (y > FlxG.height) 
        {
            exists = false;
        }
        if (y < 0)
        {
        	exists = false;
        }
        if (x > FlxG.width)
        {	
        	exists = false;
        }
        if (x < 0)
        {	
        	exists = false;
        }

    }
 
}
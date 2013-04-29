package;
 
import org.flixel.FlxG;
import org.flixel.FlxSprite;
import org.flixel.FlxPoint;
import org.flixel.plugin.photonstorm.FlxVelocity;
 
class Enemy extends FlxSprite
{
	public var EnemyType:Int;
	public var EnemyColor:String;
	
	private var dirx:Int=0;
	private var diry:Int=0;
	private var ewidth:Int;
	private var eheight:Int;
    
    override public function new()
    {
 		super();
 		if (Math.random() < 0.5) {
 			dirx = Std.int(Math.random() * 90)+20;
 			ewidth = 300 + Std.int(Math.random()*600);
 			eheight=20;
 		} else {
 			diry = Std.int(Math.random() * 90)+20;
 			ewidth=20;
 			eheight = 300 + Std.int(Math.random()*600);
 		}
 		if (Math.random() < 0.5) {
 			dirx = dirx * -1;
 			diry = diry * -1;
 		} 
 		//trace("W:"+ewidth+" H:"+eheight);
 		//trace("Speed x="+dirx+" y="+diry);
 		this.makeGraphic(ewidth,eheight);
 		
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
    	/*
    	var distFromPlayer:Int = 0;
    	while (distFromPlayer < 50) {
    		x = Std.int(Math.random() * FlxG.width);
    		y = Std.int(Math.random() * FlxG.height);
    		var dx:Int = Std.int(x - Registry.player.x);
    		var dy:Int = Std.int(y - Registry.player.y);
    		distFromPlayer = Std.int(Math.sqrt(dx*dx + dy*dy));       		
    	}
    	*/
    	if (dirx<0) {
    		x=FlxG.width;
    		y=Std.int(Math.random() * FlxG.height);
    	} else if (dirx>0) {
    		x=-ewidth;
    		y=Std.int(Math.random() * FlxG.height);
    	}
    	if (diry<0) {
    		y=FlxG.height;
    		x=Std.int(Math.random() * FlxG.width);
    	} else if (diry>0) {
    		y=-eheight;
    		x=Std.int(Math.random() * FlxG.width);
    	}
        
    	// Random velocity
        //velocity.x = -50 + Std.int(Math.random() * 100);
        //velocity.y = -50 + Std.int(Math.random() * 100);
        //FlxVelocity.moveTowardsObject(this,Registry.player,100);
        this.velocity.x=dirx;
        this.velocity.y=diry;
        //FlxVelocity.moveTowardsPoint(this,new FlxPoint(x+300*dirx,y*300*diry),100);
        // Fire off at the player
		

		
	

        health = 4;
        exists = true;
    }
 
    override public function kill():Void
    {
        super.kill();
 
        FlxG.score += 20;
        //trace("Collided with color " + EnemyColor);
        switch(EnemyType) {
        	case 0:
        		//trace("More red");
        		Registry.player.addred=1;
        	case 1:
      	 		//trace("More green");
        		Registry.player.addgreen=1;
        	case 2:
       			//trace("More blue");
        		Registry.player.addblue=1;

        }
    }
 
    override public function update():Void
    {
        super.update();
 
        if (y > FlxG.height+eheight) 
        {
            exists = false;
        }
        if (y < 0-eheight)
        {
        	exists = false;
        }
        if (x > FlxG.width+ewidth)
        {	
        	exists = false;
        }
        if (x < 0-ewidth)
        {	
        	exists = false;
        }

    }
 
}
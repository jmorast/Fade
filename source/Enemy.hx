package;
 
import org.flixel.FlxG;
import org.flixel.FlxSprite;
 
class Enemy extends FlxSprite
{
	public var EnemyType:Int;
	public var EnemyColor:String;
    public function new()
    {
 		super();
 		this.makeGraphic(30,30);
 		EnemyType=Std.int(Math.random() * 3);
 		switch(EnemyType) {
 			case 0:
 				EnemyColor="Red";
 				this.color=0xffff0000;
 			case 1:
 				EnemyColor="Blue";
 				this.color=0xff00ff00;
 			case 2:
 				EnemyColor="Green";
 				this.color=0xff0000ff;
 		}
        exists = false;
    }
 
    public function launch():Void
    {
        x = Std.int(Math.random() * FlxG.width);
       	y = Std.int(Math.random() * FlxG.height);
        velocity.x = -50 + Std.int(Math.random() * 100);
        velocity.y = -50 + Std.int(Math.random() * 100);

        health = 4;
        exists = true;
    }
 
    override public function kill():Void
    {
        super.kill();
 
        FlxG.score += 20;
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
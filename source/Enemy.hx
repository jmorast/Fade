package;

import org.flixel.FlxGroup;
import org.flixel.FlxSprite;

class Enemy extends FlxSprite
{
    public var addred:Int = 0;
    public var addgreen:Int = 0;
    public var addblue:Int = 0;
	public var speed:Int = 0;
	private var block:FlxSprite;

	public function new(x:Int,y:Int)
	{
		super();
		this.makeGraphic(50,50,0xffff0000);
		this.x=x;
		this.y=y;
	}
	
	override public function destroy():Void
	{
		super.destroy();
	}

	override public function update():Void
	{
		super.update();
	}	
	
}

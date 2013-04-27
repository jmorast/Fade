package;

import nme.ui.Mouse;
import nme.Assets;
import nme.display.Sprite;
import nme.geom.Rectangle;
import nme.net.SharedObject;
import org.flixel.FlxButton;
import org.flixel.FlxG;
import org.flixel.FlxPath;
import org.flixel.FlxSave;
import org.flixel.FlxSprite;
import org.flixel.FlxState;
import org.flixel.FlxText;
import org.flixel.FlxU;
import org.flixel.system.input.Mouse;


class MenuState extends FlxState
{
	
	var Player:FlxSprite;
	
	override public function create():Void
	{
		
		FlxG.bgColor = 0xffffffff;	
		
		
		Player = new FlxSprite(320,249);
		Player.makeGraphic(20,20);
		Player.color=0x000000;
		add(Player);
		
		var mpoint:FlxSprite = new FlxSprite(0,0);
		mpoint.makeGraphic(1,1);
		mpoint.alpha=0;
		
		FlxG.mouse.show(mpoint,0.01);
		
		
		
		
	}
	
	override public function destroy():Void
	{
		super.destroy();
	}

	override public function update():Void
	{
		super.update();
		
		Player.x=FlxG.mouse.screenX;
		Player.y=FlxG.mouse.screenY;
		
		
	}	
	
	
}
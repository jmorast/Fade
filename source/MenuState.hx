package;

import nme.Assets;
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
import org.flixel.FlxPoint;
//import org.flixel.FlxMouse;

class MenuState extends FlxState
{
	
	var Player:FlxSprite;
	var Mouse:FlxMouse;
	
	override public function create():Void
	{
		
		FlxG.bgColor = 0xffffffff;	
		FlxG.mouse.hide();
		
		Player = new FlxSprite(320,249);
		Player.makeGraphic(20,20);
		Player.color=0x000000;
		add(Player);
		
		Mouse = new FlxMouse();
		
		
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
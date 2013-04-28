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
import org.flixel.FlxPoint;
import org.flixel.plugin.photonstorm.FlxVelocity;


class Level1 extends FlxState
{

	override public function create():Void
	{
		FlxG.bgColor = 0xffffffff;	
		
		/*
		Player = new FlxSprite(320,249);
		Player.makeGraphic(20,20);
		Player.color=0x000000;
		add(Player);
		*/
		var mpoint:FlxSprite = new FlxSprite(0,0);
		mpoint.makeGraphic(1,1);
		//mpoint.alpha=0;
		
		FlxG.mouse.show(mpoint,0.01);
		
		Registry.init();
		add(Registry.player);
		add(Registry.enemies);
	
	}

	override public function destroy():Void
	{
		super.destroy();
	}

	override public function update():Void
	{
		super.update();
		
		updateEntities();
		CheckCollision();
		//UpdatePlayer();

		CheckState();
		
	}	
	
	
	private function updateEntities() {
	  // spawn new enemies if needed
	  // move enemies based on their velocities
	  // enemy specific behavior
	}
	
	private function CheckCollision() {
	  // for each enemy in enemy list check if player collides
	  // update addred, addgreen, addblue and change enemy behavior
	}
	
	private function CheckState() {
	  // is the game or level over?
	}
	

}

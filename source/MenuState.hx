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
import nme.Lib;


class MenuState extends FlxState
{
	
	var Player:FlxSprite;
	var addred = 0;
	var addgreen = 0;
	var addblue = 0;
	var pred = 0;
	var pgreen = 0;
	var pblue = 0;
	
	var alpha_dir=-5;
	var alpha_val=0xff;
	
	
	var title:FlxText;
	var nextScreen:FlxText;
	var nextSpot1:FlxSprite;
	var nextSpot2:FlxSprite;
	var nextSpot3:FlxSprite;
	
	override public function create():Void
	{
		
		FlxG.bgColor = 0xffffffff;	
		
		
		Player = new FlxSprite(600,450);
		Player.makeGraphic(20,20);
		Player.color=0x000000;
		add(Player);
		
		var mpoint:FlxSprite = new FlxSprite(0,0);
		mpoint.makeGraphic(1,1);
		//mpoint.alpha=0;
		
		FlxG.mouse.show(mpoint,0.01);
		
		title = new FlxText(150,100,300,"FADE",true);
		title.setFormat("assets/Adore64",72,0xffb0b0b0,"center",0xff000000,true);
		add(title);
		
		var instructions = new FlxText(100,300,400," Your goal is to fade away.  Grab red, green and blue bars to inherit some of their color.  Too much of one color and you become vividly unstable. ",true);
		instructions.setFormat("assets/Adore64",12,0x000000,"center");
		add(instructions);

		var credits = new FlxText(100,400,400,"Created by hakoMike and RexPeppers for Ludum Dare #26",true);
		credits.setFormat("assets/Adore64",12,0xff0000,"center");
		add(credits);

		nextScreen = new FlxText(100,200,400,"Place cursor here to begin.");
		nextScreen.setFormat("assets/Adore64",24,0x000000,"center");
		nextScreen.alpha=0;
		add(nextScreen);

	}
	
	override public function destroy():Void
	{
		super.destroy();
	}

	function nextLevel() {
		FlxG.switchState(new Level1());
	}

	override public function update():Void
	{
		super.update();
		
		Player.x=FlxG.mouse.screenX;
		Player.y=FlxG.mouse.screenY;
		
		//alter title for pulsing alpha
		alpha_val += alpha_dir;
		if (alpha_val==0 || alpha_val==0xff) {
			alpha_dir *= -1;
		}
		//title.setFormat(title.getFont(),title.getSize(),(alpha_val & 0xff)<<24 | title.getColor() );
		title.alpha = alpha_val/255;

		if (Lib.getTimer() > 3000) {
			if (nextScreen.alpha > 1) {
				nextScreen.alpha = 1;
			} else {
				nextScreen.alpha+=.01;
			}
			// when player enters some area of the screen switch state
	  		if ((Player.x > 120) && (Player.x < 450)) {
	  			if ((Player.y > 200) && (Player.y < 260)) {
	  				FlxG.switchState(new Level1());
	  			}
	  		}
	
		}
		
	}	
	
}
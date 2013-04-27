package ;

import flash.geom.Rectangle;
import nme.display.Bitmap;
import nme.display.BitmapData;
import nme.display.BlendMode;
import nme.display.DisplayObject;
import nme.display.Graphics;
import nme.display.MovieClip;
import nme.display.Sprite;
import nme.display.StageAlign;
import nme.display.StageScaleMode;
import nme.errors.Error;
import nme.events.Event;
import nme.events.MouseEvent;
import nme.net.URLRequest;
import nme.text.TextField;
import nme.text.TextFormat;
import nme.Lib;
import nme.text.TextFormatAlign;
import nme.utils.ByteArray;
import org.flixel.FlxU;
import org.flixel.plugin.pxText.PxTextAlign;
import org.flixel.system.preloaderHelpers.PxBitmapFont;
import org.flixel.system.preloaderHelpers.PxTextField;

import org.flixel.FlxG;

/**
 * This class handles the 8-bit style preloader.
 */
class MyFlxPreloader extends NMEPreloader
{
	private static inline var BlendModeScreen = BlendMode.SCREEN;
	private static inline var BlendModeOverlay = BlendMode.OVERLAY;
	
	private var _font:PxBitmapFont;

	/**
	 * @private
	 */
	private var _init:Bool;
	/**
	 * @private
	 */
	private var _buffer:Sprite;
	/**
	 * @private
	 */
	private var _bmpBar:Bitmap;
	/**
	 * @private
	 */
	private var _text:PxTextField;
	/**
	 * Useful for storing "real" stage width if you're scaling your preloader graphics.
	 */
	private var _width:Int;
	/**
	 * Useful for storing "real" stage height if you're scaling your preloader graphics.
	 */
	private var _height:Int;
	
	private var _min:Int;
	private var _percent:Float;

	/**
	 * Change this if you want the flixel logo to show for more or less time.  Default value is 0 seconds.
	 */
	public var minDisplayTime:Float;
	
	/**
	 * Constructor
	 */
	public function new()
	{
		super();
		removeChild(outline);
		removeChild(progress);
		
		minDisplayTime = 1;
		this._init = false;
		
		addEventListener(Event.ADDED_TO_STAGE, onAddedToStage);
	}
	
	private function onAddedToStage(e:Event):Void 
	{
		removeEventListener(Event.ADDED_TO_STAGE, onAddedToStage);
		
		Lib.current.stage.scaleMode = StageScaleMode.NO_SCALE;
		Lib.current.stage.align = StageAlign.TOP_LEFT;
		
		//_font = new PxBitmapFont(createBitmapFromData(FontData, FontWidth, FontHeight), " !\"#$%&'()*+,-./" + "0123456789:;<=>?" + "@ABCDEFGHIJKLMNO" + "PQRSTUVWXYZ[]^_" + "abcdefghijklmno" + "pqrstuvwxyz{|}~\\");
		
		addEventListener(Event.ENTER_FRAME, onEnterFrame);
		create();
	}
	
	/**
	 * Override this to create your own preloader objects.
	 * Highly recommended you also override update()!
	 */
	private function create():Void
	{
		_min = 3;
		if(!FlxG.debug)
		{
			_min = Math.floor(minDisplayTime * 1000);
		}
		_buffer = new Sprite();
		_buffer.scaleX = _buffer.scaleY = 2;
		addChild(_buffer);
		_width = Math.floor(Lib.stage.stageWidth); // / _buffer.scaleX);
		_height = Math.floor(Lib.stage.stageHeight); // / _buffer.scaleY);
		#if !neko
		_buffer.addChild(new Bitmap(new BitmapData(_width, _height, false, 0x606060)));
		#else
		_buffer.addChild(new Bitmap(new BitmapData(_width, _height, false, {rgb: 0x00345e, a: 0xff})));
		#end		
		#if !neko
		_bmpBar = new Bitmap(new BitmapData(1, 7, false, 0xff3333));
		#else
		_bmpBar = new Bitmap(new BitmapData(1, 7, false, {rgb: 0x5f6aff, a: 0xff}));
		#end
		_bmpBar.x = 4;
		_bmpBar.y = _height/2-20;
		_buffer.addChild(_bmpBar);
		
		_text = new PxTextField(_font);
		_text.alignment = PxTextAlign.LEFT;
		_text.scaleX = _text.scaleY = 2.0;
		_text.color = 0xE0E0E0;
		_text.x = 6;
		_text.y = _bmpBar.y - 16;
		_text.setWidth(240);
		_text.wordWrap = false;
		_buffer.addChild(_text);
		
		
	}
	
	
	private function destroy():Void
	{
		removeEventListener(Event.ENTER_FRAME, onEnterFrame);
		removeChild(_buffer);
		_buffer = null;
		_bmpBar = null;
		_text = null;
	
	}
	
	override public function onLoaded():Void 
	{
		// Do nothing here
	}
	
	override public function onUpdate(bytesLoaded:Int, bytesTotal:Int):Void 
	{
		_percent = (bytesTotal != 0) ? bytesLoaded / bytesTotal : 0;
	}
	
	private function onEnterFrame(event:Event):Void
	{
		if(!this._init)
		{
			if((Lib.current.stage.stageWidth <= 0) || (Lib.current.stage.stageHeight <= 0))
			{
				return;
			}
			create();
			this._init = true;
		}
		
		graphics.clear();
		var time:Int = Lib.getTimer();
		if((_percent >= 1) && (time > _min))
		{
			super.onLoaded();
			destroy();
		}
		else
		{
			var percent:Float = _percent;
			if((_min > 0) && (percent > time/_min))
			{
				percent = time / _min;
			}
			update(percent);
		}
	}
	
	/**
	 * Override this function to manually update the preloader.
	 * 
	 * @param	Percent		How much of the program has loaded.
	 */
	private function update(Percent:Float):Void
	{
		_bmpBar.scaleX = Math.floor(Percent * (Lib.stage.stageWidth-20))/2.0;
		_text.text = "FADE ... loading " + Math.floor(Percent * 100) + "%";
		
	}
	
	private function createBitmapFromData(bitmapDataArray:Array<Int>, bitmapWidth:Int, bitmapHeight:Int):BitmapData
	{
		var byteData:ByteArray = new ByteArray(); 
		for (i in 0...(bitmapDataArray.length))
		{
			byteData.writeByte(bitmapDataArray[i]);
		}
		
		#if (flash || js)
		byteData.uncompress();
		#else
		byteData.uncompress("");
		#end
		
		#if !neko
		var result:BitmapData = new BitmapData(bitmapWidth, bitmapHeight, true, 0);
		#else
		var result:BitmapData = new BitmapData(bitmapWidth, bitmapHeight, true, { rgb: 0, a: 0 } );
		#end
		
		result.setPixels(new Rectangle(0, 0, bitmapWidth, bitmapHeight), byteData);
		return result;
	}
}
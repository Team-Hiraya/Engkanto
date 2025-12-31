package;

import haxe.io.Bytes;
import haxe.io.Path;
import lime.utils.AssetBundle;
import lime.utils.AssetLibrary;
import lime.utils.AssetManifest;
import lime.utils.Assets;

#if sys
import sys.FileSystem;
#end

#if disable_preloader_assets
@:dox(hide) class ManifestResources {
	public static var preloadLibraries:Array<Dynamic>;
	public static var preloadLibraryNames:Array<String>;
	public static var rootPath:String;

	public static function init (config:Dynamic):Void {
		preloadLibraries = new Array ();
		preloadLibraryNames = new Array ();
	}
}
#else
@:access(lime.utils.Assets)


@:keep @:dox(hide) class ManifestResources {


	public static var preloadLibraries:Array<AssetLibrary>;
	public static var preloadLibraryNames:Array<String>;
	public static var rootPath:String;


	public static function init (config:Dynamic):Void {

		preloadLibraries = new Array ();
		preloadLibraryNames = new Array ();

		rootPath = null;

		if (config != null && Reflect.hasField (config, "rootPath")) {

			rootPath = Reflect.field (config, "rootPath");

			if(!StringTools.endsWith (rootPath, "/")) {

				rootPath += "/";

			}

		}

		if (rootPath == null) {

			#if (ios || tvos || webassembly)
			rootPath = "assets/";
			#elseif android
			rootPath = "";
			#elseif (console || sys)
			rootPath = lime.system.System.applicationDirectory;
			#else
			rootPath = "./";
			#end

		}

		#if (openfl && !flash && !display)
		openfl.text.Font.registerFont (__ASSET__OPENFL__flixel_fonts_nokiafc22_ttf);
		openfl.text.Font.registerFont (__ASSET__OPENFL__flixel_fonts_monsterrat_ttf);
		
		#end

		var data, manifest, library, bundle;

		data = '{"name":null,"assets":"aoy4:pathy34:assets%2Fdata%2Fdata-goes-here.txty4:sizezy4:typey4:TEXTy2:idR1y7:preloadtgoR0y28:assets%2Fdata%2FTemplate.xmlR2i214R3R4R5R7R6tgoR0y36:assets%2Fimages%2Fdump%2FDespair.pngR2i9807R3y5:IMAGER5R8R6tgoR0y36:assets%2Fimages%2Fdump%2FDespair.xmlR2i2548R3R4R5R10R6tgoR0y32:assets%2Fimages%2Fdump%2Ffly.pngR2i6845R3R9R5R11R6tgoR0y32:assets%2Fimages%2Fdump%2Ffly.xmlR2i4219R3R4R5R12R6tgoR0y43:assets%2Fimages%2Fdump%2Fimages-go-here.txtR2zR3R4R5R13R6tgoR0y44:assets%2Fimages%2Fdump%2FplaceholderRaya.pngR2i742868R3R9R5R14R6tgoR0y43:assets%2Fimages%2Fdump%2Fplaceholder_bg.jpgR2i1546272R3R9R5R15R6tgoR0y43:assets%2Fimages%2Fdump%2Fplaceholder_fg.pngR2i611065R3R9R5R16R6tgoR0y51:assets%2Fimages%2Fdump%2Fplaceholder_Raya_Fixed.pngR2i365235R3R9R5R17R6tgoR0y36:assets%2Fimages%2Fdump%2Fsprites.pngR2i6691R3R9R5R18R6tgoR0y36:assets%2Fimages%2Fdump%2Fsprites.xmlR2i4227R3R4R5R19R6tgoR0y35:assets%2Fimages%2FEngkanto_Icon.pngR2i10637239R3R9R5R20R6tgoR0y35:assets%2Fimages%2FEngkanto_Icon.svgR2i78475R3R4R5R21R6tgoR0y35:assets%2Fimages%2Fentity%2FRaya.pngR2i6136R3R9R5R22R6tgoR0y35:assets%2Fimages%2Fentity%2FRaya.xmlR2i596R3R4R5R23R6tgoR0y37:assets%2Fimages%2FMainMenuConcept.pngR2i471239R3R9R5R24R6tgoR0y44:assets%2Fimages%2FmenuState%2FBackground.pngR2i39360R3R9R5R25R6tgoR0y44:assets%2Fimages%2FmenuState%2FBackground.xmlR2i564R3R4R5R26R6tgoR0y45:assets%2Fimages%2FmenuState%2FCredits_Btn.pngR2i4072R3R9R5R27R6tgoR0y45:assets%2Fimages%2FmenuState%2FCredits_Btn.xmlR2i578R3R4R5R28R6tgoR0y38:assets%2Fimages%2FmenuState%2FLogo.pngR2i11863R3R9R5R29R6tgoR0y38:assets%2Fimages%2FmenuState%2FLogo.xmlR2i562R3R4R5R30R6tgoR0y45:assets%2Fimages%2FmenuState%2FNewGame_Btn.pngR2i6054R3R9R5R31R6tgoR0y45:assets%2Fimages%2FmenuState%2FNewGame_Btn.xmlR2i562R3R4R5R32R6tgoR0y43:assets%2Fimages%2FmenuState%2FSaveState.pngR2i14304R3R9R5R33R6tgoR0y43:assets%2Fimages%2FmenuState%2FSaveState.xmlR2i582R3R4R5R34R6tgoR0y46:assets%2Fimages%2FmenuState%2FSettings_Btn.pngR2i5733R3R9R5R35R6tgoR0y46:assets%2Fimages%2FmenuState%2FSettings_Btn.xmlR2i586R3R4R5R36R6tgoR0y43:assets%2Fimages%2FmenuState%2FWood_Wall.pngR2i43307R3R9R5R37R6tgoR0y43:assets%2Fimages%2FmenuState%2FWood_Wall.xmlR2i550R3R4R5R38R6tgoR0y29:assets%2Fimages%2FScene_A.pngR2i854656R3R9R5R39R6tgoR0y29:assets%2Fimages%2FScene_A.xmlR2i1102R3R4R5R40R6tgoR0y51:assets%2Fimages%2FScene_One_Asset%2FBack_Bushes.pngR2i79908R3R9R5R41R6tgoR0y46:assets%2Fimages%2FScene_One_Asset%2FBushes.pngR2i51337R3R9R5R42R6tgoR0y46:assets%2Fimages%2FScene_One_Asset%2FGround.pngR2i130064R3R9R5R43R6tgoR0y49:assets%2Fimages%2FScene_One_Asset%2FGround_A2.pngR2i107207R3R9R5R44R6tgoR0y44:assets%2Fimages%2FScene_One_Asset%2FTree.pngR2i175339R3R9R5R45R6tgoR0y41:assets%2Fimages%2FScene_One_Prototype.pngR2i169748R3R9R5R46R6tgoR0y41:assets%2Fimages%2FScene_One_Prototype.xmlR2i584R3R4R5R47R6tgoR0y36:assets%2Fmusic%2Fmusic-goes-here.txtR2zR3R4R5R48R6tgoR0y36:assets%2Fsounds%2Fsounds-go-here.txtR2zR3R4R5R49R6tgoR2i8220R3y5:MUSICR5y26:flixel%2Fsounds%2Fbeep.mp3y9:pathGroupaR51y26:flixel%2Fsounds%2Fbeep.ogghR6tgoR2i39706R3R50R5y28:flixel%2Fsounds%2Fflixel.mp3R52aR54y28:flixel%2Fsounds%2Fflixel.ogghR6tgoR2i6840R3y5:SOUNDR5R53R52aR51R53hgoR2i33629R3R56R5R55R52aR54R55hgoR2i15744R3y4:FONTy9:classNamey35:__ASSET__flixel_fonts_nokiafc22_ttfR5y30:flixel%2Ffonts%2Fnokiafc22.ttfR6tgoR2i29724R3R57R58y36:__ASSET__flixel_fonts_monsterrat_ttfR5y31:flixel%2Ffonts%2Fmonsterrat.ttfR6tgoR0y33:flixel%2Fimages%2Fui%2Fbutton.pngR2i222R3R9R5R63R6tgoR0y36:flixel%2Fimages%2Flogo%2Fdefault.pngR2i484R3R9R5R64R6tgoR0y42:flixel%2Fimages%2Ftransitions%2Fcircle.pngR2i299R3R9R5R65R6tgoR0y53:flixel%2Fimages%2Ftransitions%2Fdiagonal_gradient.pngR2i730R3R9R5R66R6tgoR0y43:flixel%2Fimages%2Ftransitions%2Fdiamond.pngR2i236R3R9R5R67R6tgoR0y42:flixel%2Fimages%2Ftransitions%2Fsquare.pngR2i209R3R9R5R68R6tgh","rootPath":null,"version":2,"libraryArgs":[],"libraryType":null}';
		manifest = AssetManifest.parse (data, rootPath);
		library = AssetLibrary.fromManifest (manifest);
		Assets.registerLibrary ("default", library);
		

		library = Assets.getLibrary ("default");
		if (library != null) preloadLibraries.push (library);
		else preloadLibraryNames.push ("default");
		

	}


}

#if !display
#if flash

@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_data_data_goes_here_txt extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_data_template_xml extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_images_dump_despair_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_images_dump_despair_xml extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_images_dump_fly_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_images_dump_fly_xml extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_images_dump_images_go_here_txt extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_images_dump_placeholderraya_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_images_dump_placeholder_bg_jpg extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_images_dump_placeholder_fg_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_images_dump_placeholder_raya_fixed_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_images_dump_sprites_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_images_dump_sprites_xml extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_images_engkanto_icon_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_images_engkanto_icon_svg extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_images_entity_raya_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_images_entity_raya_xml extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_images_mainmenuconcept_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_images_menustate_background_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_images_menustate_background_xml extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_images_menustate_credits_btn_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_images_menustate_credits_btn_xml extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_images_menustate_logo_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_images_menustate_logo_xml extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_images_menustate_newgame_btn_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_images_menustate_newgame_btn_xml extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_images_menustate_savestate_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_images_menustate_savestate_xml extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_images_menustate_settings_btn_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_images_menustate_settings_btn_xml extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_images_menustate_wood_wall_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_images_menustate_wood_wall_xml extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_images_scene_a_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_images_scene_a_xml extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_images_scene_one_asset_back_bushes_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_images_scene_one_asset_bushes_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_images_scene_one_asset_ground_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_images_scene_one_asset_ground_a2_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_images_scene_one_asset_tree_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_images_scene_one_prototype_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_images_scene_one_prototype_xml extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_music_music_goes_here_txt extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_sounds_sounds_go_here_txt extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__flixel_sounds_beep_mp3 extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__flixel_sounds_flixel_mp3 extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__flixel_sounds_beep_ogg extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__flixel_sounds_flixel_ogg extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__flixel_fonts_nokiafc22_ttf extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__flixel_fonts_monsterrat_ttf extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__flixel_images_ui_button_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__flixel_images_logo_default_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__flixel_images_transitions_circle_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__flixel_images_transitions_diagonal_gradient_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__flixel_images_transitions_diamond_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__flixel_images_transitions_square_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__manifest_default_json extends null { }


#elseif (desktop || cpp)

@:keep @:file("assets/data/data-goes-here.txt") @:noCompletion #if display private #end class __ASSET__assets_data_data_goes_here_txt extends haxe.io.Bytes {}
@:keep @:file("assets/data/Template.xml") @:noCompletion #if display private #end class __ASSET__assets_data_template_xml extends haxe.io.Bytes {}
@:keep @:image("assets/images/dump/Despair.png") @:noCompletion #if display private #end class __ASSET__assets_images_dump_despair_png extends lime.graphics.Image {}
@:keep @:file("assets/images/dump/Despair.xml") @:noCompletion #if display private #end class __ASSET__assets_images_dump_despair_xml extends haxe.io.Bytes {}
@:keep @:image("assets/images/dump/fly.png") @:noCompletion #if display private #end class __ASSET__assets_images_dump_fly_png extends lime.graphics.Image {}
@:keep @:file("assets/images/dump/fly.xml") @:noCompletion #if display private #end class __ASSET__assets_images_dump_fly_xml extends haxe.io.Bytes {}
@:keep @:file("assets/images/dump/images-go-here.txt") @:noCompletion #if display private #end class __ASSET__assets_images_dump_images_go_here_txt extends haxe.io.Bytes {}
@:keep @:image("assets/images/dump/placeholderRaya.png") @:noCompletion #if display private #end class __ASSET__assets_images_dump_placeholderraya_png extends lime.graphics.Image {}
@:keep @:image("assets/images/dump/placeholder_bg.jpg") @:noCompletion #if display private #end class __ASSET__assets_images_dump_placeholder_bg_jpg extends lime.graphics.Image {}
@:keep @:image("assets/images/dump/placeholder_fg.png") @:noCompletion #if display private #end class __ASSET__assets_images_dump_placeholder_fg_png extends lime.graphics.Image {}
@:keep @:image("assets/images/dump/placeholder_Raya_Fixed.png") @:noCompletion #if display private #end class __ASSET__assets_images_dump_placeholder_raya_fixed_png extends lime.graphics.Image {}
@:keep @:image("assets/images/dump/sprites.png") @:noCompletion #if display private #end class __ASSET__assets_images_dump_sprites_png extends lime.graphics.Image {}
@:keep @:file("assets/images/dump/sprites.xml") @:noCompletion #if display private #end class __ASSET__assets_images_dump_sprites_xml extends haxe.io.Bytes {}
@:keep @:image("assets/images/Engkanto_Icon.png") @:noCompletion #if display private #end class __ASSET__assets_images_engkanto_icon_png extends lime.graphics.Image {}
@:keep @:file("assets/images/Engkanto_Icon.svg") @:noCompletion #if display private #end class __ASSET__assets_images_engkanto_icon_svg extends haxe.io.Bytes {}
@:keep @:image("assets/images/entity/Raya.png") @:noCompletion #if display private #end class __ASSET__assets_images_entity_raya_png extends lime.graphics.Image {}
@:keep @:file("assets/images/entity/Raya.xml") @:noCompletion #if display private #end class __ASSET__assets_images_entity_raya_xml extends haxe.io.Bytes {}
@:keep @:image("assets/images/MainMenuConcept.png") @:noCompletion #if display private #end class __ASSET__assets_images_mainmenuconcept_png extends lime.graphics.Image {}
@:keep @:image("assets/images/menuState/Background.png") @:noCompletion #if display private #end class __ASSET__assets_images_menustate_background_png extends lime.graphics.Image {}
@:keep @:file("assets/images/menuState/Background.xml") @:noCompletion #if display private #end class __ASSET__assets_images_menustate_background_xml extends haxe.io.Bytes {}
@:keep @:image("assets/images/menuState/Credits_Btn.png") @:noCompletion #if display private #end class __ASSET__assets_images_menustate_credits_btn_png extends lime.graphics.Image {}
@:keep @:file("assets/images/menuState/Credits_Btn.xml") @:noCompletion #if display private #end class __ASSET__assets_images_menustate_credits_btn_xml extends haxe.io.Bytes {}
@:keep @:image("assets/images/menuState/Logo.png") @:noCompletion #if display private #end class __ASSET__assets_images_menustate_logo_png extends lime.graphics.Image {}
@:keep @:file("assets/images/menuState/Logo.xml") @:noCompletion #if display private #end class __ASSET__assets_images_menustate_logo_xml extends haxe.io.Bytes {}
@:keep @:image("assets/images/menuState/NewGame_Btn.png") @:noCompletion #if display private #end class __ASSET__assets_images_menustate_newgame_btn_png extends lime.graphics.Image {}
@:keep @:file("assets/images/menuState/NewGame_Btn.xml") @:noCompletion #if display private #end class __ASSET__assets_images_menustate_newgame_btn_xml extends haxe.io.Bytes {}
@:keep @:image("assets/images/menuState/SaveState.png") @:noCompletion #if display private #end class __ASSET__assets_images_menustate_savestate_png extends lime.graphics.Image {}
@:keep @:file("assets/images/menuState/SaveState.xml") @:noCompletion #if display private #end class __ASSET__assets_images_menustate_savestate_xml extends haxe.io.Bytes {}
@:keep @:image("assets/images/menuState/Settings_Btn.png") @:noCompletion #if display private #end class __ASSET__assets_images_menustate_settings_btn_png extends lime.graphics.Image {}
@:keep @:file("assets/images/menuState/Settings_Btn.xml") @:noCompletion #if display private #end class __ASSET__assets_images_menustate_settings_btn_xml extends haxe.io.Bytes {}
@:keep @:image("assets/images/menuState/Wood_Wall.png") @:noCompletion #if display private #end class __ASSET__assets_images_menustate_wood_wall_png extends lime.graphics.Image {}
@:keep @:file("assets/images/menuState/Wood_Wall.xml") @:noCompletion #if display private #end class __ASSET__assets_images_menustate_wood_wall_xml extends haxe.io.Bytes {}
@:keep @:image("assets/images/Scene_A.png") @:noCompletion #if display private #end class __ASSET__assets_images_scene_a_png extends lime.graphics.Image {}
@:keep @:file("assets/images/Scene_A.xml") @:noCompletion #if display private #end class __ASSET__assets_images_scene_a_xml extends haxe.io.Bytes {}
@:keep @:image("assets/images/Scene_One_Asset/Back_Bushes.png") @:noCompletion #if display private #end class __ASSET__assets_images_scene_one_asset_back_bushes_png extends lime.graphics.Image {}
@:keep @:image("assets/images/Scene_One_Asset/Bushes.png") @:noCompletion #if display private #end class __ASSET__assets_images_scene_one_asset_bushes_png extends lime.graphics.Image {}
@:keep @:image("assets/images/Scene_One_Asset/Ground.png") @:noCompletion #if display private #end class __ASSET__assets_images_scene_one_asset_ground_png extends lime.graphics.Image {}
@:keep @:image("assets/images/Scene_One_Asset/Ground_A2.png") @:noCompletion #if display private #end class __ASSET__assets_images_scene_one_asset_ground_a2_png extends lime.graphics.Image {}
@:keep @:image("assets/images/Scene_One_Asset/Tree.png") @:noCompletion #if display private #end class __ASSET__assets_images_scene_one_asset_tree_png extends lime.graphics.Image {}
@:keep @:image("assets/images/Scene_One_Prototype.png") @:noCompletion #if display private #end class __ASSET__assets_images_scene_one_prototype_png extends lime.graphics.Image {}
@:keep @:file("assets/images/Scene_One_Prototype.xml") @:noCompletion #if display private #end class __ASSET__assets_images_scene_one_prototype_xml extends haxe.io.Bytes {}
@:keep @:file("assets/music/music-goes-here.txt") @:noCompletion #if display private #end class __ASSET__assets_music_music_goes_here_txt extends haxe.io.Bytes {}
@:keep @:file("assets/sounds/sounds-go-here.txt") @:noCompletion #if display private #end class __ASSET__assets_sounds_sounds_go_here_txt extends haxe.io.Bytes {}
@:keep @:file("C:/haxeflixel/flixel/6,1,2/assets/sounds/beep.mp3") @:noCompletion #if display private #end class __ASSET__flixel_sounds_beep_mp3 extends haxe.io.Bytes {}
@:keep @:file("C:/haxeflixel/flixel/6,1,2/assets/sounds/flixel.mp3") @:noCompletion #if display private #end class __ASSET__flixel_sounds_flixel_mp3 extends haxe.io.Bytes {}
@:keep @:file("C:/haxeflixel/flixel/6,1,2/assets/sounds/beep.ogg") @:noCompletion #if display private #end class __ASSET__flixel_sounds_beep_ogg extends haxe.io.Bytes {}
@:keep @:file("C:/haxeflixel/flixel/6,1,2/assets/sounds/flixel.ogg") @:noCompletion #if display private #end class __ASSET__flixel_sounds_flixel_ogg extends haxe.io.Bytes {}
@:keep @:font("export/html5/obj/webfont/nokiafc22.ttf") @:noCompletion #if display private #end class __ASSET__flixel_fonts_nokiafc22_ttf extends lime.text.Font {}
@:keep @:font("export/html5/obj/webfont/monsterrat.ttf") @:noCompletion #if display private #end class __ASSET__flixel_fonts_monsterrat_ttf extends lime.text.Font {}
@:keep @:image("C:/haxeflixel/flixel/6,1,2/assets/images/ui/button.png") @:noCompletion #if display private #end class __ASSET__flixel_images_ui_button_png extends lime.graphics.Image {}
@:keep @:image("C:/haxeflixel/flixel/6,1,2/assets/images/logo/default.png") @:noCompletion #if display private #end class __ASSET__flixel_images_logo_default_png extends lime.graphics.Image {}
@:keep @:image("C:/haxeflixel/flixel-addons/3,3,2/assets/images/transitions/circle.png") @:noCompletion #if display private #end class __ASSET__flixel_images_transitions_circle_png extends lime.graphics.Image {}
@:keep @:image("C:/haxeflixel/flixel-addons/3,3,2/assets/images/transitions/diagonal_gradient.png") @:noCompletion #if display private #end class __ASSET__flixel_images_transitions_diagonal_gradient_png extends lime.graphics.Image {}
@:keep @:image("C:/haxeflixel/flixel-addons/3,3,2/assets/images/transitions/diamond.png") @:noCompletion #if display private #end class __ASSET__flixel_images_transitions_diamond_png extends lime.graphics.Image {}
@:keep @:image("C:/haxeflixel/flixel-addons/3,3,2/assets/images/transitions/square.png") @:noCompletion #if display private #end class __ASSET__flixel_images_transitions_square_png extends lime.graphics.Image {}
@:keep @:file("") @:noCompletion #if display private #end class __ASSET__manifest_default_json extends haxe.io.Bytes {}



#else

@:keep @:expose('__ASSET__flixel_fonts_nokiafc22_ttf') @:noCompletion #if display private #end class __ASSET__flixel_fonts_nokiafc22_ttf extends lime.text.Font { public function new () { #if !html5 __fontPath = "flixel/fonts/nokiafc22"; #else ascender = 2048; descender = -512; height = 2816; numGlyphs = 172; underlinePosition = -640; underlineThickness = 256; unitsPerEM = 2048; #end name = "Nokia Cellphone FC Small"; super (); }}
@:keep @:expose('__ASSET__flixel_fonts_monsterrat_ttf') @:noCompletion #if display private #end class __ASSET__flixel_fonts_monsterrat_ttf extends lime.text.Font { public function new () { #if !html5 __fontPath = "flixel/fonts/monsterrat"; #else ascender = 968; descender = -251; height = 1219; numGlyphs = 263; underlinePosition = -150; underlineThickness = 50; unitsPerEM = 1000; #end name = "Monsterrat"; super (); }}


#end

#if (openfl && !flash)

#if html5
@:keep @:expose('__ASSET__OPENFL__flixel_fonts_nokiafc22_ttf') @:noCompletion #if display private #end class __ASSET__OPENFL__flixel_fonts_nokiafc22_ttf extends openfl.text.Font { public function new () { __fromLimeFont (new __ASSET__flixel_fonts_nokiafc22_ttf ()); super (); }}
@:keep @:expose('__ASSET__OPENFL__flixel_fonts_monsterrat_ttf') @:noCompletion #if display private #end class __ASSET__OPENFL__flixel_fonts_monsterrat_ttf extends openfl.text.Font { public function new () { __fromLimeFont (new __ASSET__flixel_fonts_monsterrat_ttf ()); super (); }}

#else
@:keep @:expose('__ASSET__OPENFL__flixel_fonts_nokiafc22_ttf') @:noCompletion #if display private #end class __ASSET__OPENFL__flixel_fonts_nokiafc22_ttf extends openfl.text.Font { public function new () { __fromLimeFont (new __ASSET__flixel_fonts_nokiafc22_ttf ()); super (); }}
@:keep @:expose('__ASSET__OPENFL__flixel_fonts_monsterrat_ttf') @:noCompletion #if display private #end class __ASSET__OPENFL__flixel_fonts_monsterrat_ttf extends openfl.text.Font { public function new () { __fromLimeFont (new __ASSET__flixel_fonts_monsterrat_ttf ()); super (); }}

#end

#end
#end

#end
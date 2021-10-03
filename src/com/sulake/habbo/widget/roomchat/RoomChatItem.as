package com.sulake.habbo.widget.roomchat
{
   import com.sulake.core.assets.IAssetLibrary;
   import com.sulake.core.window.IWindowContainer;
   import com.sulake.core.window.components.IBitmapWrapperWindow;
   import com.sulake.core.window.components.ILabelWindow;
   import com.sulake.core.window.components.IRegionWindow;
   import com.sulake.core.window.components.ITextWindow;
   import com.sulake.core.window.enum.WindowParam;
   import com.sulake.core.window.events.WindowMouseEvent;
   import com.sulake.habbo.localization.IHabboLocalizationManager;
   import com.sulake.habbo.utils.HabboWebTools;
   import com.sulake.habbo.widget.events.RoomWidgetChatUpdateEvent;
   import com.sulake.habbo.window.IHabboWindowManager;
   import com.sulake.habbo.window.enum.HabboWindowParam;
   import flash.display.BitmapData;
   import flash.display.BlendMode;
   import flash.geom.ColorTransform;
   import flash.geom.Matrix;
   import flash.geom.Point;
   import flash.geom.Rectangle;
   import flash.text.TextFormat;
   
   public class RoomChatItem
   {
      
      private static const const_961:Number = 18;
      
      private static const const_607:int = 6;
      
      private static const const_1345:int = 6;
      
      private static const const_962:int = 35;
      
      private static var var_369:IRegionWindow;
      
      private static var var_433:IRegionWindow;
      
      private static var var_224:IRegionWindow;
      
      private static var var_434:IRegionWindow;
       
      
      private var _widget:RoomChatWidget;
      
      private var _windowManager:IHabboWindowManager;
      
      private var var_80:IHabboLocalizationManager;
      
      private var _window:IRegionWindow;
      
      private var _assetLibrary:IAssetLibrary;
      
      private var _id:String;
      
      private var var_1892:String;
      
      private var var_2672:int = 0;
      
      private var var_2673:int = -1;
      
      private var var_1451:int;
      
      private var var_1202:int;
      
      private var var_971:String;
      
      private var _message:String;
      
      private var var_518:Array;
      
      private var var_773:Array;
      
      private var var_1596:int;
      
      private var var_1891:Number;
      
      private var var_260:BitmapData;
      
      private var var_2671:uint;
      
      private var _roomId:int;
      
      private var _roomCategory:int;
      
      private var var_1201:int;
      
      private var _width:Number = 0;
      
      private var var_1890:Boolean = false;
      
      private var var_772:Number = 0;
      
      private var _x:Number = 0;
      
      private var var_151:Number = 0;
      
      public function RoomChatItem(param1:RoomChatWidget, param2:IHabboWindowManager, param3:IAssetLibrary, param4:String, param5:IHabboLocalizationManager, param6:String)
      {
         this.var_971 = new String();
         this._message = new String();
         super();
         this._widget = param1;
         this._windowManager = param2;
         this._assetLibrary = param3;
         this._id = param4;
         this.var_80 = param5;
         this.var_1892 = param6;
         if(!var_224)
         {
            var_224 = this._windowManager.buildFromXML(this._assetLibrary.getAssetByName("bubble_speak").content as XML,1) as IRegionWindow;
            var_224.tags.push("roomchat_bubble");
            var_224.x = 0;
            var_224.y = 0;
            var_224.width = 0;
            var_224.background = true;
            var_224.mouseThreshold = 0;
            var_224.setParamFlag(WindowParam.WINDOW_PARAM_FORCE_CLIPPING,true);
         }
         if(!var_433)
         {
            var_433 = this._windowManager.buildFromXML(this._assetLibrary.getAssetByName("bubble_shout").content as XML,1) as IRegionWindow;
            var_433.tags.push("roomchat_bubble");
            var_433.x = 0;
            var_433.y = 0;
            var_433.width = 0;
            var_433.background = true;
            var_433.mouseThreshold = 0;
            var_224.setParamFlag(WindowParam.WINDOW_PARAM_FORCE_CLIPPING,true);
         }
         if(!var_434)
         {
            var_434 = this._windowManager.buildFromXML(this._assetLibrary.getAssetByName("bubble_whisper").content as XML,1) as IRegionWindow;
            var_434.tags.push("roomchat_bubble");
            var_434.x = 0;
            var_434.y = 0;
            var_434.width = 0;
            var_434.background = true;
            var_434.mouseThreshold = 0;
            var_224.setParamFlag(WindowParam.WINDOW_PARAM_FORCE_CLIPPING,true);
         }
         if(!var_369)
         {
            var_369 = this._windowManager.buildFromXML(this._assetLibrary.getAssetByName("bubble_whisper").content as XML,1) as IRegionWindow;
            var_369.tags.push("roomchat_bubble");
            var_369.x = 0;
            var_369.y = 0;
            var_369.width = 0;
            var_369.background = true;
            var_369.mouseThreshold = 0;
            var_224.setParamFlag(WindowParam.WINDOW_PARAM_FORCE_CLIPPING,true);
         }
      }
      
      public function dispose() : void
      {
         if(this._window != null)
         {
            this._window.dispose();
            this._window = null;
            this._widget = null;
            this._windowManager = null;
            this.var_80 = null;
            this.var_260 = null;
         }
      }
      
      public function define(param1:RoomWidgetChatUpdateEvent) : void
      {
         this.var_1451 = param1.chatType;
         this.var_1202 = param1.userId;
         this.var_971 = param1.userName;
         this.var_1201 = param1.userCategory;
         this._message = param1.text;
         this.var_518 = param1.links;
         this.var_1891 = param1.userX;
         this.var_260 = param1.userImage;
         this.var_2671 = param1.userColor;
         this._roomId = param1.roomId;
         this._roomCategory = param1.roomCategory;
         this.renderView();
      }
      
      public function get view() : IWindowContainer
      {
         return this._window;
      }
      
      public function get screenLevel() : int
      {
         return this.var_2673;
      }
      
      public function get timeStamp() : int
      {
         return this.var_1596;
      }
      
      public function get senderX() : Number
      {
         return this.var_1891;
      }
      
      public function set senderX(param1:Number) : void
      {
         this.var_1891 = param1;
      }
      
      public function get width() : Number
      {
         return this._width;
      }
      
      public function get height() : Number
      {
         return const_961;
      }
      
      public function get message() : String
      {
         return this._message;
      }
      
      public function get x() : Number
      {
         return this._x;
      }
      
      public function get y() : Number
      {
         return this.var_151;
      }
      
      public function get aboveLevels() : int
      {
         return this.var_2672;
      }
      
      public function set aboveLevels(param1:int) : void
      {
         this.var_2672 = param1;
      }
      
      public function set screenLevel(param1:int) : void
      {
         this.var_2673 = param1;
      }
      
      public function set timeStamp(param1:int) : void
      {
         this.var_1596 = param1;
      }
      
      public function set x(param1:Number) : void
      {
         this._x = param1;
         if(this._window != null)
         {
            this._window.x = param1;
         }
      }
      
      public function set y(param1:Number) : void
      {
         this.var_151 = param1;
         if(this._window != null)
         {
            this._window.y = param1 - this.var_772;
         }
      }
      
      public function hidePointer() : void
      {
         if(this._window)
         {
            this._window.findChildByName("pointer").visible = false;
         }
      }
      
      public function setPointerOffset(param1:Number) : void
      {
         if(!this._window || this._window.disposed)
         {
            return;
         }
         var _loc2_:IBitmapWrapperWindow = this._window.findChildByName("pointer") as IBitmapWrapperWindow;
         var _loc3_:IBitmapWrapperWindow = this._window.findChildByName("middle") as IBitmapWrapperWindow;
         if(_loc3_ == null || _loc2_ == null)
         {
            return;
         }
         _loc2_.visible = true;
         param1 += this._window.width / 2;
         param1 = Math.min(param1,_loc3_.rectangle.right - _loc2_.width);
         param1 = Math.max(param1,_loc3_.rectangle.left);
         _loc2_.x = param1;
      }
      
      public function checkOverlap(param1:Number, param2:Number, param3:Number, param4:Number) : Boolean
      {
         var _loc5_:Rectangle = new Rectangle(this._x,this.var_151,this.width,const_961);
         var _loc6_:Rectangle = new Rectangle(param1,param2,param3,param4);
         return _loc5_.intersects(_loc6_);
      }
      
      public function hideView() : void
      {
         if(this._window)
         {
            this._window.dispose();
         }
         this._window = null;
         this.var_1890 = false;
      }
      
      public function renderView() : void
      {
         var messageWidth:int = 0;
         var x1:int = 0;
         var y1:int = 0;
         var userIconWindow:IBitmapWrapperWindow = null;
         var i:int = 0;
         var lastLinkEndPos:int = 0;
         var linkFormat:TextFormat = null;
         var filteredLink:String = null;
         var placeHolder:String = null;
         var placeholderPos:int = 0;
         var linkPos:Array = null;
         if(this.var_1890)
         {
            return;
         }
         this.var_1890 = true;
         if(this._window)
         {
            return;
         }
         var isRespect:Boolean = false;
         switch(this.var_1451)
         {
            case RoomWidgetChatUpdateEvent.const_130:
               this._window = var_224.clone() as IRegionWindow;
               break;
            case RoomWidgetChatUpdateEvent.const_137:
               this._window = var_434.clone() as IRegionWindow;
               break;
            case RoomWidgetChatUpdateEvent.const_118:
               this._window = var_433.clone() as IRegionWindow;
               break;
            case RoomWidgetChatUpdateEvent.const_307:
               this._window = var_369.clone() as IRegionWindow;
               isRespect = true;
               break;
            case RoomWidgetChatUpdateEvent.const_324:
               this._window = var_369.clone() as IRegionWindow;
               isRespect = true;
         }
         var background:IBitmapWrapperWindow = this._window.findChildByName("background") as IBitmapWrapperWindow;
         var nameWindow:ILabelWindow = this._window.findChildByName("name") as ILabelWindow;
         var textWindow:ITextWindow = this._window.findChildByName("message") as ITextWindow;
         var pointerWindow:IBitmapWrapperWindow = this._window.findChildByName("pointer") as IBitmapWrapperWindow;
         var pointerBitmapData:BitmapData = this._assetLibrary.getAssetByName("chat_bubble_pointer").content as BitmapData;
         var totalHeight:Number = this._window.height;
         var topOffset:int = 0;
         if(this.var_260 != null)
         {
            topOffset = Math.max(0,(this.var_260.height - background.height) / 2);
            totalHeight = Math.max(totalHeight,this.var_260.height);
         }
         this._width = 0;
         this._window.x = this._x;
         this._window.y = this.var_151;
         this._window.width = 0;
         this._window.height = totalHeight;
         this.enableTooltip();
         this.addEventListeners(this._window);
         if(this.var_260 && !isRespect)
         {
            x1 = 14 - this.var_260.width / 2;
            y1 = Math.max(0,(background.height - this.var_260.height) / 2);
            userIconWindow = this._window.findChildByName("user_image") as IBitmapWrapperWindow;
            if(userIconWindow)
            {
               userIconWindow.width = this.var_260.width;
               userIconWindow.height = this.var_260.height;
               userIconWindow.bitmap = this.var_260;
               userIconWindow.disposesBitmap = false;
               userIconWindow.x = x1;
               userIconWindow.y = y1;
               this.var_772 = Math.max(0,(this.var_260.height - background.height) / 2);
               this._width += userIconWindow.x + this.var_260.width;
            }
         }
         if(nameWindow != null)
         {
            if(!isRespect)
            {
               nameWindow.text = this.var_971 + ": ";
               nameWindow.y += this.var_772;
               nameWindow.width = nameWindow.textWidth + const_607;
            }
            else
            {
               nameWindow.text = "";
               nameWindow.width = 0;
            }
            this._width += nameWindow.width;
         }
         if(this.var_1451 == RoomWidgetChatUpdateEvent.const_307)
         {
            textWindow.text = this.var_80.registerParameter("widgets.chatbubble.respect","username",this.var_971);
            this._width = const_962;
         }
         else if(this.var_1451 == RoomWidgetChatUpdateEvent.const_324)
         {
            textWindow.text = this.var_80.registerParameter("widget.chatbubble.petrespect","petname",this.var_971);
            this._width = const_962;
         }
         else if(this.var_518 == null)
         {
            textWindow.text = this.message;
         }
         else
         {
            this.var_773 = new Array();
            lastLinkEndPos = -1;
            i = 0;
            while(i < this.var_518.length)
            {
               filteredLink = this.var_518[i][1];
               placeHolder = "{" + i + "}";
               placeholderPos = this._message.indexOf(placeHolder);
               lastLinkEndPos = placeholderPos + filteredLink.length;
               this.var_773.push([placeholderPos,lastLinkEndPos]);
               this._message = this._message.replace(placeHolder,filteredLink);
               i++;
            }
            textWindow.text = this.message;
            textWindow.immediateClickMode = true;
            textWindow.setParamFlag(WindowParam.const_32,false);
            textWindow.setParamFlag(WindowParam.WINDOW_PARAM_FORCE_CLIPPING,true);
            textWindow.addEventListener(WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK,this.onMessageLinkMouseClick);
            linkFormat = textWindow.getTextFormat();
            linkFormat.color = 5923473;
            linkFormat.underline = true;
            i = 0;
            while(i < this.var_773.length)
            {
               linkPos = this.var_773[i];
               try
               {
                  textWindow.setTextFormat(linkFormat,linkPos[0],linkPos[1]);
               }
               catch(e:RangeError)
               {
                  Logger.log("Chat message links were malformed. Could not set TextFormat");
               }
               i++;
            }
         }
         if(textWindow.visible)
         {
            textWindow.x = this._width;
            if(nameWindow != null)
            {
               textWindow.x = nameWindow.x + nameWindow.width;
               if(nameWindow.width > const_607)
               {
                  textWindow.x -= const_607 - 1;
               }
            }
            textWindow.y += this.var_772;
            messageWidth = textWindow.textWidth;
            textWindow.width = messageWidth + const_1345;
            this._width += textWindow.width;
         }
         if(pointerWindow != null && pointerWindow.visible)
         {
            pointerWindow.bitmap = pointerBitmapData;
            pointerWindow.disposesBitmap = false;
            pointerWindow.x = this._width / 2;
            pointerWindow.y += this.var_772;
         }
         var bitmap:BitmapData = this.buildBubbleImage(nameWindow.width + textWindow.width,background.height,this.var_2671,isRespect);
         this._window.width = bitmap.width;
         this._window.y -= this.var_772;
         this._width = this._window.width;
         background.bitmap = bitmap;
         background.y = this.var_772;
      }
      
      private function buildBubbleImage(param1:int, param2:int, param3:uint, param4:Boolean) : BitmapData
      {
         var _loc13_:* = null;
         var _loc14_:* = 0;
         var _loc15_:* = 0;
         var _loc16_:* = 0;
         var _loc5_:BitmapData = this._assetLibrary.getAssetByName("chat_bubble_left").content as BitmapData;
         var _loc6_:BitmapData = this._assetLibrary.getAssetByName("chat_bubble_middle").content as BitmapData;
         var _loc7_:BitmapData = this._assetLibrary.getAssetByName("chat_bubble_left_color").content as BitmapData;
         var _loc8_:BitmapData = this._assetLibrary.getAssetByName("chat_bubble_right").content as BitmapData;
         var _loc9_:int = 0;
         var _loc10_:Point = new Point();
         var _loc11_:BitmapData = new BitmapData(_loc5_.width + param1 + _loc8_.width,param2,true,16711935);
         _loc9_ += _loc5_.width;
         _loc11_.copyPixels(_loc5_,_loc5_.rect,_loc10_);
         if(param4)
         {
            _loc13_ = this._assetLibrary.getAssetByName("chat_bubble_left_gen").content as BitmapData;
            _loc11_.copyPixels(_loc13_,_loc13_.rect,_loc10_,null,null,true);
         }
         else
         {
            _loc14_ = 232;
            _loc15_ = 177;
            _loc16_ = 55;
            if(param3 != 0)
            {
               _loc14_ = uint(param3 >> 16 & 255);
               _loc15_ = uint(param3 >> 8 & 255);
               _loc16_ = uint(param3 >> 0 & 255);
            }
            _loc11_.draw(_loc7_,null,new ColorTransform(_loc14_ / 255,_loc15_ / 255,_loc16_ / 255),BlendMode.DARKEN);
         }
         var _loc12_:Matrix = new Matrix();
         _loc12_.scale(param1 / _loc6_.width,1);
         _loc12_.translate(_loc9_,0);
         _loc11_.draw(_loc6_,_loc12_);
         _loc9_ += param1;
         _loc10_.x = _loc9_;
         _loc11_.copyPixels(_loc8_,_loc8_.rect,_loc10_);
         _loc9_ += _loc8_.width;
         return _loc11_;
      }
      
      public function enableTooltip() : void
      {
         if(this._window != null)
         {
            this._window.toolTipCaption = "${chat.history.drag.tooltip}";
            this._window.toolTipDelay = 500;
         }
      }
      
      public function disableTooltip() : void
      {
         if(this._window != null)
         {
            this._window.toolTipCaption = "";
         }
      }
      
      private function addEventListeners(param1:IWindowContainer) : void
      {
         param1.setParamFlag(HabboWindowParam.const_37,true);
         param1.addEventListener(WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK,this.onBubbleMouseClick);
         param1.addEventListener(WindowMouseEvent.const_43,this.onBubbleMouseDown);
         param1.addEventListener(WindowMouseEvent.WINDOW_EVENT_MOUSE_OVER,this.onBubbleMouseOver);
         param1.addEventListener(WindowMouseEvent.const_25,this.onBubbleMouseOut);
         param1.addEventListener(WindowMouseEvent.const_58,this.onBubbleMouseUp);
      }
      
      private function onMessageLinkMouseClick(param1:WindowMouseEvent) : void
      {
         var _loc2_:int = param1.target.getCharIndexAtPoint(param1.localX,param1.localY);
         var _loc3_:int = 0;
         while(_loc3_ < this.var_773.length)
         {
            if(_loc2_ >= this.var_773[_loc3_][0] && _loc2_ <= this.var_773[_loc3_][1])
            {
               if(this.var_518[_loc3_][2] == 0)
               {
                  HabboWebTools.openExternalLinkWarning(this.var_518[_loc3_][0]);
               }
               else if(this.var_518[_loc3_][2] == 1)
               {
                  HabboWebTools.openWebPage(this.var_1892 + this.var_518[_loc3_][0],"habboMain");
               }
               else
               {
                  HabboWebTools.openWebPage(this.var_1892 + this.var_518[_loc3_][0]);
               }
            }
            _loc3_++;
         }
         param1.stopImmediatePropagation();
      }
      
      private function onBubbleMouseClick(param1:WindowMouseEvent) : void
      {
         this._widget.onItemMouseClick(this.var_1202,this.var_971,this.var_1201,this._roomId,this._roomCategory,param1);
      }
      
      private function onBubbleMouseDown(param1:WindowMouseEvent) : void
      {
         this._widget.onItemMouseDown(this.var_1202,this.var_1201,this._roomId,this._roomCategory,param1);
      }
      
      private function onBubbleMouseOver(param1:WindowMouseEvent) : void
      {
         this._widget.onItemMouseOver(this.var_1202,this.var_1201,this._roomId,this._roomCategory,param1);
      }
      
      private function onBubbleMouseOut(param1:WindowMouseEvent) : void
      {
         this._widget.onItemMouseOut(this.var_1202,this.var_1201,this._roomId,this._roomCategory,param1);
      }
      
      private function onBubbleMouseUp(param1:WindowMouseEvent) : void
      {
         this._widget.mouseUp();
      }
   }
}

package com.sulake.core.window
{
   import com.sulake.core.localization.ICoreLocalizationManager;
   import com.sulake.core.localization.ILocalizable;
   import com.sulake.core.runtime.IDisposable;
   import com.sulake.core.runtime.IUpdateReceiver;
   import com.sulake.core.window.components.DesktopController;
   import com.sulake.core.window.components.IDesktopWindow;
   import com.sulake.core.window.components.SubstituteParentController;
   import com.sulake.core.window.enum.WindowParam;
   import com.sulake.core.window.enum.WindowState;
   import com.sulake.core.window.graphics.IGraphicContextHost;
   import com.sulake.core.window.graphics.IWindowRenderer;
   import com.sulake.core.window.services.IInternalWindowServices;
   import com.sulake.core.window.services.ServiceManager;
   import com.sulake.core.window.utils.EventProcessorState;
   import com.sulake.core.window.utils.IEventProcessor;
   import com.sulake.core.window.utils.IEventQueue;
   import com.sulake.core.window.utils.IMouseCursor;
   import com.sulake.core.window.utils.IWindowParser;
   import com.sulake.core.window.utils.MouseCursorControl;
   import com.sulake.core.window.utils.MouseEventProcessor;
   import com.sulake.core.window.utils.MouseEventQueue;
   import com.sulake.core.window.utils.WindowParser;
   import com.sulake.core.window.utils.tablet.TabletEventProcessor;
   import com.sulake.core.window.utils.tablet.TabletEventQueue;
   import flash.display.DisplayObject;
   import flash.display.DisplayObjectContainer;
   import flash.display.Stage;
   import flash.events.Event;
   import flash.geom.Rectangle;
   
   public class WindowContext implements IWindowContext, IDisposable, IUpdateReceiver
   {
      
      public static const const_424:uint = 0;
      
      public static const const_1409:uint = 1;
      
      public static const const_1796:int = 0;
      
      public static const const_1735:int = 1;
      
      public static const const_1837:int = 2;
      
      public static const const_1849:int = 3;
      
      public static const const_1585:int = 4;
      
      public static const const_361:int = 5;
      
      public static var var_1478:IMouseCursor;
      
      public static var var_375:IEventQueue;
      
      private static var var_552:IEventProcessor;
      
      private static var var_1550:uint = const_424;
      
      private static var stage:Stage;
      
      private static var var_152:IWindowRenderer;
       
      
      private var _eventProcessorState:EventProcessorState;
      
      private var var_2112:IWindowContextStateListener;
      
      protected var _localization:ICoreLocalizationManager;
      
      protected var var_183:DisplayObjectContainer;
      
      protected var var_2789:Boolean = true;
      
      protected var var_1229:Error;
      
      protected var var_1971:int = -1;
      
      protected var var_1228:IInternalWindowServices;
      
      protected var var_1482:IWindowParser;
      
      protected var var_2733:IWindowFactory;
      
      protected var var_137:IDesktopWindow;
      
      protected var var_1483:SubstituteParentController;
      
      private var _disposed:Boolean = false;
      
      private var var_536:Boolean = false;
      
      private var var_2113:Boolean = false;
      
      private var _name:String;
      
      public function WindowContext(param1:String, param2:IWindowRenderer, param3:IWindowFactory, param4:ICoreLocalizationManager, param5:DisplayObjectContainer, param6:Rectangle, param7:IWindowContextStateListener)
      {
         super();
         this._name = param1;
         var_152 = param2;
         this._localization = param4;
         this.var_183 = param5;
         this.var_1228 = new ServiceManager(this,param5);
         this.var_2733 = param3;
         this.var_1482 = new WindowParser(this);
         this.var_2112 = param7;
         if(!stage)
         {
            if(this.var_183 is Stage)
            {
               stage = this.var_183 as Stage;
            }
            else if(this.var_183.stage)
            {
               stage = this.var_183.stage;
            }
         }
         Classes.init();
         if(param6 == null)
         {
            param6 = new Rectangle(0,0,800,600);
         }
         this.var_137 = new DesktopController("_CONTEXT_DESKTOP_" + this._name,this,param6);
         this.var_183.addChild(this.var_137.getDisplayObject());
         this.var_183.doubleClickEnabled = true;
         this.var_183.addEventListener(Event.RESIZE,this.stageResizedHandler);
         this._eventProcessorState = new EventProcessorState(var_152,this.var_137,this.var_137,null,this.var_2112);
         inputMode = const_424;
         this.var_1483 = new SubstituteParentController(this);
      }
      
      public static function get inputMode() : uint
      {
         return var_1550;
      }
      
      public static function set inputMode(param1:uint) : void
      {
         var value:uint = param1;
         if(var_375)
         {
            if(var_375 is IDisposable)
            {
               IDisposable(var_375).dispose();
            }
         }
         if(var_552)
         {
            if(var_552 is IDisposable)
            {
               IDisposable(var_552).dispose();
            }
         }
         switch(value)
         {
            case const_424:
               var_375 = new MouseEventQueue(stage);
               var_552 = new MouseEventProcessor();
               try
               {
               }
               catch(e:Error)
               {
               }
               break;
            case const_1409:
               var_375 = new TabletEventQueue(stage);
               var_552 = new TabletEventProcessor();
               try
               {
               }
               catch(e:Error)
               {
               }
               break;
            default:
               inputMode = const_424;
               throw new Error("Unknown input mode " + value);
         }
      }
      
      public function get disposed() : Boolean
      {
         return this._disposed;
      }
      
      public function dispose() : void
      {
         if(!this._disposed)
         {
            this._disposed = true;
            this.var_183.removeEventListener(Event.RESIZE,this.stageResizedHandler);
            this.var_183.removeChild(IGraphicContextHost(this.var_137).getGraphicContext(true) as DisplayObject);
            this.var_137.destroy();
            this.var_137 = null;
            this.var_1483.destroy();
            this.var_1483 = null;
            if(this.var_1228 is IDisposable)
            {
               IDisposable(this.var_1228).dispose();
            }
            this.var_1228 = null;
            this.var_1482.dispose();
            this.var_1482 = null;
            var_152 = null;
         }
      }
      
      public function getLastError() : Error
      {
         return this.var_1229;
      }
      
      public function getLastErrorCode() : int
      {
         return this.var_1971;
      }
      
      public function handleError(param1:int, param2:Error) : void
      {
         this.var_1229 = param2;
         this.var_1971 = param1;
         if(this.var_2789)
         {
            throw param2;
         }
      }
      
      public function flushError() : void
      {
         this.var_1229 = null;
         this.var_1971 = -1;
      }
      
      public function getWindowServices() : IInternalWindowServices
      {
         return this.var_1228;
      }
      
      public function getWindowParser() : IWindowParser
      {
         return this.var_1482;
      }
      
      public function getWindowFactory() : IWindowFactory
      {
         return this.var_2733;
      }
      
      public function getDesktopWindow() : IDesktopWindow
      {
         return this.var_137;
      }
      
      public function getMouseCursor() : IMouseCursor
      {
         if(var_1478 == null)
         {
            var_1478 = new MouseCursorControl(this.var_183);
         }
         return var_1478;
      }
      
      public function findWindowByName(param1:String) : IWindow
      {
         return this.var_137.findChildByName(param1);
      }
      
      public function registerLocalizationListener(param1:String, param2:IWindow) : void
      {
         this._localization.registerListener(param1,param2 as ILocalizable);
      }
      
      public function removeLocalizationListener(param1:String, param2:IWindow) : void
      {
         this._localization.removeListener(param1,param2 as ILocalizable);
      }
      
      public function create(param1:String, param2:String, param3:uint, param4:uint, param5:uint, param6:Rectangle, param7:Function, param8:IWindow, param9:uint, param10:Array = null, param11:Array = null) : IWindow
      {
         var _loc12_:* = null;
         var _loc13_:Class = Classes.getWindowClassByType(param3);
         if(_loc13_ == null)
         {
            this.handleError(WindowContext.const_1585,new Error("Failed to solve implementation for window \"" + param1 + "\"!"));
            return null;
         }
         if(param8 == null)
         {
            if(param5 & 0)
            {
               param8 = this.var_1483;
            }
         }
         _loc12_ = new _loc13_(param1,param3,param4,param5,this,param6,param8 != null ? param8 : this.var_137,param7,param10,param11,param9);
         if(param2 && param2.length)
         {
            _loc12_.caption = param2;
         }
         return _loc12_;
      }
      
      public function destroy(param1:IWindow) : Boolean
      {
         if(param1 == this.var_137)
         {
            this.var_137 = null;
         }
         if(param1.state != WindowState.const_537)
         {
            param1.destroy();
         }
         return true;
      }
      
      public function invalidate(param1:IWindow, param2:Rectangle, param3:uint) : void
      {
         if(!this.disposed)
         {
            var_152.addToRenderQueue(WindowController(param1),param2,param3);
         }
      }
      
      public function update(param1:uint) : void
      {
         this.var_536 = true;
         if(this.var_1229)
         {
            throw this.var_1229;
         }
         var_552.process(this._eventProcessorState,var_375);
         this.var_536 = false;
      }
      
      public function render(param1:uint) : void
      {
         this.var_2113 = true;
         var_152.update(param1);
         this.var_2113 = false;
      }
      
      private function stageResizedHandler(param1:Event) : void
      {
         if(this.var_137 != null && !this.var_137.disposed)
         {
            if(this.var_183 is Stage)
            {
               this.var_137.width = Stage(this.var_183).stageWidth;
               this.var_137.height = Stage(this.var_183).stageHeight;
            }
            else
            {
               this.var_137.width = this.var_183.width;
               this.var_137.height = this.var_183.height;
            }
         }
      }
   }
}

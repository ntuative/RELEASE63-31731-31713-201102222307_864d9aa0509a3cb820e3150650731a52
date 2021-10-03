package com.sulake.core.window.events
{
   import com.sulake.core.window.IWindow;
   import flash.events.Event;
   
   public class WindowEvent extends Event
   {
      
      public static const const_1511:String = "WE_CREATE";
      
      public static const const_1432:String = "WE_CREATED";
      
      public static const const_1500:String = "WE_DESTROY";
      
      public static const const_319:String = "WE_DESTROYED";
      
      public static const const_1540:String = "WE_OPEN";
      
      public static const const_1424:String = "WE_OPENED";
      
      public static const const_1608:String = "WE_CLOSE";
      
      public static const const_1408:String = "WE_CLOSED";
      
      public static const const_1395:String = "WE_FOCUS";
      
      public static const const_286:String = "WE_FOCUSED";
      
      public static const const_1426:String = "WE_UNFOCUS";
      
      public static const const_1379:String = "WE_UNFOCUSED";
      
      public static const const_1627:String = "WE_ACTIVATE";
      
      public static const const_1477:String = "WE_ACTIVATED";
      
      public static const const_1567:String = "WE_DEACTIVATE";
      
      public static const const_850:String = "WE_DEACTIVATED";
      
      public static const const_536:String = "WE_SELECT";
      
      public static const const_57:String = "WE_SELECTED";
      
      public static const const_747:String = "WE_UNSELECT";
      
      public static const const_755:String = "WE_UNSELECTED";
      
      public static const const_1767:String = "WE_ATTACH";
      
      public static const const_1795:String = "WE_ATTACHED";
      
      public static const const_1855:String = "WE_DETACH";
      
      public static const const_1935:String = "WE_DETACHED";
      
      public static const const_1368:String = "WE_LOCK";
      
      public static const const_1536:String = "WE_LOCKED";
      
      public static const const_1369:String = "WE_UNLOCK";
      
      public static const const_1574:String = "WE_UNLOCKED";
      
      public static const const_721:String = "WE_ENABLE";
      
      public static const const_312:String = "WE_ENABLED";
      
      public static const const_880:String = "WE_DISABLE";
      
      public static const const_255:String = "WE_DISABLED";
      
      public static const const_1549:String = "WE_RELOCATE";
      
      public static const const_354:String = "WE_RELOCATED";
      
      public static const const_1416:String = "WE_RESIZE";
      
      public static const const_48:String = "WE_RESIZED";
      
      public static const const_1634:String = "WE_MINIMIZE";
      
      public static const const_1578:String = "WE_MINIMIZED";
      
      public static const const_1570:String = "WE_MAXIMIZE";
      
      public static const const_1450:String = "WE_MAXIMIZED";
      
      public static const const_1381:String = "WE_RESTORE";
      
      public static const const_1514:String = "WE_RESTORED";
      
      public static const const_1858:String = "WE_ARRANGE";
      
      public static const const_1807:String = "WE_ARRANGED";
      
      public static const const_107:String = "WE_UPDATE";
      
      public static const const_1721:String = "WE_UPDATED";
      
      public static const const_1921:String = "WE_CHILD_RELOCATE";
      
      public static const const_544:String = "WE_CHILD_RELOCATED";
      
      public static const const_1791:String = "WE_CHILD_RESIZE";
      
      public static const const_314:String = "WE_CHILD_RESIZED";
      
      public static const const_1842:String = "WE_CHILD_REMOVE";
      
      public static const const_578:String = "WE_CHILD_REMOVED";
      
      public static const const_1860:String = "WE_PARENT_RELOCATE";
      
      public static const const_1772:String = "WE_PARENT_RELOCATED";
      
      public static const const_1936:String = "WE_PARENT_RESIZE";
      
      public static const const_1460:String = "WE_PARENT_RESIZED";
      
      public static const const_177:String = "WE_OK";
      
      public static const const_672:String = "WE_CANCEL";
      
      public static const const_102:String = "WE_CHANGE";
      
      public static const WINDOW_EVENT_MESSAGE:String = "WE_MESSAGE";
      
      public static const const_445:String = "WE_SCROLL";
      
      public static const const_156:String = "";
       
      
      protected var _type:String = "";
      
      protected var _window:IWindow;
      
      protected var var_1992:IWindow;
      
      protected var var_1991:Boolean;
      
      public function WindowEvent(param1:String, param2:IWindow, param3:IWindow, param4:Boolean = false, param5:Boolean = false)
      {
         this._type = param1;
         this._window = param2;
         this.var_1992 = param3;
         this.var_1991 = false;
         super(param1,param4,param5);
      }
      
      public function set type(param1:String) : void
      {
         this._type = param1;
      }
      
      override public function get type() : String
      {
         return this._type;
      }
      
      public function get window() : IWindow
      {
         return this._window;
      }
      
      public function get related() : IWindow
      {
         return this.var_1992;
      }
      
      override public function clone() : Event
      {
         return new WindowEvent(this._type,this.window,this.related,bubbles,cancelable);
      }
      
      public function preventWindowOperation() : void
      {
         if(cancelable)
         {
            this.var_1991 = true;
            stopImmediatePropagation();
            return;
         }
         throw new Error("Attempted to prevent window operation that is not canceable!");
      }
      
      public function isWindowOperationPrevented() : Boolean
      {
         return this.var_1991;
      }
      
      override public function toString() : String
      {
         return formatToString("WindowEvent","type","bubbles","cancelable","window");
      }
   }
}

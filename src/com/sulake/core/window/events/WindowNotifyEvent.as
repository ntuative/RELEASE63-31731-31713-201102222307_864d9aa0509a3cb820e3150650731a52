package com.sulake.core.window.events
{
   import com.sulake.core.window.IWindow;
   import flash.events.Event;
   
   public class WindowNotifyEvent extends WindowEvent
   {
      
      public static const const_1607:String = "WN_CRETAE";
      
      public static const const_1586:String = "WN_CREATED";
      
      public static const const_997:String = "WN_DESTROY";
      
      public static const const_982:String = "WN_DESTROYED";
      
      public static const const_1197:String = "WN_OPEN";
      
      public static const const_1066:String = "WN_OPENED";
      
      public static const const_975:String = "WN_CLOSE";
      
      public static const const_984:String = "WN_CLOSED";
      
      public static const const_1022:String = "WN_FOCUS";
      
      public static const const_1088:String = "WN_FOCUSED";
      
      public static const const_1189:String = "WN_UNFOCUS";
      
      public static const const_1027:String = "WN_UNFOCUSED";
      
      public static const const_1193:String = "WN_ACTIVATE";
      
      public static const const_406:String = "WN_ACTVATED";
      
      public static const const_1099:String = "WN_DEACTIVATE";
      
      public static const const_1074:String = "WN_DEACTIVATED";
      
      public static const const_429:String = "WN_SELECT";
      
      public static const const_363:String = "WN_SELECTED";
      
      public static const const_876:String = "WN_UNSELECT";
      
      public static const const_662:String = "WN_UNSELECTED";
      
      public static const const_1038:String = "WN_LOCK";
      
      public static const const_1199:String = "WN_LOCKED";
      
      public static const const_1037:String = "WN_UNLOCK";
      
      public static const const_1053:String = "WN_UNLOCKED";
      
      public static const const_1207:String = "WN_ENABLE";
      
      public static const const_843:String = "WN_ENABLED";
      
      public static const const_1023:String = "WN_DISABLE";
      
      public static const const_711:String = "WN_DISABLED";
      
      public static const const_753:String = "WN_RESIZE";
      
      public static const const_194:String = "WN_RESIZED";
      
      public static const const_1145:String = "WN_RELOCATE";
      
      public static const const_499:String = "WN_RELOCATED";
      
      public static const const_1166:String = "WN_MINIMIZE";
      
      public static const const_1150:String = "WN_MINIMIZED";
      
      public static const const_1080:String = "WN_MAXIMIZE";
      
      public static const const_1113:String = "WN_MAXIMIZED";
      
      public static const const_1035:String = "WN_RESTORE";
      
      public static const const_1055:String = "WN_RESTORED";
      
      public static const const_1748:String = "WN_ARRANGE";
      
      public static const const_1820:String = "WN_ARRANGED";
      
      public static const const_1814:String = "WN_UPDATE";
      
      public static const const_1815:String = "WN_UPDATED";
      
      public static const const_375:String = "WN_CHILD_ADDED";
      
      public static const const_770:String = "WN_CHILD_REMOVED";
      
      public static const const_292:String = "WN_CHILD_RESIZED";
      
      public static const const_288:String = "WN_CHILD_RELOCATED";
      
      public static const const_257:String = "WN_CHILD_ACTIVATED";
      
      public static const const_486:String = "WN_PARENT_ADDED";
      
      public static const const_1025:String = "WN_PARENT_REMOVED";
      
      public static const const_569:String = "WN_PARENT_RESIZED";
      
      public static const const_1094:String = "WN_PARENT_RELOCATED";
      
      public static const const_741:String = "WN_PARENT_ACTIVATED";
      
      public static const const_430:String = "WN_STATE_UPDATED";
      
      public static const const_504:String = "WN_STYLE_UPDATED";
      
      public static const const_516:String = "WN_PARAM_UPDATED";
      
      public static const const_1895:String = "";
       
      
      public function WindowNotifyEvent(param1:String, param2:IWindow, param3:IWindow, param4:Boolean = false)
      {
         super(param1,param2,param3,false,param4);
      }
      
      override public function clone() : Event
      {
         return new WindowNotifyEvent(type,_window,var_1992,cancelable);
      }
      
      override public function toString() : String
      {
         return formatToString("WindowNotifyEvent","type","cancelable");
      }
   }
}

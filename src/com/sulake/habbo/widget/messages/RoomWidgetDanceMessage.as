package com.sulake.habbo.widget.messages
{
   public class RoomWidgetDanceMessage extends RoomWidgetMessage
   {
      
      public static const const_852:String = "RWCM_MESSAGE_DANCE";
      
      public static const const_1063:int = 0;
      
      public static const const_1595:Array = [2,3,4];
       
      
      private var var_82:int = 0;
      
      public function RoomWidgetDanceMessage(param1:int)
      {
         super(const_852);
         this.var_82 = param1;
      }
      
      public function get style() : int
      {
         return this.var_82;
      }
   }
}

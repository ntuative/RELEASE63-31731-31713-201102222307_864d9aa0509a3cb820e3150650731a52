package com.sulake.habbo.widget.messages
{
   public class RoomWidgetChangeMottoMessage extends RoomWidgetMessage
   {
      
      public static const const_831:String = "RWVM_CHANGE_MOTTO_MESSAGE";
       
      
      private var var_1702:String;
      
      public function RoomWidgetChangeMottoMessage(param1:String)
      {
         super(const_831);
         this.var_1702 = param1;
      }
      
      public function get motto() : String
      {
         return this.var_1702;
      }
   }
}

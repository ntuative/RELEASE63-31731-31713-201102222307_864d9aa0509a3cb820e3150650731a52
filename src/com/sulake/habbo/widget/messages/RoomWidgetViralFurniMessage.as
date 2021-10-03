package com.sulake.habbo.widget.messages
{
   public class RoomWidgetViralFurniMessage extends RoomWidgetMessage
   {
      
      public static const const_646:String = "RWVFM_VIRAL_FOUND";
      
      public static const const_158:String = "RWVFM_OPEN_PRESENT";
       
      
      private var var_348:int;
      
      public function RoomWidgetViralFurniMessage(param1:String)
      {
         super(param1);
      }
      
      public function get objectId() : int
      {
         return this.var_348;
      }
      
      public function set objectId(param1:int) : void
      {
         this.var_348 = param1;
      }
   }
}

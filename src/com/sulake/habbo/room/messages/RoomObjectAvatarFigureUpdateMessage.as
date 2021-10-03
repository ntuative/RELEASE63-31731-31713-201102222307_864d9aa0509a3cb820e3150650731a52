package com.sulake.habbo.room.messages
{
   public class RoomObjectAvatarFigureUpdateMessage extends RoomObjectUpdateStateMessage
   {
       
      
      private var var_540:String;
      
      private var var_2057:String;
      
      private var var_811:String;
      
      public function RoomObjectAvatarFigureUpdateMessage(param1:String, param2:String = null, param3:String = null)
      {
         super();
         this.var_540 = param1;
         this.var_811 = param2;
         this.var_2057 = param3;
      }
      
      public function get figure() : String
      {
         return this.var_540;
      }
      
      public function get race() : String
      {
         return this.var_2057;
      }
      
      public function get gender() : String
      {
         return this.var_811;
      }
   }
}

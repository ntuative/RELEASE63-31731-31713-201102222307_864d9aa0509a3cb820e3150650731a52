package com.sulake.habbo.communication.messages.incoming.avatar
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   
   public class OutfitData
   {
       
      
      private var var_1494:int;
      
      private var var_2130:String;
      
      private var var_811:String;
      
      public function OutfitData(param1:IMessageDataWrapper)
      {
         super();
         this.var_1494 = param1.readInteger();
         this.var_2130 = param1.readString();
         this.var_811 = param1.readString();
      }
      
      public function get slotId() : int
      {
         return this.var_1494;
      }
      
      public function get figureString() : String
      {
         return this.var_2130;
      }
      
      public function get gender() : String
      {
         return this.var_811;
      }
   }
}

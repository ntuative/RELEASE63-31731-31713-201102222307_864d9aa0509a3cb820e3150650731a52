package com.sulake.habbo.communication.messages.parser.catalog
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   public class NotEnoughBalanceMessageParser implements IMessageParser
   {
       
      
      private var var_1604:int = 0;
      
      private var var_1605:int = 0;
      
      private var var_1531:int = 0;
      
      public function NotEnoughBalanceMessageParser()
      {
         super();
      }
      
      public function get notEnoughCredits() : int
      {
         return this.var_1604;
      }
      
      public function get notEnoughActivityPoints() : int
      {
         return this.var_1605;
      }
      
      public function get activityPointType() : int
      {
         return this.var_1531;
      }
      
      public function flush() : Boolean
      {
         this.var_1604 = 0;
         this.var_1605 = 0;
         return true;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         this.var_1604 = param1.readInteger();
         this.var_1605 = param1.readInteger();
         this.var_1531 = param1.readInteger();
         return true;
      }
   }
}

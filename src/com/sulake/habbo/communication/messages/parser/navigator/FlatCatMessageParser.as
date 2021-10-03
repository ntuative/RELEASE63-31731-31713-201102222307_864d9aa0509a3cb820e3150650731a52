package com.sulake.habbo.communication.messages.parser.navigator
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   public class FlatCatMessageParser implements IMessageParser
   {
       
      
      private var var_338:int;
      
      private var var_1792:int;
      
      public function FlatCatMessageParser()
      {
         super();
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         this.var_338 = param1.readInteger();
         this.var_1792 = param1.readInteger();
         return true;
      }
      
      public function flush() : Boolean
      {
         this.var_338 = 0;
         this.var_1792 = 0;
         return true;
      }
      
      public function get flatId() : int
      {
         return this.var_338;
      }
      
      public function get nodeId() : int
      {
         return this.var_1792;
      }
   }
}

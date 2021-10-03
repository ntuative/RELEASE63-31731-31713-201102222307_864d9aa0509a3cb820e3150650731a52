package com.sulake.habbo.communication.messages.parser.room.session
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   public class CantConnectMessageParser implements IMessageParser
   {
      
      public static const const_1415:int = 1;
      
      public static const const_1859:int = 2;
      
      public static const const_1513:int = 3;
      
      public static const const_1449:int = 4;
       
      
      private var var_1257:int = 0;
      
      private var var_1258:String = "";
      
      public function CantConnectMessageParser()
      {
         super();
      }
      
      public function flush() : Boolean
      {
         this.var_1257 = 0;
         this.var_1258 = "";
         return true;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         this.var_1257 = param1.readInteger();
         if(this.var_1257 == 3)
         {
            this.var_1258 = param1.readString();
         }
         else
         {
            this.var_1258 = "";
         }
         return true;
      }
      
      public function get reason() : int
      {
         return this.var_1257;
      }
      
      public function get parameter() : String
      {
         return this.var_1258;
      }
   }
}

package com.sulake.habbo.communication.messages.incoming.moderation
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   
   public class ChatlineData
   {
       
      
      private var var_2000:int;
      
      private var var_2002:int;
      
      private var var_2003:int;
      
      private var var_2001:String;
      
      private var var_1712:String;
      
      public function ChatlineData(param1:IMessageDataWrapper)
      {
         super();
         this.var_2000 = param1.readInteger();
         this.var_2002 = param1.readInteger();
         this.var_2003 = param1.readInteger();
         this.var_2001 = param1.readString();
         this.var_1712 = param1.readString();
      }
      
      public function get hour() : int
      {
         return this.var_2000;
      }
      
      public function get minute() : int
      {
         return this.var_2002;
      }
      
      public function get chatterId() : int
      {
         return this.var_2003;
      }
      
      public function get chatterName() : String
      {
         return this.var_2001;
      }
      
      public function get msg() : String
      {
         return this.var_1712;
      }
   }
}

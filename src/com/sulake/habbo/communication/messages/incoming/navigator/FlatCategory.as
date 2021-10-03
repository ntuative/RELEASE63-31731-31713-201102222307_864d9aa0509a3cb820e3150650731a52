package com.sulake.habbo.communication.messages.incoming.navigator
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   
   public class FlatCategory
   {
       
      
      private var var_1792:int;
      
      private var var_2348:String;
      
      private var var_377:Boolean;
      
      public function FlatCategory(param1:IMessageDataWrapper)
      {
         super();
         this.var_1792 = param1.readInteger();
         this.var_2348 = param1.readString();
         this.var_377 = param1.readBoolean();
      }
      
      public function get nodeId() : int
      {
         return this.var_1792;
      }
      
      public function get nodeName() : String
      {
         return this.var_2348;
      }
      
      public function get visible() : Boolean
      {
         return this.var_377;
      }
   }
}

package com.sulake.habbo.communication.messages.outgoing.room.furniture
{
   import com.sulake.core.communication.messages.IMessageComposer;
   
   public class OpenPetPackageMessageComposer implements IMessageComposer
   {
       
      
      private var var_348:int;
      
      private var var_2157:String;
      
      public function OpenPetPackageMessageComposer(param1:int, param2:String)
      {
         super();
         this.var_348 = param1;
         this.var_2157 = param2;
      }
      
      public function getMessageArray() : Array
      {
         return [this.var_348,this.var_2157];
      }
      
      public function dispose() : void
      {
      }
   }
}

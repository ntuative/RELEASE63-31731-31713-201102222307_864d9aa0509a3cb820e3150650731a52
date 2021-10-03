package com.sulake.habbo.communication.messages.outgoing.tracking
{
   import com.sulake.core.communication.messages.IMessageComposer;
   
   public class LatencyPingReportMessageComposer implements IMessageComposer
   {
       
      
      private var var_2513:int;
      
      private var var_2512:int;
      
      private var var_2514:int;
      
      public function LatencyPingReportMessageComposer(param1:int, param2:int, param3:int)
      {
         super();
         this.var_2513 = param1;
         this.var_2512 = param2;
         this.var_2514 = param3;
      }
      
      public function getMessageArray() : Array
      {
         return [this.var_2513,this.var_2512,this.var_2514];
      }
      
      public function dispose() : void
      {
      }
   }
}

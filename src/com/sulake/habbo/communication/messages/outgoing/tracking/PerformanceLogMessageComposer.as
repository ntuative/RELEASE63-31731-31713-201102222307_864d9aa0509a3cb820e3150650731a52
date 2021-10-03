package com.sulake.habbo.communication.messages.outgoing.tracking
{
   import com.sulake.core.communication.messages.IMessageComposer;
   
   public class PerformanceLogMessageComposer implements IMessageComposer
   {
       
      
      private var var_2254:int = 0;
      
      private var var_1435:String = "";
      
      private var var_1861:String = "";
      
      private var var_2427:String = "";
      
      private var var_2426:String = "";
      
      private var var_1742:int = 0;
      
      private var var_2430:int = 0;
      
      private var var_2428:int = 0;
      
      private var var_1433:int = 0;
      
      private var var_2429:int = 0;
      
      private var var_1434:int = 0;
      
      public function PerformanceLogMessageComposer(param1:int, param2:String, param3:String, param4:String, param5:String, param6:Boolean, param7:int, param8:int, param9:int, param10:int, param11:int)
      {
         super();
         this.var_2254 = param1;
         this.var_1435 = param2;
         this.var_1861 = param3;
         this.var_2427 = param4;
         this.var_2426 = param5;
         if(param6)
         {
            this.var_1742 = 1;
         }
         else
         {
            this.var_1742 = 0;
         }
         this.var_2430 = param7;
         this.var_2428 = param8;
         this.var_1433 = param9;
         this.var_2429 = param10;
         this.var_1434 = param11;
      }
      
      public function dispose() : void
      {
      }
      
      public function getMessageArray() : Array
      {
         return [this.var_2254,this.var_1435,this.var_1861,this.var_2427,this.var_2426,this.var_1742,this.var_2430,this.var_2428,this.var_1433,this.var_2429,this.var_1434];
      }
   }
}

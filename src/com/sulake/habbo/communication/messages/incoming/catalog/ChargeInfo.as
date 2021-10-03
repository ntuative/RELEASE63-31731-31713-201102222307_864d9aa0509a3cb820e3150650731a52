package com.sulake.habbo.communication.messages.incoming.catalog
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   
   public class ChargeInfo
   {
       
      
      private var var_2410:int;
      
      private var var_2620:int;
      
      private var var_1051:int;
      
      private var var_1052:int;
      
      private var var_1531:int;
      
      private var var_2619:int;
      
      public function ChargeInfo(param1:IMessageDataWrapper)
      {
         super();
         this.var_2410 = param1.readInteger();
         this.var_2620 = param1.readInteger();
         this.var_1051 = param1.readInteger();
         this.var_1052 = param1.readInteger();
         this.var_1531 = param1.readInteger();
         this.var_2619 = param1.readInteger();
      }
      
      public function get stuffId() : int
      {
         return this.var_2410;
      }
      
      public function get charges() : int
      {
         return this.var_2620;
      }
      
      public function get priceInCredits() : int
      {
         return this.var_1051;
      }
      
      public function get priceInActivityPoints() : int
      {
         return this.var_1052;
      }
      
      public function get chargePatchSize() : int
      {
         return this.var_2619;
      }
      
      public function get activityPointType() : int
      {
         return this.var_1531;
      }
   }
}

package com.sulake.habbo.communication.messages.parser.marketplace
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   public class MarketplaceConfigurationParser implements IMessageParser
   {
       
      
      private var var_1247:Boolean;
      
      private var var_2306:int;
      
      private var var_1661:int;
      
      private var var_1660:int;
      
      private var var_2307:int;
      
      private var var_2308:int;
      
      private var var_2309:int;
      
      private var var_2282:int;
      
      public function MarketplaceConfigurationParser()
      {
         super();
      }
      
      public function get isEnabled() : Boolean
      {
         return this.var_1247;
      }
      
      public function get commission() : int
      {
         return this.var_2306;
      }
      
      public function get tokenBatchPrice() : int
      {
         return this.var_1661;
      }
      
      public function get tokenBatchSize() : int
      {
         return this.var_1660;
      }
      
      public function get offerMinPrice() : int
      {
         return this.var_2308;
      }
      
      public function get offerMaxPrice() : int
      {
         return this.var_2307;
      }
      
      public function get expirationHours() : int
      {
         return this.var_2309;
      }
      
      public function get averagePricePeriod() : int
      {
         return this.var_2282;
      }
      
      public function flush() : Boolean
      {
         return true;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         this.var_1247 = param1.readBoolean();
         this.var_2306 = param1.readInteger();
         this.var_1661 = param1.readInteger();
         this.var_1660 = param1.readInteger();
         this.var_2308 = param1.readInteger();
         this.var_2307 = param1.readInteger();
         this.var_2309 = param1.readInteger();
         this.var_2282 = param1.readInteger();
         return true;
      }
   }
}

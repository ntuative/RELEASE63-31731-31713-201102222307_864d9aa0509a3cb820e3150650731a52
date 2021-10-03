package com.sulake.habbo.communication.messages.parser.marketplace
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   public class MarketplaceItemStatsParser implements IMessageParser
   {
       
      
      private var var_2372:int;
      
      private var var_2371:int;
      
      private var var_2369:int;
      
      private var _dayOffsets:Array;
      
      private var var_1873:Array;
      
      private var var_1874:Array;
      
      private var var_2370:int;
      
      private var var_2373:int;
      
      public function MarketplaceItemStatsParser()
      {
         super();
      }
      
      public function get averagePrice() : int
      {
         return this.var_2372;
      }
      
      public function get offerCount() : int
      {
         return this.var_2371;
      }
      
      public function get historyLength() : int
      {
         return this.var_2369;
      }
      
      public function get dayOffsets() : Array
      {
         return this._dayOffsets;
      }
      
      public function get averagePrices() : Array
      {
         return this.var_1873;
      }
      
      public function get soldAmounts() : Array
      {
         return this.var_1874;
      }
      
      public function get furniTypeId() : int
      {
         return this.var_2370;
      }
      
      public function get method_2() : int
      {
         return this.var_2373;
      }
      
      public function flush() : Boolean
      {
         return true;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         this.var_2372 = param1.readInteger();
         this.var_2371 = param1.readInteger();
         this.var_2369 = param1.readInteger();
         var _loc2_:int = param1.readInteger();
         this._dayOffsets = [];
         this.var_1873 = [];
         this.var_1874 = [];
         var _loc3_:int = 0;
         while(_loc3_ < _loc2_)
         {
            this._dayOffsets.push(param1.readInteger());
            this.var_1873.push(param1.readInteger());
            this.var_1874.push(param1.readInteger());
            _loc3_++;
         }
         this.var_2373 = param1.readInteger();
         this.var_2370 = param1.readInteger();
         return true;
      }
   }
}

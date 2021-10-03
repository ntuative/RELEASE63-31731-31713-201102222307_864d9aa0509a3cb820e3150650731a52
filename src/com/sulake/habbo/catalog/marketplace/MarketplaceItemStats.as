package com.sulake.habbo.catalog.marketplace
{
   public class MarketplaceItemStats
   {
       
      
      private var var_2372:int;
      
      private var var_2371:int;
      
      private var var_2369:int;
      
      private var _dayOffsets:Array;
      
      private var var_1873:Array;
      
      private var var_1874:Array;
      
      private var var_2370:int;
      
      private var var_2373:int;
      
      public function MarketplaceItemStats()
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
      
      public function set averagePrice(param1:int) : void
      {
         this.var_2372 = param1;
      }
      
      public function set offerCount(param1:int) : void
      {
         this.var_2371 = param1;
      }
      
      public function set historyLength(param1:int) : void
      {
         this.var_2369 = param1;
      }
      
      public function set dayOffsets(param1:Array) : void
      {
         this._dayOffsets = param1.slice();
      }
      
      public function set averagePrices(param1:Array) : void
      {
         this.var_1873 = param1.slice();
      }
      
      public function set soldAmounts(param1:Array) : void
      {
         this.var_1874 = param1.slice();
      }
      
      public function set furniTypeId(param1:int) : void
      {
         this.var_2370 = param1;
      }
      
      public function set method_2(param1:int) : void
      {
         this.var_2373 = param1;
      }
   }
}

package com.sulake.habbo.communication.messages.incoming.marketplace
{
   public class MarketPlaceOffer
   {
       
      
      private var _offerId:int;
      
      private var _furniId:int;
      
      private var var_2519:int;
      
      private var var_1969:String;
      
      private var var_1651:int;
      
      private var var_378:int;
      
      private var var_2518:int = -1;
      
      private var var_2372:int;
      
      private var var_1857:int;
      
      public function MarketPlaceOffer(param1:int, param2:int, param3:int, param4:String, param5:int, param6:int, param7:int, param8:int, param9:int = -1)
      {
         super();
         this._offerId = param1;
         this._furniId = param2;
         this.var_2519 = param3;
         this.var_1969 = param4;
         this.var_1651 = param5;
         this.var_378 = param6;
         this.var_2518 = param7;
         this.var_2372 = param8;
         this.var_1857 = param9;
      }
      
      public function get offerId() : int
      {
         return this._offerId;
      }
      
      public function get furniId() : int
      {
         return this._furniId;
      }
      
      public function get furniType() : int
      {
         return this.var_2519;
      }
      
      public function get stuffData() : String
      {
         return this.var_1969;
      }
      
      public function get price() : int
      {
         return this.var_1651;
      }
      
      public function get status() : int
      {
         return this.var_378;
      }
      
      public function get timeLeftMinutes() : int
      {
         return this.var_2518;
      }
      
      public function get averagePrice() : int
      {
         return this.var_2372;
      }
      
      public function get offerCount() : int
      {
         return this.var_1857;
      }
   }
}

package com.sulake.habbo.catalog.club
{
   import com.sulake.habbo.catalog.IPurchasableOffer;
   import com.sulake.habbo.catalog.purse.Purse;
   import com.sulake.habbo.catalog.viewer.ICatalogPage;
   import com.sulake.habbo.catalog.viewer.IProductContainer;
   import com.sulake.habbo.catalog.viewer.Offer;
   
   public class ClubBuyOfferData implements IPurchasableOffer
   {
       
      
      private var _offerId:int;
      
      private var var_1650:String;
      
      private var var_1651:int;
      
      private var var_2272:Boolean;
      
      private var var_2274:Boolean;
      
      private var var_2277:int;
      
      private var var_2273:int;
      
      private var var_427:ICatalogPage;
      
      private var var_2275:int;
      
      private var var_2278:int;
      
      private var var_2276:int;
      
      private var var_2279:Boolean = false;
      
      public function ClubBuyOfferData(param1:int, param2:String, param3:int, param4:Boolean, param5:Boolean, param6:int, param7:int, param8:int, param9:int, param10:int)
      {
         super();
         this._offerId = param1;
         this.var_1650 = param2;
         this.var_1651 = param3;
         this.var_2272 = param4;
         this.var_2274 = param5;
         this.var_2277 = param6;
         this.var_2273 = param7;
         this.var_2275 = param8;
         this.var_2278 = param9;
         this.var_2276 = param10;
      }
      
      public function dispose() : void
      {
      }
      
      public function get offerId() : int
      {
         return this._offerId;
      }
      
      public function get productCode() : String
      {
         return this.var_1650;
      }
      
      public function get price() : int
      {
         return this.var_1651;
      }
      
      public function get upgrade() : Boolean
      {
         return this.var_2272;
      }
      
      public function get vip() : Boolean
      {
         return this.var_2274;
      }
      
      public function get periods() : int
      {
         return this.var_2277;
      }
      
      public function get daysLeftAfterPurchase() : int
      {
         return this.var_2273;
      }
      
      public function get year() : int
      {
         return this.var_2275;
      }
      
      public function get month() : int
      {
         return this.var_2278;
      }
      
      public function get day() : int
      {
         return this.var_2276;
      }
      
      public function get priceInActivityPoints() : int
      {
         return 0;
      }
      
      public function get activityPointType() : int
      {
         return Purse.const_174;
      }
      
      public function get priceInCredits() : int
      {
         return this.var_1651;
      }
      
      public function get page() : ICatalogPage
      {
         return this.var_427;
      }
      
      public function get priceType() : String
      {
         return Offer.const_633;
      }
      
      public function get productContainer() : IProductContainer
      {
         return null;
      }
      
      public function get localizationId() : String
      {
         return this.var_1650;
      }
      
      public function set page(param1:ICatalogPage) : void
      {
         this.var_427 = param1;
      }
      
      public function get upgradeHcPeriodToVip() : Boolean
      {
         return this.var_2279;
      }
      
      public function set upgradeHcPeriodToVip(param1:Boolean) : void
      {
         this.var_2279 = param1;
      }
   }
}

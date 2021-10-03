package com.sulake.habbo.catalog.viewer
{
   import com.sulake.habbo.catalog.IPurchasableOffer;
   import com.sulake.habbo.communication.messages.incoming.catalog.CatalogPageMessageOfferData;
   import com.sulake.habbo.communication.messages.incoming.catalog.CatalogPageMessageProductData;
   import com.sulake.habbo.session.furniture.IFurnitureData;
   import com.sulake.habbo.session.product.IProductData;
   
   public class Offer implements IPurchasableOffer
   {
      
      public static const const_1484:String = "pricing_model_unknown";
      
      public static const const_501:String = "pricing_model_single";
      
      public static const const_563:String = "pricing_model_multi";
      
      public static const const_488:String = "pricing_model_bundle";
      
      public static const const_1464:String = "price_type_none";
      
      public static const const_633:String = "price_type_credits";
      
      public static const const_1070:String = "price_type_activitypoints";
      
      public static const const_1089:String = "price_type_credits_and_activitypoints";
       
      
      private var var_680:String;
      
      private var var_1053:String;
      
      private var _offerId:int;
      
      private var var_1566:String;
      
      private var var_1051:int;
      
      private var var_1052:int;
      
      private var var_1531:int;
      
      private var var_427:ICatalogPage;
      
      private var var_681:IProductContainer;
      
      private var var_2127:int;
      
      public function Offer(param1:CatalogPageMessageOfferData, param2:ICatalogPage)
      {
         var _loc4_:* = null;
         var _loc5_:* = null;
         var _loc6_:* = null;
         var _loc7_:* = null;
         super();
         this._offerId = param1.offerId;
         this.var_1566 = param1.localizationId;
         this.var_1051 = param1.priceInCredits;
         this.var_1052 = param1.priceInActivityPoints;
         this.var_1531 = param1.activityPointType;
         this.var_427 = param2;
         var _loc3_:Array = new Array();
         for each(_loc4_ in param1.products)
         {
            _loc5_ = param2.viewer.catalog.getProductData(param1.localizationId);
            _loc6_ = param2.viewer.catalog.getFurnitureData(_loc4_.furniClassId,_loc4_.productType);
            _loc7_ = new Product(_loc4_,_loc5_,_loc6_);
            _loc3_.push(_loc7_);
         }
         this.analyzePricingModel(_loc3_);
         this.analyzePriceType();
         this.createProductContainer(_loc3_);
      }
      
      public function get page() : ICatalogPage
      {
         return this.var_427;
      }
      
      public function get offerId() : int
      {
         return this._offerId;
      }
      
      public function get localizationId() : String
      {
         return this.var_1566;
      }
      
      public function get priceInCredits() : int
      {
         return this.var_1051;
      }
      
      public function get priceInActivityPoints() : int
      {
         return this.var_1052;
      }
      
      public function get activityPointType() : int
      {
         return this.var_1531;
      }
      
      public function get productContainer() : IProductContainer
      {
         return this.var_681;
      }
      
      public function get pricingModel() : String
      {
         return this.var_680;
      }
      
      public function get priceType() : String
      {
         return this.var_1053;
      }
      
      public function get previewCallbackId() : int
      {
         return this.var_2127;
      }
      
      public function set previewCallbackId(param1:int) : void
      {
         this.var_2127 = param1;
      }
      
      public function dispose() : void
      {
         this._offerId = 0;
         this.var_1566 = "";
         this.var_1051 = 0;
         this.var_1052 = 0;
         this.var_1531 = 0;
         this.var_427 = null;
         if(this.var_681 != null)
         {
            this.var_681.dispose();
            this.var_681 = null;
         }
      }
      
      private function createProductContainer(param1:Array) : void
      {
         switch(this.var_680)
         {
            case const_501:
               this.var_681 = new SingleProductContainer(this,param1);
               break;
            case const_563:
               this.var_681 = new MultiProductContainer(this,param1);
               break;
            case const_488:
               this.var_681 = new BundleProductContainer(this,param1);
               break;
            default:
               Logger.log("[Offer] Unknown pricing model" + this.var_680);
         }
      }
      
      private function analyzePricingModel(param1:Array) : void
      {
         var _loc2_:* = null;
         if(param1.length == 1)
         {
            _loc2_ = param1[0];
            if(_loc2_.productCount == 1)
            {
               this.var_680 = const_501;
            }
            else
            {
               this.var_680 = const_563;
            }
         }
         else if(param1.length > 1)
         {
            this.var_680 = const_488;
         }
         else
         {
            this.var_680 = const_1484;
         }
      }
      
      private function analyzePriceType() : void
      {
         if(this.var_1051 > 0 && this.var_1052 > 0)
         {
            this.var_1053 = const_1089;
         }
         else if(this.var_1051 > 0)
         {
            this.var_1053 = const_633;
         }
         else if(this.var_1052 > 0)
         {
            this.var_1053 = const_1070;
         }
         else
         {
            this.var_1053 = const_1464;
         }
      }
   }
}

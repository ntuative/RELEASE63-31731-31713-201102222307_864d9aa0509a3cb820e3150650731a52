package com.sulake.habbo.widget.events
{
   public class RoomWidgetTeaserDataUpdateEvent extends RoomWidgetUpdateEvent
   {
      
      public static const const_458:String = "RWTDUE_TEASER_DATA";
      
      public static const const_848:String = "RWTDUE_GIFT_DATA";
      
      public static const const_756:String = "RWTDUE_GIFT_RECEIVED";
       
      
      private var var_348:int;
      
      private var _data:String;
      
      private var var_378:int;
      
      private var var_178:String;
      
      private var var_2014:String;
      
      private var var_2015:Boolean;
      
      private var var_1447:int = 0;
      
      private var var_2016:String;
      
      public function RoomWidgetTeaserDataUpdateEvent(param1:String, param2:Boolean = false, param3:Boolean = false)
      {
         super(param1,param2,param3);
      }
      
      public function get objectId() : int
      {
         return this.var_348;
      }
      
      public function get data() : String
      {
         return this._data;
      }
      
      public function get status() : int
      {
         return this.var_378;
      }
      
      public function get firstClickUserName() : String
      {
         return this.var_2014;
      }
      
      public function get giftWasReceived() : Boolean
      {
         return this.var_2015;
      }
      
      public function get ownRealName() : String
      {
         return this.var_2016;
      }
      
      public function get itemCategory() : int
      {
         return this.var_1447;
      }
      
      public function set status(param1:int) : void
      {
         this.var_378 = param1;
      }
      
      public function set data(param1:String) : void
      {
         this._data = param1;
      }
      
      public function set firstClickUserName(param1:String) : void
      {
         this.var_2014 = param1;
      }
      
      public function set giftWasReceived(param1:Boolean) : void
      {
         this.var_2015 = param1;
      }
      
      public function set ownRealName(param1:String) : void
      {
         this.var_2016 = param1;
      }
      
      public function set objectId(param1:int) : void
      {
         this.var_348 = param1;
      }
      
      public function get campaignID() : String
      {
         return this.var_178;
      }
      
      public function set campaignID(param1:String) : void
      {
         this.var_178 = param1;
      }
      
      public function set itemCategory(param1:int) : void
      {
         this.var_1447 = param1;
      }
   }
}

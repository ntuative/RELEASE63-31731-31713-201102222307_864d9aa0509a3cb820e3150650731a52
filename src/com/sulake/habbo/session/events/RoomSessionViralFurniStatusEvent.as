package com.sulake.habbo.session.events
{
   import com.sulake.habbo.session.IRoomSession;
   
   public class RoomSessionViralFurniStatusEvent extends RoomSessionEvent
   {
      
      public static const const_450:String = "RSVFS_STATUS";
      
      public static const const_461:String = "RSVFS_RECEIVED";
       
      
      private var var_178:String;
      
      private var var_348:int;
      
      private var var_378:int = -1;
      
      private var _shareId:String;
      
      private var var_2014:String;
      
      private var var_2015:Boolean;
      
      private var var_1447:int = 0;
      
      public function RoomSessionViralFurniStatusEvent(param1:String, param2:IRoomSession, param3:Boolean = false, param4:Boolean = false)
      {
         super(param1,param2,param3,param4);
         this.var_378 = this.status;
         this._shareId = this.shareId;
      }
      
      public function get objectId() : int
      {
         return this.var_348;
      }
      
      public function get status() : int
      {
         return this.var_378;
      }
      
      public function get shareId() : String
      {
         return this._shareId;
      }
      
      public function get firstClickUserName() : String
      {
         return this.var_2014;
      }
      
      public function get giftWasReceived() : Boolean
      {
         return this.var_2015;
      }
      
      public function get itemCategory() : int
      {
         return this.var_1447;
      }
      
      public function set objectId(param1:int) : void
      {
         this.var_348 = param1;
      }
      
      public function set status(param1:int) : void
      {
         this.var_378 = param1;
      }
      
      public function set shareId(param1:String) : void
      {
         this._shareId = param1;
      }
      
      public function set firstClickUserName(param1:String) : void
      {
         this.var_2014 = param1;
      }
      
      public function set giftWasReceived(param1:Boolean) : void
      {
         this.var_2015 = param1;
      }
      
      public function set itemCategory(param1:int) : void
      {
         this.var_1447 = param1;
      }
      
      public function get campaignID() : String
      {
         return this.var_178;
      }
      
      public function set campaignID(param1:String) : void
      {
         this.var_178 = param1;
      }
   }
}

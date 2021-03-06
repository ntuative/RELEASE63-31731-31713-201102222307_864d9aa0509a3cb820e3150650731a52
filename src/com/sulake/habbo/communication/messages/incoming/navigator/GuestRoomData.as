package com.sulake.habbo.communication.messages.incoming.navigator
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.runtime.IDisposable;
   
   public class GuestRoomData implements IDisposable
   {
       
      
      private var var_338:int;
      
      private var var_752:Boolean;
      
      private var var_825:String;
      
      private var _ownerName:String;
      
      private var var_2171:int;
      
      private var var_2346:int;
      
      private var var_2468:int;
      
      private var var_1490:String;
      
      private var var_2465:int;
      
      private var var_2467:Boolean;
      
      private var var_761:int;
      
      private var var_1311:int;
      
      private var var_2464:String;
      
      private var var_797:Array;
      
      private var var_2466:RoomThumbnailData;
      
      private var var_2173:Boolean;
      
      private var _disposed:Boolean;
      
      public function GuestRoomData(param1:IMessageDataWrapper)
      {
         var _loc4_:* = null;
         this.var_797 = new Array();
         super();
         this.var_338 = param1.readInteger();
         this.var_752 = param1.readBoolean();
         this.var_825 = param1.readString();
         this._ownerName = param1.readString();
         this.var_2171 = param1.readInteger();
         this.var_2346 = param1.readInteger();
         this.var_2468 = param1.readInteger();
         this.var_1490 = param1.readString();
         this.var_2465 = param1.readInteger();
         this.var_2467 = param1.readBoolean();
         this.var_761 = param1.readInteger();
         this.var_1311 = param1.readInteger();
         this.var_2464 = param1.readString();
         var _loc2_:int = param1.readInteger();
         var _loc3_:int = 0;
         while(_loc3_ < _loc2_)
         {
            _loc4_ = param1.readString();
            this.var_797.push(_loc4_);
            _loc3_++;
         }
         this.var_2466 = new RoomThumbnailData(param1);
         this.var_2173 = param1.readBoolean();
      }
      
      public function dispose() : void
      {
         if(this._disposed)
         {
            return;
         }
         this._disposed = true;
         this.var_797 = null;
      }
      
      public function get disposed() : Boolean
      {
         return this._disposed;
      }
      
      public function get flatId() : int
      {
         return this.var_338;
      }
      
      public function get event() : Boolean
      {
         return this.var_752;
      }
      
      public function get roomName() : String
      {
         return this.var_825;
      }
      
      public function get ownerName() : String
      {
         return this._ownerName;
      }
      
      public function get doorMode() : int
      {
         return this.var_2171;
      }
      
      public function get userCount() : int
      {
         return this.var_2346;
      }
      
      public function get maxUserCount() : int
      {
         return this.var_2468;
      }
      
      public function get description() : String
      {
         return this.var_1490;
      }
      
      public function get srchSpecPrm() : int
      {
         return this.var_2465;
      }
      
      public function get allowTrading() : Boolean
      {
         return this.var_2467;
      }
      
      public function get score() : int
      {
         return this.var_761;
      }
      
      public function get categoryId() : int
      {
         return this.var_1311;
      }
      
      public function get eventCreationTime() : String
      {
         return this.var_2464;
      }
      
      public function get tags() : Array
      {
         return this.var_797;
      }
      
      public function get thumbnail() : RoomThumbnailData
      {
         return this.var_2466;
      }
      
      public function get allowPets() : Boolean
      {
         return this.var_2173;
      }
   }
}

package com.sulake.habbo.navigator.domain
{
   import com.sulake.habbo.communication.messages.incoming.navigator.FlatCategory;
   import com.sulake.habbo.communication.messages.incoming.navigator.GuestRoomData;
   import com.sulake.habbo.communication.messages.incoming.navigator.GuestRoomSearchResultData;
   import com.sulake.habbo.communication.messages.incoming.navigator.MsgWithRequestId;
   import com.sulake.habbo.communication.messages.incoming.navigator.OfficialRoomsData;
   import com.sulake.habbo.communication.messages.incoming.navigator.PopularRoomTagsData;
   import com.sulake.habbo.communication.messages.incoming.navigator.PublicRoomShortData;
   import com.sulake.habbo.communication.messages.incoming.navigator.RoomEventData;
   import com.sulake.habbo.communication.messages.parser.navigator.FavouritesMessageParser;
   import com.sulake.habbo.communication.messages.parser.room.engine.RoomEntryInfoMessageParser;
   import com.sulake.habbo.navigator.HabboNavigator;
   import flash.utils.Dictionary;
   
   public class NavigatorData
   {
      
      private static const const_1662:int = 10;
       
      
      private var _navigator:HabboNavigator;
      
      private var var_189:MsgWithRequestId;
      
      private var var_549:RoomEventData;
      
      private var var_2070:Boolean;
      
      private var var_2078:Boolean;
      
      private var _currentRoomOwner:Boolean;
      
      private var var_2080:int;
      
      private var var_234:GuestRoomData;
      
      private var var_826:PublicRoomShortData;
      
      private var var_2073:int;
      
      private var var_2071:Boolean;
      
      private var var_2079:int;
      
      private var var_2069:Boolean;
      
      private var var_1540:int;
      
      private var var_2074:Boolean;
      
      private var var_1270:Array;
      
      private var var_1268:Array;
      
      private var var_2072:int;
      
      private var var_1269:int;
      
      private var _favouriteIds:Dictionary;
      
      private var var_1027:Boolean;
      
      private var var_2076:int;
      
      private var var_2075:Boolean;
      
      private var var_2077:int = 0;
      
      public function NavigatorData(param1:HabboNavigator)
      {
         this.var_1270 = new Array();
         this.var_1268 = new Array();
         this._favouriteIds = new Dictionary();
         super();
         this._navigator = param1;
      }
      
      public function get canAddFavourite() : Boolean
      {
         return this.var_234 != null && !this._currentRoomOwner;
      }
      
      public function get canEditRoomSettings() : Boolean
      {
         return this.var_234 != null && this._currentRoomOwner;
      }
      
      public function onRoomEnter(param1:RoomEntryInfoMessageParser) : void
      {
         this.var_826 = null;
         this.var_234 = null;
         this._currentRoomOwner = false;
         if(param1.guestRoom)
         {
            this._currentRoomOwner = param1.owner;
         }
         else
         {
            this.var_826 = param1.publicSpace;
            this.var_549 = null;
         }
      }
      
      public function onRoomExit() : void
      {
         if(this.var_549 != null)
         {
            this.var_549.dispose();
            this.var_549 = null;
         }
         if(this.var_826 != null)
         {
            this.var_826.dispose();
            this.var_826 = null;
         }
         if(this.var_234 != null)
         {
            this.var_234.dispose();
            this.var_234 = null;
         }
         this._currentRoomOwner = false;
      }
      
      public function set enteredRoom(param1:GuestRoomData) : void
      {
         if(this.var_234 != null)
         {
            this.var_234.dispose();
         }
         this.var_234 = param1;
      }
      
      public function set roomEventData(param1:RoomEventData) : void
      {
         if(this.var_549 != null)
         {
            this.var_549.dispose();
         }
         this.var_549 = param1;
      }
      
      public function get popularTagsArrived() : Boolean
      {
         return this.var_189 != null && this.var_189 as PopularRoomTagsData != null;
      }
      
      public function get guestRoomSearchArrived() : Boolean
      {
         return this.var_189 != null && this.var_189 as GuestRoomSearchResultData != null;
      }
      
      public function get officialRoomsArrived() : Boolean
      {
         return this.var_189 != null && this.var_189 as OfficialRoomsData != null;
      }
      
      public function set guestRoomSearchResults(param1:GuestRoomSearchResultData) : void
      {
         this.disposeCurrentMsg();
         this.var_189 = param1;
         this.var_1027 = false;
      }
      
      public function set popularTags(param1:PopularRoomTagsData) : void
      {
         this.disposeCurrentMsg();
         this.var_189 = param1;
         this.var_1027 = false;
      }
      
      public function set officialRooms(param1:OfficialRoomsData) : void
      {
         this.disposeCurrentMsg();
         this.var_189 = param1;
         this.var_1027 = false;
      }
      
      private function disposeCurrentMsg() : void
      {
         if(this.var_189 == null)
         {
            return;
         }
         this.var_189.dispose();
         this.var_189 = null;
      }
      
      public function get guestRoomSearchResults() : GuestRoomSearchResultData
      {
         return this.var_189 as GuestRoomSearchResultData;
      }
      
      public function get popularTags() : PopularRoomTagsData
      {
         return this.var_189 as PopularRoomTagsData;
      }
      
      public function get officialRooms() : OfficialRoomsData
      {
         return this.var_189 as OfficialRoomsData;
      }
      
      public function get roomEventData() : RoomEventData
      {
         return this.var_549;
      }
      
      public function get avatarId() : int
      {
         return this.var_2080;
      }
      
      public function get eventMod() : Boolean
      {
         return this.var_2070;
      }
      
      public function get roomPicker() : Boolean
      {
         return this.var_2078;
      }
      
      public function get currentRoomOwner() : Boolean
      {
         return this._currentRoomOwner;
      }
      
      public function get enteredGuestRoom() : GuestRoomData
      {
         return this.var_234;
      }
      
      public function get enteredPublicSpace() : PublicRoomShortData
      {
         return this.var_826;
      }
      
      public function get hcMember() : Boolean
      {
         return this.var_2071;
      }
      
      public function get createdFlatId() : int
      {
         return this.var_2079;
      }
      
      public function get homeRoomId() : int
      {
         return this.var_1540;
      }
      
      public function get hotRoomPopupOpen() : Boolean
      {
         return this.var_2069;
      }
      
      public function get currentRoomRating() : int
      {
         return this.var_2076;
      }
      
      public function get publicSpaceNodeId() : int
      {
         return this.var_2073;
      }
      
      public function get settingsReceived() : Boolean
      {
         return this.var_2074;
      }
      
      public function get adIndex() : int
      {
         return this.var_2077;
      }
      
      public function get currentRoomIsStaffPick() : Boolean
      {
         return this.var_2075;
      }
      
      public function set avatarId(param1:int) : void
      {
         this.var_2080 = param1;
      }
      
      public function set createdFlatId(param1:int) : void
      {
         this.var_2079 = param1;
      }
      
      public function set hcMember(param1:Boolean) : void
      {
         this.var_2071 = param1;
      }
      
      public function set eventMod(param1:Boolean) : void
      {
         this.var_2070 = param1;
      }
      
      public function set roomPicker(param1:Boolean) : void
      {
         this.var_2078 = param1;
      }
      
      public function set hotRoomPopupOpen(param1:Boolean) : void
      {
         this.var_2069 = param1;
      }
      
      public function set homeRoomId(param1:int) : void
      {
         this.var_1540 = param1;
      }
      
      public function set currentRoomRating(param1:int) : void
      {
         this.var_2076 = param1;
      }
      
      public function set publicSpaceNodeId(param1:int) : void
      {
         this.var_2073 = param1;
      }
      
      public function set settingsReceived(param1:Boolean) : void
      {
         this.var_2074 = param1;
      }
      
      public function set adIndex(param1:int) : void
      {
         this.var_2077 = param1;
      }
      
      public function set currentRoomIsStaffPick(param1:Boolean) : void
      {
         this.var_2075 = param1;
      }
      
      public function set categories(param1:Array) : void
      {
         var _loc2_:* = null;
         this.var_1270 = param1;
         this.var_1268 = new Array();
         for each(_loc2_ in this.var_1270)
         {
            if(_loc2_.visible)
            {
               this.var_1268.push(_loc2_);
            }
         }
      }
      
      public function get allCategories() : Array
      {
         return this.var_1270;
      }
      
      public function get visibleCategories() : Array
      {
         return this.var_1268;
      }
      
      public function onFavourites(param1:FavouritesMessageParser) : void
      {
         var _loc2_:int = 0;
         this.var_2072 = param1.limit;
         this.var_1269 = param1.favouriteRoomIds.length;
         this._favouriteIds = new Dictionary();
         for each(_loc2_ in param1.favouriteRoomIds)
         {
            this._favouriteIds[_loc2_] = "yes";
         }
      }
      
      public function favouriteChanged(param1:int, param2:Boolean) : void
      {
         this._favouriteIds[param1] = !!param2 ? "yes" : null;
         this.var_1269 += !!param2 ? 1 : -1;
      }
      
      public function isCurrentRoomFavourite() : Boolean
      {
         var _loc1_:int = this.var_234.flatId;
         return this._favouriteIds[_loc1_] != null;
      }
      
      public function isCurrentRoomHome() : Boolean
      {
         if(this.var_234 == null)
         {
            return false;
         }
         var _loc1_:int = this.var_234.flatId;
         return this.var_1540 == _loc1_;
      }
      
      public function isRoomFavourite(param1:int) : Boolean
      {
         return this._favouriteIds[param1] != null;
      }
      
      public function isFavouritesFull() : Boolean
      {
         return this.var_1269 >= this.var_2072;
      }
      
      public function startLoading() : void
      {
         this.var_1027 = true;
      }
      
      public function isLoading() : Boolean
      {
         return this.var_1027;
      }
   }
}

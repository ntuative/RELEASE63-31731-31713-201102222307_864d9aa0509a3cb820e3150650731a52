package com.sulake.habbo.communication.messages.incoming.quest
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   
   public class QuestMessageData
   {
       
      
      private var _id:int;
      
      private var var_378:int;
      
      private var _type:String;
      
      private var var_1644:String;
      
      private var var_1642:int;
      
      private var var_1643:String;
      
      private var var_712:String;
      
      private var var_1641:String;
      
      private var _questBadgeAchievementTypeId:String;
      
      private var var_2270:uint;
      
      public function QuestMessageData(param1:IMessageDataWrapper)
      {
         super();
         this._id = param1.readInteger();
         this.var_378 = param1.readInteger();
         this._type = param1.readString();
         this.var_1644 = param1.readString();
         this.var_1642 = param1.readInteger();
         this.var_1643 = param1.readString();
         this.var_712 = param1.readString();
         this._questBadgeAchievementTypeId = param1.readString();
         var _loc2_:String = "";
         var _loc3_:int = this.var_712.length - 1;
         while(_loc3_ > 0 && this.isNumber(this.var_712.charAt(_loc3_)))
         {
            _loc2_ = this.var_712.charAt(_loc3_) + _loc2_;
            _loc3_--;
         }
         if(_loc3_ > 0)
         {
            this.var_1641 = this.var_712.substring(0,_loc3_ + 1);
         }
         else
         {
            this.var_1641 = this.var_712;
         }
         this.var_2270 = uint(_loc2_);
      }
      
      private function getNumber(param1:String) : int
      {
         var _loc2_:int = param1.charCodeAt(0);
         return _loc2_ - 48;
      }
      
      private function isNumber(param1:String) : Boolean
      {
         var _loc2_:int = param1.charCodeAt(0);
         return _loc2_ >= 48 && _loc2_ <= 57;
      }
      
      public function dispose() : void
      {
         this._id = 0;
         this.var_378 = 0;
         this._type = "";
         this.var_1644 = "";
         this.var_1642 = 0;
         this.var_1643 = "";
      }
      
      public function get id() : int
      {
         return this._id;
      }
      
      public function get status() : int
      {
         return this.var_378;
      }
      
      public function get type() : String
      {
         return this._type;
      }
      
      public function get roomItemTypeName() : String
      {
         return this.var_1644;
      }
      
      public function get rewardCurrencyAmount() : int
      {
         return this.var_1642;
      }
      
      public function get endDateTimeStamp() : String
      {
         return this.var_1643;
      }
      
      public function get localizationCode() : String
      {
         return this.var_712;
      }
      
      public function get sortCode() : uint
      {
         return this.var_2270;
      }
      
      public function get localizationPrefix() : String
      {
         return this.var_1641;
      }
      
      public function get questBadgeAchievementTypeId() : String
      {
         return this._questBadgeAchievementTypeId;
      }
   }
}

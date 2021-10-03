package com.sulake.habbo.communication.messages.incoming.room.engine
{
   public class UserMessageData
   {
      
      public static const const_1110:String = "M";
      
      public static const const_1623:String = "F";
       
      
      private var _id:int = 0;
      
      private var _x:Number = 0;
      
      private var var_151:Number = 0;
      
      private var var_150:Number = 0;
      
      private var var_265:int = 0;
      
      private var _name:String = "";
      
      private var _userType:int = 0;
      
      private var var_912:String = "";
      
      private var var_540:String = "";
      
      private var var_2007:String = "";
      
      private var var_2005:int;
      
      private var var_2006:int = 0;
      
      private var var_2008:String = "";
      
      private var var_2009:int = 0;
      
      private var var_2004:int = 0;
      
      private var var_2674:String = "";
      
      private var var_179:Boolean = false;
      
      public function UserMessageData(param1:int)
      {
         super();
         this._id = param1;
      }
      
      public function setReadOnly() : void
      {
         this.var_179 = true;
      }
      
      public function get id() : int
      {
         return this._id;
      }
      
      public function get x() : Number
      {
         return this._x;
      }
      
      public function set x(param1:Number) : void
      {
         if(!this.var_179)
         {
            this._x = param1;
         }
      }
      
      public function get y() : Number
      {
         return this.var_151;
      }
      
      public function set y(param1:Number) : void
      {
         if(!this.var_179)
         {
            this.var_151 = param1;
         }
      }
      
      public function get z() : Number
      {
         return this.var_150;
      }
      
      public function set z(param1:Number) : void
      {
         if(!this.var_179)
         {
            this.var_150 = param1;
         }
      }
      
      public function get dir() : int
      {
         return this.var_265;
      }
      
      public function set dir(param1:int) : void
      {
         if(!this.var_179)
         {
            this.var_265 = param1;
         }
      }
      
      public function get name() : String
      {
         return this._name;
      }
      
      public function set name(param1:String) : void
      {
         if(!this.var_179)
         {
            this._name = param1;
         }
      }
      
      public function get userType() : int
      {
         return this._userType;
      }
      
      public function set userType(param1:int) : void
      {
         if(!this.var_179)
         {
            this._userType = param1;
         }
      }
      
      public function get sex() : String
      {
         return this.var_912;
      }
      
      public function set sex(param1:String) : void
      {
         if(!this.var_179)
         {
            this.var_912 = param1;
         }
      }
      
      public function get figure() : String
      {
         return this.var_540;
      }
      
      public function set figure(param1:String) : void
      {
         if(!this.var_179)
         {
            this.var_540 = param1;
         }
      }
      
      public function get custom() : String
      {
         return this.var_2007;
      }
      
      public function set custom(param1:String) : void
      {
         if(!this.var_179)
         {
            this.var_2007 = param1;
         }
      }
      
      public function get achievementScore() : int
      {
         return this.var_2005;
      }
      
      public function set achievementScore(param1:int) : void
      {
         if(!this.var_179)
         {
            this.var_2005 = param1;
         }
      }
      
      public function get webID() : int
      {
         return this.var_2006;
      }
      
      public function set webID(param1:int) : void
      {
         if(!this.var_179)
         {
            this.var_2006 = param1;
         }
      }
      
      public function get groupID() : String
      {
         return this.var_2008;
      }
      
      public function set groupID(param1:String) : void
      {
         if(!this.var_179)
         {
            this.var_2008 = param1;
         }
      }
      
      public function get groupStatus() : int
      {
         return this.var_2009;
      }
      
      public function set groupStatus(param1:int) : void
      {
         if(!this.var_179)
         {
            this.var_2009 = param1;
         }
      }
      
      public function get xp() : int
      {
         return this.var_2004;
      }
      
      public function set xp(param1:int) : void
      {
         if(!this.var_179)
         {
            this.var_2004 = param1;
         }
      }
      
      public function get subType() : String
      {
         return this.var_2674;
      }
      
      public function set subType(param1:String) : void
      {
         if(!this.var_179)
         {
            this.var_2674 = param1;
         }
      }
   }
}

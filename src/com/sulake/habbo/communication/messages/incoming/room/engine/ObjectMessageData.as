package com.sulake.habbo.communication.messages.incoming.room.engine
{
   public class ObjectMessageData
   {
       
      
      private var _id:int = 0;
      
      private var _x:Number = 0;
      
      private var var_151:Number = 0;
      
      private var var_150:Number = 0;
      
      private var var_265:int = 0;
      
      private var var_522:int = 0;
      
      private var var_642:int = 0;
      
      private var _type:int = 0;
      
      private var var_2802:String = "";
      
      private var var_1243:int = -1;
      
      private var _state:int = 0;
      
      private var _data:String = "";
      
      private var var_2099:int = 0;
      
      private var var_2311:String = null;
      
      private var var_179:Boolean = false;
      
      public function ObjectMessageData(param1:int)
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
      
      public function get sizeX() : int
      {
         return this.var_522;
      }
      
      public function set sizeX(param1:int) : void
      {
         if(!this.var_179)
         {
            this.var_522 = param1;
         }
      }
      
      public function get sizeY() : int
      {
         return this.var_642;
      }
      
      public function set sizeY(param1:int) : void
      {
         if(!this.var_179)
         {
            this.var_642 = param1;
         }
      }
      
      public function get type() : int
      {
         return this._type;
      }
      
      public function set type(param1:int) : void
      {
         if(!this.var_179)
         {
            this._type = param1;
         }
      }
      
      public function get state() : int
      {
         return this._state;
      }
      
      public function set state(param1:int) : void
      {
         if(!this.var_179)
         {
            this._state = param1;
         }
      }
      
      public function get data() : String
      {
         return this._data;
      }
      
      public function set data(param1:String) : void
      {
         if(!this.var_179)
         {
            this._data = param1;
         }
      }
      
      public function get staticClass() : String
      {
         return this.var_2311;
      }
      
      public function set staticClass(param1:String) : void
      {
         if(!this.var_179)
         {
            this.var_2311 = param1;
         }
      }
      
      public function get extra() : int
      {
         return this.var_1243;
      }
      
      public function set extra(param1:int) : void
      {
         if(!this.var_179)
         {
            this.var_1243 = param1;
         }
      }
      
      public function get expiryTime() : int
      {
         return this.var_2099;
      }
      
      public function set expiryTime(param1:int) : void
      {
         if(!this.var_179)
         {
            this.var_2099 = param1;
         }
      }
   }
}

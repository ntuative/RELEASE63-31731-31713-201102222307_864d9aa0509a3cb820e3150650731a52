package com.sulake.habbo.communication.messages.incoming.navigator
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.runtime.IDisposable;
   
   public class RoomEventData implements IDisposable
   {
       
      
      private var var_1063:Boolean;
      
      private var var_2405:int;
      
      private var var_2407:String;
      
      private var var_338:int;
      
      private var var_2404:int;
      
      private var var_2136:String;
      
      private var var_2408:String;
      
      private var var_2406:String;
      
      private var var_797:Array;
      
      private var _disposed:Boolean;
      
      public function RoomEventData(param1:IMessageDataWrapper)
      {
         var _loc5_:* = null;
         this.var_797 = new Array();
         super();
         var _loc2_:String = param1.readString();
         if(_loc2_ == "-1")
         {
            Logger.log("Got null room event");
            this.var_1063 = false;
            return;
         }
         this.var_1063 = true;
         this.var_2405 = int(_loc2_);
         this.var_2407 = param1.readString();
         this.var_338 = int(param1.readString());
         this.var_2404 = param1.readInteger();
         this.var_2136 = param1.readString();
         this.var_2408 = param1.readString();
         this.var_2406 = param1.readString();
         var _loc3_:int = param1.readInteger();
         var _loc4_:int = 0;
         while(_loc4_ < _loc3_)
         {
            _loc5_ = param1.readString();
            this.var_797.push(_loc5_);
            _loc4_++;
         }
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
      
      public function get ownerAvatarId() : int
      {
         return this.var_2405;
      }
      
      public function get ownerAvatarName() : String
      {
         return this.var_2407;
      }
      
      public function get flatId() : int
      {
         return this.var_338;
      }
      
      public function get eventType() : int
      {
         return this.var_2404;
      }
      
      public function get eventName() : String
      {
         return this.var_2136;
      }
      
      public function get eventDescription() : String
      {
         return this.var_2408;
      }
      
      public function get creationTime() : String
      {
         return this.var_2406;
      }
      
      public function get tags() : Array
      {
         return this.var_797;
      }
      
      public function get exists() : Boolean
      {
         return this.var_1063;
      }
   }
}

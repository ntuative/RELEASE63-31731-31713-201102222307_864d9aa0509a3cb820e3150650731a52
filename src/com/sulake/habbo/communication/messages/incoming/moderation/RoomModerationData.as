package com.sulake.habbo.communication.messages.incoming.moderation
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.runtime.IDisposable;
   
   public class RoomModerationData implements IDisposable
   {
       
      
      private var var_338:int;
      
      private var var_2346:int;
      
      private var var_2545:Boolean;
      
      private var var_2052:int;
      
      private var _ownerName:String;
      
      private var var_105:RoomData;
      
      private var var_752:RoomData;
      
      private var _disposed:Boolean;
      
      public function RoomModerationData(param1:IMessageDataWrapper)
      {
         super();
         this.var_338 = param1.readInteger();
         this.var_2346 = param1.readInteger();
         this.var_2545 = param1.readBoolean();
         this.var_2052 = param1.readInteger();
         this._ownerName = param1.readString();
         this.var_105 = new RoomData(param1);
         this.var_752 = new RoomData(param1);
      }
      
      public function get disposed() : Boolean
      {
         return this._disposed;
      }
      
      public function dispose() : void
      {
         if(this._disposed)
         {
            return;
         }
         this._disposed = true;
         if(this.var_105 != null)
         {
            this.var_105.dispose();
            this.var_105 = null;
         }
         if(this.var_752 != null)
         {
            this.var_752.dispose();
            this.var_752 = null;
         }
      }
      
      public function get flatId() : int
      {
         return this.var_338;
      }
      
      public function get userCount() : int
      {
         return this.var_2346;
      }
      
      public function get ownerInRoom() : Boolean
      {
         return this.var_2545;
      }
      
      public function get ownerId() : int
      {
         return this.var_2052;
      }
      
      public function get ownerName() : String
      {
         return this._ownerName;
      }
      
      public function get room() : RoomData
      {
         return this.var_105;
      }
      
      public function get event() : RoomData
      {
         return this.var_752;
      }
   }
}

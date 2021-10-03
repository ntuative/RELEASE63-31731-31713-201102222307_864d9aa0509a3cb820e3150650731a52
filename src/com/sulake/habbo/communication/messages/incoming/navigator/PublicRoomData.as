package com.sulake.habbo.communication.messages.incoming.navigator
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.runtime.IDisposable;
   
   public class PublicRoomData implements IDisposable
   {
       
      
      private var var_2540:String;
      
      private var var_2184:int;
      
      private var var_2183:int;
      
      private var var_2487:String;
      
      private var var_2539:int;
      
      private var var_1792:int;
      
      private var _disposed:Boolean;
      
      public function PublicRoomData(param1:IMessageDataWrapper)
      {
         super();
         this.var_2540 = param1.readString();
         this.var_2184 = param1.readInteger();
         this.var_2183 = param1.readInteger();
         this.var_2487 = param1.readString();
         this.var_2539 = param1.readInteger();
         this.var_1792 = param1.readInteger();
      }
      
      public function dispose() : void
      {
         if(this._disposed)
         {
            return;
         }
         this._disposed = true;
      }
      
      public function get disposed() : Boolean
      {
         return this._disposed;
      }
      
      public function get unitPropertySet() : String
      {
         return this.var_2540;
      }
      
      public function get unitPort() : int
      {
         return this.var_2184;
      }
      
      public function get worldId() : int
      {
         return this.var_2183;
      }
      
      public function get castLibs() : String
      {
         return this.var_2487;
      }
      
      public function get maxUsers() : int
      {
         return this.var_2539;
      }
      
      public function get nodeId() : int
      {
         return this.var_1792;
      }
   }
}

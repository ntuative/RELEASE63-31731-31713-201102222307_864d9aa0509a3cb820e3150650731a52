package com.sulake.habbo.communication.messages.incoming.navigator
{
   public class RoomThumbnailObjectData
   {
       
      
      private var var_1315:int;
      
      private var var_1314:int;
      
      public function RoomThumbnailObjectData()
      {
         super();
      }
      
      public function getCopy() : RoomThumbnailObjectData
      {
         var _loc1_:RoomThumbnailObjectData = new RoomThumbnailObjectData();
         _loc1_.var_1315 = this.var_1315;
         _loc1_.var_1314 = this.var_1314;
         return _loc1_;
      }
      
      public function set pos(param1:int) : void
      {
         this.var_1315 = param1;
      }
      
      public function set imgId(param1:int) : void
      {
         this.var_1314 = param1;
      }
      
      public function get pos() : int
      {
         return this.var_1315;
      }
      
      public function get imgId() : int
      {
         return this.var_1314;
      }
   }
}

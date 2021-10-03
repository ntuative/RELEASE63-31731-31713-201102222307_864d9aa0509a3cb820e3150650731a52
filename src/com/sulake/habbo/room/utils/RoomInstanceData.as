package com.sulake.habbo.room.utils
{
   public class RoomInstanceData
   {
       
      
      private var _roomId:int = 0;
      
      private var _roomCategory:int = 0;
      
      private var var_670:TileHeightMap = null;
      
      private var var_1033:LegacyWallGeometry = null;
      
      private var var_1032:RoomCamera = null;
      
      private var var_672:SelectedRoomObjectData = null;
      
      private var var_671:SelectedRoomObjectData = null;
      
      private var var_2105:String = null;
      
      public function RoomInstanceData(param1:int, param2:int)
      {
         super();
         this._roomId = param1;
         this._roomCategory = param2;
         this.var_1033 = new LegacyWallGeometry();
         this.var_1032 = new RoomCamera();
      }
      
      public function get roomId() : int
      {
         return this._roomId;
      }
      
      public function get roomCategory() : int
      {
         return this._roomCategory;
      }
      
      public function get tileHeightMap() : TileHeightMap
      {
         return this.var_670;
      }
      
      public function set tileHeightMap(param1:TileHeightMap) : void
      {
         if(this.var_670 != null)
         {
            this.var_670.dispose();
         }
         this.var_670 = param1;
      }
      
      public function get legacyGeometry() : LegacyWallGeometry
      {
         return this.var_1033;
      }
      
      public function get roomCamera() : RoomCamera
      {
         return this.var_1032;
      }
      
      public function get worldType() : String
      {
         return this.var_2105;
      }
      
      public function set worldType(param1:String) : void
      {
         this.var_2105 = param1;
      }
      
      public function get selectedObject() : SelectedRoomObjectData
      {
         return this.var_672;
      }
      
      public function set selectedObject(param1:SelectedRoomObjectData) : void
      {
         if(this.var_672 != null)
         {
            this.var_672.dispose();
         }
         this.var_672 = param1;
      }
      
      public function get placedObject() : SelectedRoomObjectData
      {
         return this.var_671;
      }
      
      public function set placedObject(param1:SelectedRoomObjectData) : void
      {
         if(this.var_671 != null)
         {
            this.var_671.dispose();
         }
         this.var_671 = param1;
      }
      
      public function dispose() : void
      {
         if(this.var_670 != null)
         {
            this.var_670.dispose();
            this.var_670 = null;
         }
         if(this.var_1033 != null)
         {
            this.var_1033.dispose();
            this.var_1033 = null;
         }
         if(this.var_1032 != null)
         {
            this.var_1032.dispose();
            this.var_1032 = null;
         }
         if(this.var_672 != null)
         {
            this.var_672.dispose();
            this.var_672 = null;
         }
         if(this.var_671 != null)
         {
            this.var_671.dispose();
            this.var_671 = null;
         }
      }
   }
}

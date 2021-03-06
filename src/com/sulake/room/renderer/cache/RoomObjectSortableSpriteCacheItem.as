package com.sulake.room.renderer.cache
{
   import com.sulake.room.renderer.utils.SortableSprite;
   
   public class RoomObjectSortableSpriteCacheItem
   {
       
      
      private var var_202:Array;
      
      private var var_2439:int = -1;
      
      private var var_2438:int = -1;
      
      private var var_1748:Boolean = false;
      
      public function RoomObjectSortableSpriteCacheItem()
      {
         this.var_202 = [];
         super();
      }
      
      public function get spriteCount() : int
      {
         return this.var_202.length;
      }
      
      public function get isEmpty() : Boolean
      {
         return this.var_1748;
      }
      
      public function dispose() : void
      {
         this.setSpriteCount(0);
      }
      
      public function addSprite(param1:SortableSprite) : void
      {
         this.var_202.push(param1);
      }
      
      public function getSprite(param1:int) : SortableSprite
      {
         return this.var_202[param1];
      }
      
      public function needsUpdate(param1:int, param2:int) : Boolean
      {
         if(param1 != this.var_2439 || param2 != this.var_2438)
         {
            this.var_2439 = param1;
            this.var_2438 = param2;
            return true;
         }
         return false;
      }
      
      public function setSpriteCount(param1:int) : void
      {
         var _loc2_:int = 0;
         var _loc3_:* = null;
         if(param1 < this.var_202.length)
         {
            _loc2_ = param1;
            while(_loc2_ < this.var_202.length)
            {
               _loc3_ = this.getSprite(_loc2_);
               if(_loc3_)
               {
                  _loc3_.dispose();
               }
               _loc2_++;
            }
            this.var_202.splice(param1,this.var_202.length - param1);
         }
         if(this.var_202.length == 0)
         {
            this.var_1748 = true;
         }
         else
         {
            this.var_1748 = false;
         }
      }
   }
}

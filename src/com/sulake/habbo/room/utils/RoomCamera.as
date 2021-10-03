package com.sulake.habbo.room.utils
{
   import com.sulake.room.utils.IVector3d;
   import com.sulake.room.utils.Vector3d;
   
   public class RoomCamera
   {
      
      private static const const_927:int = 3;
       
      
      private var var_2297:int = -1;
      
      private var var_2299:int = -2;
      
      private var var_339:Vector3d = null;
      
      private var var_402:Vector3d = null;
      
      private var var_2293:Boolean = false;
      
      private var var_2296:Boolean = false;
      
      private var var_2292:Boolean = false;
      
      private var var_2295:Boolean = false;
      
      private var var_2298:int = 0;
      
      private var var_2300:int = 0;
      
      private var var_2294:int = 0;
      
      private var var_2291:int = 0;
      
      private var var_1332:int = 0;
      
      public function RoomCamera()
      {
         super();
      }
      
      public function get location() : IVector3d
      {
         return this.var_402;
      }
      
      public function get targetId() : int
      {
         return this.var_2297;
      }
      
      public function get targetCategory() : int
      {
         return this.var_2299;
      }
      
      public function get limitedLocationX() : Boolean
      {
         return this.var_2293;
      }
      
      public function get limitedLocationY() : Boolean
      {
         return this.var_2296;
      }
      
      public function get centeredLocX() : Boolean
      {
         return this.var_2292;
      }
      
      public function get centeredLocY() : Boolean
      {
         return this.var_2295;
      }
      
      public function get screenWd() : int
      {
         return this.var_2298;
      }
      
      public function get screenHt() : int
      {
         return this.var_2300;
      }
      
      public function get roomWd() : int
      {
         return this.var_2294;
      }
      
      public function get roomHt() : int
      {
         return this.var_2291;
      }
      
      public function set targetId(param1:int) : void
      {
         this.var_2297 = param1;
      }
      
      public function set targetCategory(param1:int) : void
      {
         this.var_2299 = param1;
      }
      
      public function set limitedLocationX(param1:Boolean) : void
      {
         this.var_2293 = param1;
      }
      
      public function set limitedLocationY(param1:Boolean) : void
      {
         this.var_2296 = param1;
      }
      
      public function set centeredLocX(param1:Boolean) : void
      {
         this.var_2292 = param1;
      }
      
      public function set centeredLocY(param1:Boolean) : void
      {
         this.var_2295 = param1;
      }
      
      public function set screenWd(param1:int) : void
      {
         this.var_2298 = param1;
      }
      
      public function set screenHt(param1:int) : void
      {
         this.var_2300 = param1;
      }
      
      public function set roomWd(param1:int) : void
      {
         this.var_2294 = param1;
      }
      
      public function set roomHt(param1:int) : void
      {
         this.var_2291 = param1;
      }
      
      public function set target(param1:IVector3d) : void
      {
         if(this.var_339 == null)
         {
            this.var_339 = new Vector3d();
         }
         if(this.var_339.x != param1.x || this.var_339.y != param1.y || this.var_339.z != param1.z)
         {
            this.var_339.assign(param1);
            this.var_1332 = 0;
         }
      }
      
      public function dispose() : void
      {
         this.var_339 = null;
         this.var_402 = null;
      }
      
      public function initializeLocation(param1:IVector3d) : void
      {
         if(this.var_402 != null)
         {
            return;
         }
         this.var_402 = new Vector3d();
         this.var_402.assign(param1);
      }
      
      public function update(param1:uint, param2:Number, param3:Number) : void
      {
         var _loc4_:* = null;
         if(this.var_339 != null && this.var_402 != null)
         {
            ++this.var_1332;
            _loc4_ = Vector3d.dif(this.var_339,this.var_402);
            if(_loc4_.length <= param2)
            {
               this.var_402 = this.var_339;
               this.var_339 = null;
            }
            else
            {
               _loc4_.div(_loc4_.length);
               if(_loc4_.length < param2 * (const_927 + 1))
               {
                  _loc4_.mul(param2);
               }
               else if(this.var_1332 <= const_927)
               {
                  _loc4_.mul(param2);
               }
               else
               {
                  _loc4_.mul(param3);
               }
               this.var_402 = Vector3d.sum(this.var_402,_loc4_);
            }
         }
      }
   }
}

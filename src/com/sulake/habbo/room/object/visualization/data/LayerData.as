package com.sulake.habbo.room.object.visualization.data
{
   public class LayerData
   {
      
      public static const const_808:String = "";
      
      public static const const_561:int = 0;
      
      public static const const_560:int = 255;
      
      public static const const_797:Boolean = false;
      
      public static const const_527:int = 0;
      
      public static const const_465:int = 0;
      
      public static const const_481:int = 0;
      
      public static const const_1179:int = 1;
      
      public static const const_988:int = 2;
      
      public static const INK_DARKEN:int = 3;
       
      
      private var var_2032:String = "";
      
      private var var_1855:int = 0;
      
      private var var_2139:int = 255;
      
      private var var_2702:Boolean = false;
      
      private var var_2704:int = 0;
      
      private var var_2703:int = 0;
      
      private var var_2705:Number = 0;
      
      public function LayerData()
      {
         super();
      }
      
      public function set tag(param1:String) : void
      {
         this.var_2032 = param1;
      }
      
      public function get tag() : String
      {
         return this.var_2032;
      }
      
      public function set ink(param1:int) : void
      {
         this.var_1855 = param1;
      }
      
      public function get ink() : int
      {
         return this.var_1855;
      }
      
      public function set alpha(param1:int) : void
      {
         this.var_2139 = param1;
      }
      
      public function get alpha() : int
      {
         return this.var_2139;
      }
      
      public function set ignoreMouse(param1:Boolean) : void
      {
         this.var_2702 = param1;
      }
      
      public function get ignoreMouse() : Boolean
      {
         return this.var_2702;
      }
      
      public function set xOffset(param1:int) : void
      {
         this.var_2704 = param1;
      }
      
      public function get xOffset() : int
      {
         return this.var_2704;
      }
      
      public function set yOffset(param1:int) : void
      {
         this.var_2703 = param1;
      }
      
      public function get yOffset() : int
      {
         return this.var_2703;
      }
      
      public function set zOffset(param1:Number) : void
      {
         this.var_2705 = param1;
      }
      
      public function get zOffset() : Number
      {
         return this.var_2705;
      }
      
      public function copyValues(param1:LayerData) : void
      {
         if(param1 != null)
         {
            this.tag = param1.tag;
            this.ink = param1.ink;
            this.alpha = param1.alpha;
            this.ignoreMouse = param1.ignoreMouse;
            this.xOffset = param1.xOffset;
            this.yOffset = param1.yOffset;
            this.zOffset = param1.zOffset;
         }
      }
   }
}

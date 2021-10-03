package com.sulake.habbo.toolbar
{
   public class ToolbarIconBouncer
   {
       
      
      private var var_2035:Number;
      
      private var var_1769:Number;
      
      private var var_817:Number;
      
      private var var_818:Number = 0;
      
      public function ToolbarIconBouncer(param1:Number, param2:Number)
      {
         super();
         this.var_2035 = param1;
         this.var_1769 = param2;
      }
      
      public function reset(param1:int) : void
      {
         this.var_817 = param1;
         this.var_818 = 0;
      }
      
      public function update() : void
      {
         this.var_817 += this.var_1769;
         this.var_818 += this.var_817;
         if(this.var_818 > 0)
         {
            this.var_818 = 0;
            this.var_817 = this.var_2035 * -1 * this.var_817;
         }
      }
      
      public function get location() : Number
      {
         return this.var_818;
      }
   }
}

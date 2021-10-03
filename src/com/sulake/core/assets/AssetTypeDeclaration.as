package com.sulake.core.assets
{
   public class AssetTypeDeclaration
   {
       
      
      private var var_2640:String;
      
      private var var_2638:Class;
      
      private var var_2639:Class;
      
      private var var_1875:Array;
      
      public function AssetTypeDeclaration(param1:String, param2:Class, param3:Class, ... rest)
      {
         super();
         this.var_2640 = param1;
         this.var_2638 = param2;
         this.var_2639 = param3;
         if(rest == null)
         {
            this.var_1875 = new Array();
         }
         else
         {
            this.var_1875 = rest;
         }
      }
      
      public function get mimeType() : String
      {
         return this.var_2640;
      }
      
      public function get assetClass() : Class
      {
         return this.var_2638;
      }
      
      public function get loaderClass() : Class
      {
         return this.var_2639;
      }
      
      public function get fileTypes() : Array
      {
         return this.var_1875;
      }
   }
}

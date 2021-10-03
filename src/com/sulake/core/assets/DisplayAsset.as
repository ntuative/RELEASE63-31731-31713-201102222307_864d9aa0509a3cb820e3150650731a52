package com.sulake.core.assets
{
   import flash.display.DisplayObject;
   
   public class DisplayAsset implements IAsset
   {
       
      
      protected var var_993:String;
      
      protected var var_174:DisplayObject;
      
      protected var _disposed:Boolean = false;
      
      protected var var_799:AssetTypeDeclaration;
      
      public function DisplayAsset(param1:AssetTypeDeclaration, param2:String = null)
      {
         super();
         this.var_799 = param1;
         this.var_993 = param2;
      }
      
      public function get url() : String
      {
         return this.var_993;
      }
      
      public function get content() : Object
      {
         return this.var_174;
      }
      
      public function get disposed() : Boolean
      {
         return this._disposed;
      }
      
      public function get declaration() : AssetTypeDeclaration
      {
         return this.var_799;
      }
      
      public function dispose() : void
      {
         if(!this._disposed)
         {
            if(this.var_174.loaderInfo != null)
            {
               if(this.var_174.loaderInfo.loader != null)
               {
                  this.var_174.loaderInfo.loader.unload();
               }
            }
            this.var_174 = null;
            this.var_799 = null;
            this._disposed = true;
            this.var_993 = null;
         }
      }
      
      public function setUnknownContent(param1:Object) : void
      {
         if(param1 is DisplayObject)
         {
            this.var_174 = param1 as DisplayObject;
            if(this.var_174 != null)
            {
               return;
            }
            throw new Error("Failed to convert DisplayObject to DisplayAsset!");
         }
         if(param1 is DisplayAsset)
         {
            this.var_174 = DisplayAsset(param1).var_174;
            this.var_799 = DisplayAsset(param1).var_799;
            if(this.var_174 == null)
            {
               throw new Error("Failed to read content from DisplayAsset!");
            }
         }
      }
      
      public function setFromOtherAsset(param1:IAsset) : void
      {
         if(param1 is DisplayAsset)
         {
            this.var_174 = DisplayAsset(param1).var_174;
            this.var_799 = DisplayAsset(param1).var_799;
            return;
         }
         throw new Error("Provided asset should be of type DisplayAsset!");
      }
      
      public function setParamsDesc(param1:XMLList) : void
      {
      }
   }
}

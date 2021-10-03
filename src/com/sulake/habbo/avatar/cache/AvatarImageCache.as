package com.sulake.habbo.avatar.cache
{
   import com.sulake.core.assets.BitmapDataAsset;
   import com.sulake.core.utils.Map;
   import com.sulake.habbo.avatar.AvatarImageBodyPartContainer;
   import com.sulake.habbo.avatar.AvatarImagePartContainer;
   import com.sulake.habbo.avatar.AvatarStructure;
   import com.sulake.habbo.avatar.IAvatarImage;
   import com.sulake.habbo.avatar.actions.IActiveActionData;
   import com.sulake.habbo.avatar.alias.AssetAliasCollection;
   import com.sulake.habbo.avatar.animation.Animation;
   import com.sulake.habbo.avatar.animation.AnimationLayerData;
   import com.sulake.habbo.avatar.enum.AvatarAction;
   import com.sulake.habbo.avatar.enum.AvatarBodyPartType;
   import com.sulake.habbo.avatar.enum.AvatarDirectionAngle;
   import com.sulake.habbo.avatar.enum.AvatarScaleType;
   import com.sulake.habbo.avatar.enum.GeometryType;
   import com.sulake.habbo.avatar.palette.PaletteMap;
   import com.sulake.habbo.avatar.structure.AvatarCanvas;
   import flash.display.BitmapData;
   import flash.geom.ColorTransform;
   import flash.geom.Point;
   import flash.geom.Rectangle;
   import flash.utils.ByteArray;
   import flash.utils.Dictionary;
   import flash.utils.getTimer;
   
   public class AvatarImageCache
   {
      
      private static const const_1686:int = 60000;
       
      
      private var _structure:AvatarStructure;
      
      private var var_1404:IAvatarImage;
      
      private var _assets:AssetAliasCollection;
      
      private var _scale:String;
      
      private var var_254:Map;
      
      private var var_87:AvatarCanvas;
      
      private var _disposed:Boolean;
      
      private var _bodyPartCache:AvatarImageBodyPartCache;
      
      private var var_360:IActiveActionData;
      
      private var var_410:AvatarImageBodyPartContainer;
      
      private var var_1395:String;
      
      private var var_112:AvatarImagePartContainer;
      
      private var var_2497:Point;
      
      private var var_750:String;
      
      private var var_171:BitmapData;
      
      private var var_1396:String;
      
      private var var_172:String;
      
      private var var_1788:String;
      
      private var _frame:int;
      
      private var var_421:BitmapDataAsset;
      
      private var var_931:BitmapData;
      
      private var var_2496:ByteArray;
      
      private var var_2495:ImageData;
      
      private var var_957:PaletteMap;
      
      private var var_932:Array;
      
      private var var_933:Point;
      
      public function AvatarImageCache(param1:AvatarStructure, param2:IAvatarImage, param3:AssetAliasCollection, param4:String)
      {
         this.var_932 = new Array();
         super();
         this._structure = param1;
         this.var_1404 = param2;
         this._assets = param3;
         this._scale = param4;
         this.var_254 = new Map();
      }
      
      public function dispose() : void
      {
         var _loc1_:* = null;
         var _loc2_:* = null;
         var _loc3_:* = null;
         if(this._disposed)
         {
            return;
         }
         this._structure = null;
         this.var_1404 = null;
         this._assets = null;
         if(this.var_254 != null)
         {
            _loc2_ = this.var_254.getKeys();
            for each(_loc3_ in _loc2_)
            {
               _loc1_ = this.var_254.getValue(_loc3_) as AvatarImageBodyPartCache;
               if(_loc1_ != null)
               {
                  _loc1_.dispose();
               }
            }
            this.var_254.dispose();
            this.var_254 = null;
         }
         this.var_87 = null;
         this.var_421 = null;
         this.var_931 = null;
         if(this.var_171)
         {
            this.var_171.dispose();
         }
         this.var_171 = null;
         this._disposed = true;
      }
      
      public function disposeInactiveActions(param1:int = 60000) : void
      {
         var _loc3_:* = null;
         var _loc5_:* = null;
         var _loc2_:int = getTimer();
         var _loc4_:Array = this.var_254.getKeys();
         for each(_loc5_ in _loc4_)
         {
            _loc3_ = this.var_254.getValue(_loc5_) as AvatarImageBodyPartCache;
            if(_loc3_ != null)
            {
               _loc3_.disposeActions(param1,_loc2_);
            }
         }
      }
      
      public function resetBodyPartCache(param1:IActiveActionData) : void
      {
         var _loc2_:* = null;
         var _loc4_:* = null;
         var _loc3_:Array = this.var_254.getKeys();
         for each(_loc4_ in _loc3_)
         {
            _loc2_ = this.var_254.getValue(_loc4_) as AvatarImageBodyPartCache;
            if(_loc2_ != null)
            {
               _loc2_.setAction(param1,0);
            }
         }
      }
      
      public function setDirection(param1:String, param2:int) : void
      {
         var _loc4_:* = null;
         var _loc5_:* = null;
         var _loc3_:Array = this._structure.getBodyPartsUnordered(param1);
         for each(_loc5_ in _loc3_)
         {
            _loc4_ = this.getBodyPartCache(_loc5_);
            if(_loc4_ != null)
            {
               _loc4_.setDirection(param2);
            }
         }
      }
      
      public function setAction(param1:IActiveActionData, param2:int) : void
      {
         var _loc4_:* = null;
         var _loc5_:* = null;
         var _loc3_:Array = this._structure.getActiveBodyPartIds(param1);
         for each(_loc4_ in _loc3_)
         {
            _loc5_ = this.getBodyPartCache(_loc4_);
            if(_loc5_ != null)
            {
               _loc5_.setAction(param1,param2);
            }
         }
      }
      
      public function setGeometryType(param1:String) : void
      {
         if(this.var_750 == param1)
         {
            return;
         }
         if(this.var_750 == GeometryType.const_1057 && param1 == GeometryType.const_1107 || this.var_750 == GeometryType.const_1107 && param1 == GeometryType.const_1057)
         {
            this.var_750 = param1;
            this.var_87 = null;
            return;
         }
         this.disposeInactiveActions(0);
         this.var_750 = param1;
         this.var_87 = null;
      }
      
      public function getImageContainer(param1:String, param2:int) : AvatarImageBodyPartContainer
      {
         var _loc11_:int = 0;
         var _loc12_:* = null;
         var _loc13_:int = 0;
         var _loc14_:* = null;
         var _loc15_:* = null;
         var _loc16_:* = null;
         this._bodyPartCache = this.getBodyPartCache(param1);
         if(this._bodyPartCache == null)
         {
            this._bodyPartCache = new AvatarImageBodyPartCache();
            this.var_254.add(param1,this._bodyPartCache);
         }
         var _loc3_:int = this._bodyPartCache.getDirection();
         var _loc4_:int = param2;
         this.var_360 = this._bodyPartCache.getAction();
         var _loc5_:IActiveActionData = this.var_360;
         var _loc6_:* = [];
         var _loc7_:Dictionary = new Dictionary();
         var _loc8_:Point = new Point();
         if(!(!this.var_360 || !this.var_360.definition))
         {
            if(this.var_360.definition.isAnimation)
            {
               _loc11_ = _loc3_;
               _loc12_ = this._structure.getAnimation(this.var_360.definition.state + "." + this.var_360.actionParameter);
               _loc13_ = param2 - this.var_360.startFrame;
               if(_loc12_ != null)
               {
                  _loc14_ = _loc12_.getLayerData(_loc13_,param1,this.var_360.overridingAction);
                  if(_loc14_ != null)
                  {
                     _loc11_ = _loc3_ + _loc14_.directionOffset;
                     if(_loc14_.directionOffset < 0)
                     {
                        if(_loc11_ < 0)
                        {
                           _loc11_ = 8 + _loc11_;
                        }
                        else if(_loc11_ > 7)
                        {
                           _loc11_ = 8 - _loc11_;
                        }
                     }
                     else if(_loc11_ < 0)
                     {
                        _loc11_ += 8;
                     }
                     else if(_loc11_ > 7)
                     {
                        _loc11_ -= 8;
                     }
                     if(this._scale == AvatarScaleType.const_56)
                     {
                        _loc8_.x = _loc14_.dx;
                        _loc8_.y = _loc14_.dy;
                     }
                     else
                     {
                        _loc8_.x = _loc14_.dx / 2;
                        _loc8_.y = _loc14_.dy / 2;
                     }
                     _loc4_ = _loc14_.animationFrame;
                     if(_loc14_.action != null)
                     {
                        this.var_360 = _loc14_.action;
                     }
                     if(_loc14_.type == AnimationLayerData.const_629)
                     {
                        if(_loc14_.action != null)
                        {
                           _loc5_ = _loc14_.action;
                        }
                        _loc3_ = _loc11_;
                     }
                     else if(_loc14_.type == AnimationLayerData.const_476)
                     {
                        _loc3_ = _loc11_;
                     }
                     _loc7_ = _loc14_.items;
                  }
                  _loc6_ = _loc12_.removeData;
               }
            }
         }
         var _loc9_:AvatarImageActionCache = this._bodyPartCache.getActionCache(_loc5_);
         if(_loc9_ == null)
         {
            _loc9_ = new AvatarImageActionCache();
            this._bodyPartCache.updateActionCache(_loc5_,_loc9_);
         }
         var _loc10_:AvatarImageDirectionCache = _loc9_.getDirectionCache(_loc3_);
         if(_loc10_ == null)
         {
            _loc15_ = this._structure.getParts(param1,this.var_1404.getFigure(),_loc5_,this.var_750,_loc3_,_loc6_,_loc7_);
            _loc10_ = new AvatarImageDirectionCache(_loc15_);
            _loc9_.updateDirectionCache(_loc3_,_loc10_);
         }
         this.var_410 = _loc10_.getImageContainer(_loc4_);
         if(this.var_410 == null)
         {
            _loc16_ = _loc10_.getPartList();
            this.var_410 = this.renderBodyPart(_loc3_,_loc16_,_loc4_,this.var_360);
            if(this.var_410 == null)
            {
               return null;
            }
            _loc10_.updateImageContainer(this.var_410,_loc4_);
         }
         this.var_410.offset = _loc8_;
         return this.var_410;
      }
      
      public function getBodyPartCache(param1:String) : AvatarImageBodyPartCache
      {
         var _loc2_:AvatarImageBodyPartCache = this.var_254.getValue(param1) as AvatarImageBodyPartCache;
         if(_loc2_ == null)
         {
            _loc2_ = new AvatarImageBodyPartCache();
            this.var_254.add(param1,_loc2_);
         }
         return _loc2_;
      }
      
      private function renderBodyPart(param1:int, param2:Array, param3:int, param4:IActiveActionData) : AvatarImageBodyPartContainer
      {
         var _loc7_:Boolean = false;
         var _loc8_:int = 0;
         var _loc15_:* = null;
         var _loc16_:* = NaN;
         var _loc17_:* = null;
         var _loc18_:* = null;
         if(param2 == null)
         {
            return null;
         }
         if(param2.length == 0)
         {
            return null;
         }
         if(!this.var_87)
         {
            this.var_87 = this._structure.getCanvas(this._scale,this.var_750);
            if(!this.var_87)
            {
               return null;
            }
            this.var_2497 = new Point(0,this.var_87.height - int(this.var_87.width / 4));
         }
         var _loc5_:int = param1;
         var _loc6_:Boolean = AvatarDirectionAngle.const_1375[param1];
         var _loc9_:String = param4.definition.assetPartDefinition;
         var _loc10_:String = param4.definition.state;
         var _loc11_:Boolean = _loc10_ == AvatarAction.const_891 || _loc10_ == AvatarAction.const_387;
         var _loc12_:int = param2.length - 1;
         _loc8_ = _loc12_;
         while(_loc8_ >= 0)
         {
            this.var_112 = param2[_loc8_] as AvatarImagePartContainer;
            if(!(param1 == 7 && (this.var_112.partType == "fc" || this.var_112.partType == "ey")))
            {
               this.var_1395 = this.var_112.bodyPartId;
               this.var_172 = this.var_112.partType;
               this.var_1788 = this.var_112.partId;
               this._frame = this.var_112.getFrameIndex(param3);
               _loc5_ = param1;
               _loc7_ = false;
               if(_loc6_)
               {
                  if(_loc9_ == "wav" && (this.var_172 == "lh" || this.var_172 == "ls" || this.var_172 == "lc" || this.var_172 == "lhs"))
                  {
                     _loc7_ = true;
                  }
                  else if(_loc9_ == "drk" && (this.var_172 == "rh" || this.var_172 == "rs" || this.var_172 == "rc" || this.var_172 == "rhs"))
                  {
                     _loc7_ = true;
                  }
                  else if(_loc9_ == "crr" && this.var_172 == "rhs")
                  {
                     _loc7_ = true;
                  }
                  else if(this.var_172 == "ri")
                  {
                     _loc7_ = true;
                  }
                  else if(this.var_172 == "cp")
                  {
                     _loc7_ = true;
                  }
                  else
                  {
                     if(param1 == 4)
                     {
                        _loc5_ = 2;
                     }
                     else if(param1 == 5)
                     {
                        _loc5_ = 1;
                     }
                     else if(param1 == 6)
                     {
                        _loc5_ = 0;
                     }
                     if(this.var_112.flippedPartType != this.var_172)
                     {
                        this.var_172 = this.var_112.flippedPartType;
                     }
                  }
               }
               this.var_1396 = this._scale + "_" + this.var_112.action.assetPartDefinition + "_" + this.var_172 + "_" + this.var_1788 + "_" + _loc5_ + "_" + this._frame;
               this.var_421 = this._assets.getAssetByName(this.var_1396) as BitmapDataAsset;
               if(this.var_421 == null)
               {
                  this.var_1396 = this._scale + "_std_" + this.var_172 + "_" + this.var_1788 + "_" + _loc5_ + "_0";
                  this.var_421 = this._assets.getAssetByName(this.var_1396) as BitmapDataAsset;
               }
               if(!(!this.var_421 || !this.var_421.content))
               {
                  if(this.var_112.paletteMapId > -1)
                  {
                     this.var_957 = this._structure.renderManager.paletteManager.getPalette(this.var_112.paletteMapId);
                     if(this.var_957 != null)
                     {
                        this.var_931 = this.var_421.content as BitmapData;
                        this.var_171 = new BitmapData(this.var_931.width,this.var_931.height);
                        this.var_2496 = this.var_957.colorize(this.var_931.getPixels(this.var_931.rect));
                        this.var_171.setPixels(this.var_171.rect,this.var_2496);
                     }
                     else
                     {
                        this.var_171 = (this.var_421.content as BitmapData).clone();
                     }
                  }
                  else
                  {
                     this.var_171 = (this.var_421.content as BitmapData).clone();
                  }
                  if(this.var_171 == null)
                  {
                     return null;
                  }
                  if(_loc11_ && (this.var_1395 == AvatarBodyPartType.const_242 || this.var_1395 == AvatarBodyPartType.const_1535 || this.var_1395 == AvatarBodyPartType.const_1628) && this.var_112.color != null)
                  {
                     _loc16_ = 0.7;
                     _loc17_ = this.var_112.color.colorTransform;
                     _loc18_ = new ColorTransform(_loc17_.redMultiplier * _loc16_,_loc17_.greenMultiplier * _loc16_ + 0.3,_loc17_.blueMultiplier * _loc16_ + 0.3,_loc17_.alphaMultiplier,0,0,20);
                     this.var_171.colorTransform(this.var_171.rect,_loc18_);
                  }
                  else if(this.var_112.isColorable && this.var_112.color != null)
                  {
                     this.var_171.colorTransform(this.var_171.rect,this.var_112.color.colorTransform);
                  }
                  if(this.var_112.isBlendable)
                  {
                     this.var_171.colorTransform(this.var_171.rect,this.var_112.blendTransform);
                  }
                  this.var_933 = this.var_421.offset.clone();
                  if(_loc7_)
                  {
                     if(this._scale == AvatarScaleType.const_56)
                     {
                        this.var_933.x += 65;
                     }
                     else
                     {
                        this.var_933.x += 31;
                     }
                  }
                  this.var_2495 = new ImageData(this.var_171,this.var_933,_loc7_);
                  this.var_932.push(this.var_2495);
               }
            }
            _loc8_--;
         }
         if(this.var_932.length == 0)
         {
            return null;
         }
         var _loc13_:ImageData = this.createUnionImage(this.var_932,_loc6_);
         var _loc14_:Point = new Point(-1 * _loc13_.regpoint.x,this.var_2497.y - _loc13_.regpoint.y);
         if(_loc6_)
         {
            if(this._scale == AvatarScaleType.const_56)
            {
               _loc14_.x += 67;
            }
            else
            {
               _loc14_.x += 31;
            }
         }
         _loc8_ = this.var_932.length - 1;
         while(_loc8_ >= 0)
         {
            _loc15_ = this.var_932.pop();
            if(_loc15_)
            {
               _loc15_.dispose();
            }
            _loc8_--;
         }
         return new AvatarImageBodyPartContainer(_loc13_.bitmap,_loc14_);
      }
      
      private function createUnionImage(param1:Array, param2:Boolean) : ImageData
      {
         var _loc4_:* = null;
         var _loc5_:* = null;
         var _loc6_:* = null;
         var _loc7_:* = null;
         var _loc3_:Rectangle = new Rectangle();
         for each(_loc4_ in param1)
         {
            _loc3_ = _loc3_.union(_loc4_.offsetRect);
         }
         _loc5_ = new Point(-_loc3_.left,-_loc3_.top);
         _loc6_ = new BitmapData(_loc3_.width,_loc3_.height,true,16777215);
         for each(_loc4_ in param1)
         {
            _loc7_ = _loc5_.subtract(_loc4_.regpoint);
            _loc6_.copyPixels(_loc4_.bitmap,_loc4_.bitmap.rect,_loc7_,null,null,true);
         }
         return new ImageData(_loc6_,_loc5_,param2);
      }
      
      private function debugInfo(param1:String) : void
      {
         Logger.log("[AvatarImagecache] " + param1);
      }
   }
}

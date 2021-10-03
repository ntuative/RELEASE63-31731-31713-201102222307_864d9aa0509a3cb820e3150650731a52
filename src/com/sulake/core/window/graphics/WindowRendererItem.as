package com.sulake.core.window.graphics
{
   import com.sulake.core.runtime.IDisposable;
   import com.sulake.core.window.IWindow;
   import com.sulake.core.window.enum.WindowParam;
   import com.sulake.core.window.enum.WindowStyle;
   import com.sulake.core.window.graphics.renderer.ISkinRenderer;
   import flash.display.BitmapData;
   import flash.geom.ColorTransform;
   import flash.geom.Matrix;
   import flash.geom.Point;
   import flash.geom.Rectangle;
   
   public class WindowRendererItem implements IDisposable
   {
      
      private static const const_611:uint = 0;
      
      private static const const_971:uint = 1;
      
      private static const const_970:uint = 2;
       
      
      private var var_102:BitmapData;
      
      private var var_152:WindowRenderer;
      
      private var var_864:ISkinContainer;
      
      private var _drawBufferAllocator:DrawBufferAllocator;
      
      private var _disposed:Boolean;
      
      private var var_645:Boolean;
      
      private var var_181:Rectangle;
      
      private var var_997:Matrix;
      
      private var var_1923:ColorTransform;
      
      private var var_1474:uint;
      
      private var var_984:uint;
      
      public function WindowRendererItem(param1:WindowRenderer, param2:DrawBufferAllocator, param3:ISkinContainer)
      {
         super();
         this._disposed = false;
         this.var_152 = param1;
         this.var_864 = param3;
         this._drawBufferAllocator = param2;
         this.var_1474 = 4294967295;
         this.var_984 = 0;
         this.var_1923 = new ColorTransform();
         this.var_997 = new Matrix();
         this.var_181 = new Rectangle();
      }
      
      public function get disposed() : Boolean
      {
         return this._disposed;
      }
      
      public function get buffer() : BitmapData
      {
         return this.var_102;
      }
      
      public function get dirty() : Rectangle
      {
         return this.var_181;
      }
      
      public function dispose() : void
      {
         if(!this._disposed)
         {
            this._disposed = true;
            this.var_152 = null;
            this.var_864 = null;
            if(this.var_102 != null)
            {
               this._drawBufferAllocator.free(this.var_102);
               this.var_102 = null;
            }
         }
      }
      
      public function render(param1:IWindow, param2:Point, param3:Rectangle) : Boolean
      {
         var _loc4_:* = null;
         var _loc11_:Boolean = false;
         var _loc12_:* = 0;
         var _loc5_:uint = !!param1.background ? uint(const_970) : uint(const_611);
         var _loc6_:Boolean = this.var_181.width > 0 && this.var_181.height > 0;
         var _loc7_:ISkinRenderer = this.resolveSkinRenderer(param1);
         if(_loc7_ != null)
         {
            if(_loc7_.isStateDrawable(this.var_984))
            {
               _loc5_ = const_971;
            }
         }
         var _loc8_:int = Math.max(param1.width,1);
         var _loc9_:int = Math.max(param1.height,1);
         if(_loc5_ != const_611)
         {
            if(this.var_102 == null)
            {
               this.var_102 = this._drawBufferAllocator.allocate(_loc8_,_loc9_,true,param1.color);
               this.var_645 = true;
               _loc6_ = true;
            }
            else if(this.var_102.width != _loc8_ || this.var_102.height != _loc9_)
            {
               this._drawBufferAllocator.free(this.var_102);
               this.var_102 = this._drawBufferAllocator.allocate(_loc8_,_loc9_,true,param1.color);
               this.var_645 = true;
               _loc6_ = true;
            }
         }
         var _loc10_:IGraphicContext = IGraphicContextHost(param1).getGraphicContext(false);
         if(_loc10_)
         {
            if(!_loc10_.visible)
            {
               _loc10_.visible = true;
            }
            _loc11_ = param1.testParamFlag(WindowParam.WINDOW_PARAM_FORCE_CLIPPING);
            _loc10_.setDrawRegion(param1.rectangle,!param1.testParamFlag(WindowParam.const_32),!!_loc11_ ? param3 : null);
            if(_loc11_)
            {
               param3 = new Rectangle(0,0,_loc8_,_loc9_);
            }
         }
         if(_loc5_ != const_611)
         {
            this.var_1474 = this.var_984;
            _loc4_ = param1.fetchDrawBuffer() as BitmapData;
            if(_loc4_ != null)
            {
               _loc4_.lock();
               if(_loc5_ == const_971)
               {
                  _loc6_ = true;
                  if(!param1.testParamFlag(WindowParam.const_32))
                  {
                     _loc4_.fillRect(param3,0);
                  }
                  if(this.var_645)
                  {
                     this.var_645 = false;
                     this.var_102.fillRect(this.var_102.rect,param1.color);
                     _loc7_.draw(param1,this.var_102,this.var_102.rect,this.var_984,false);
                     if(!param1.background)
                     {
                        _loc12_ = uint(param1.color);
                        if((_loc12_ & 16777215) < 16777215)
                        {
                           this.var_102.colorTransform(_loc4_.rect,new ColorTransform(((_loc12_ & 16711680) >> 16) / 255,((_loc12_ & 65280) >> 8) / 255,(_loc12_ & 255) / 255));
                        }
                     }
                  }
                  if(param1.blend < 1 && param1.testParamFlag(WindowParam.const_32))
                  {
                     this.var_997.tx = param2.x;
                     this.var_997.ty = param2.y;
                     this.var_1923.alphaMultiplier = param1.blend;
                     param3.offset(param2.x,param2.y);
                     _loc4_.draw(this.var_102,this.var_997,this.var_1923,null,param3,false);
                     param3.offset(-param2.x,-param2.y);
                  }
                  else
                  {
                     _loc4_.copyPixels(this.var_102,param3,param2,null,null,true);
                  }
               }
               else if(_loc5_ == const_970)
               {
                  _loc6_ = true;
                  if(param1.testParamFlag(WindowParam.const_32))
                  {
                     this.var_102.fillRect(this.var_102.rect,param1.color);
                     _loc4_.copyPixels(this.var_102,param3,param2,null,null,true);
                  }
                  else
                  {
                     _loc4_.fillRect(new Rectangle(param2.x,param2.y,param3.width,param3.height),param1.color);
                     _loc10_.blend = param1.blend;
                  }
               }
               _loc4_.unlock();
            }
            this.var_181.left = int.MAX_VALUE;
            this.var_181.top = int.MAX_VALUE;
            this.var_181.right = int.MIN_VALUE;
            this.var_181.bottom = int.MIN_VALUE;
         }
         return true;
      }
      
      private function resolveSkinRenderer(param1:IWindow) : ISkinRenderer
      {
         var _loc2_:ISkinRenderer = this.var_864.getSkinRendererByTypeAndStyle(param1.type,param1.style);
         if(_loc2_ == null)
         {
            if(param1.style != WindowStyle.const_199)
            {
               _loc2_ = this.var_864.getSkinRendererByTypeAndStyle(param1.type,WindowStyle.const_199);
            }
         }
         return _loc2_;
      }
      
      public function testForStateChange(param1:IWindow) : Boolean
      {
         return this.var_864.getTheActualState(param1.type,param1.style,param1.state) != this.var_1474;
      }
      
      public function invalidate(param1:IWindow, param2:Rectangle, param3:uint) : Boolean
      {
         var _loc5_:* = null;
         var _loc4_:Boolean = false;
         switch(param3)
         {
            case WindowRedrawFlag.const_67:
               this.var_645 = true;
               _loc4_ = true;
               break;
            case WindowRedrawFlag.RESIZE:
               this.var_645 = true;
               _loc4_ = true;
               break;
            case WindowRedrawFlag.const_492:
               if(param1.testParamFlag(WindowParam.const_32))
               {
                  _loc4_ = true;
               }
               else
               {
                  _loc5_ = IGraphicContextHost(param1).getGraphicContext(true);
                  _loc5_.setDrawRegion(param1.rectangle,false,null);
                  if(!_loc5_.visible)
                  {
                     _loc4_ = true;
                  }
               }
               break;
            case WindowRedrawFlag.const_1182:
               this.var_984 = this.var_864.getTheActualState(param1.type,param1.style,param1.state);
               if(this.var_984 != this.var_1474)
               {
                  this.var_645 = true;
                  _loc4_ = true;
               }
               break;
            case WindowRedrawFlag.const_1030:
               if(param1.testParamFlag(WindowParam.const_32))
               {
                  this.var_645 = true;
                  _loc4_ = true;
               }
               else
               {
                  IGraphicContextHost(param1).getGraphicContext(true).blend = param1.blend;
               }
               break;
            case WindowRedrawFlag.const_1034:
               _loc4_ = true;
         }
         if(_loc4_)
         {
            this.var_181.left = Math.min(this.var_181.left,param2.left);
            this.var_181.top = Math.min(this.var_181.top,param2.top);
            this.var_181.right = Math.max(this.var_181.right,param2.right);
            this.var_181.bottom = Math.max(this.var_181.bottom,param2.bottom);
         }
         return _loc4_;
      }
      
      private function drawRect(param1:BitmapData, param2:Rectangle, param3:uint) : void
      {
         var _loc4_:int = 0;
         _loc4_ = param2.left;
         while(_loc4_ < param2.right)
         {
            param1.setPixel32(_loc4_,param2.top,param3);
            param1.setPixel32(_loc4_,param2.bottom - 1,param3);
            _loc4_++;
         }
         _loc4_ = param2.top;
         while(_loc4_ < param2.bottom)
         {
            param1.setPixel32(param2.left,_loc4_,param3);
            param1.setPixel32(param2.right - 1,_loc4_,param3);
            _loc4_++;
         }
      }
   }
}

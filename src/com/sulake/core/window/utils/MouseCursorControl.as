package com.sulake.core.window.utils
{
   import com.sulake.core.runtime.IDisposable;
   import com.sulake.core.window.enum.MouseCursorType;
   import flash.display.DisplayObject;
   import flash.display.Sprite;
   import flash.display.Stage;
   import flash.events.Event;
   import flash.events.MouseEvent;
   import flash.ui.Mouse;
   import flash.utils.Dictionary;
   
   public class MouseCursorControl extends Sprite implements IMouseCursor, IDisposable
   {
       
      
      private var _type:uint;
      
      private var var_228:Stage;
      
      private var var_377:Boolean;
      
      private var var_1683:DisplayObject;
      
      private var _disposed:Boolean = false;
      
      private var var_1684:Dictionary;
      
      public function MouseCursorControl(param1:DisplayObject)
      {
         super();
         this._type = MouseCursorType.const_31;
         this.var_228 = param1.stage;
         this.var_377 = true;
         this.var_1684 = new Dictionary();
         this.var_228.addChild(this);
         this.var_228.addEventListener(Event.MOUSE_LEAVE,this.onStageMouseLeave);
         this.var_228.addEventListener(MouseEvent.MOUSE_MOVE,this.onStageMouseMove);
         this.var_228.addEventListener(MouseEvent.MOUSE_OVER,this.onStageMouseMove);
         this.var_228.addEventListener(MouseEvent.MOUSE_OUT,this.onStageMouseMove);
      }
      
      public function dispose() : void
      {
         if(!this._disposed)
         {
            this.var_228.removeEventListener(Event.MOUSE_LEAVE,this.onStageMouseLeave);
            this.var_228.removeEventListener(MouseEvent.MOUSE_MOVE,this.onStageMouseMove);
            this.var_228.removeEventListener(MouseEvent.MOUSE_OVER,this.onStageMouseMove);
            this.var_228.removeEventListener(MouseEvent.MOUSE_OUT,this.onStageMouseMove);
            this._disposed = true;
         }
      }
      
      public function get disposed() : Boolean
      {
         return this._disposed;
      }
      
      public function get type() : uint
      {
         return this._type;
      }
      
      public function set type(param1:uint) : void
      {
         this._type = param1;
         this.var_1683 = this.var_1684[this._type];
         if(numChildren > 0)
         {
            removeChildAt(0);
         }
         if(this.var_1683)
         {
            addChild(this.var_1683);
            Mouse.hide();
         }
         else
         {
            Mouse.show();
         }
      }
      
      override public function get visible() : Boolean
      {
         return this.var_377;
      }
      
      override public function set visible(param1:Boolean) : void
      {
         this.var_377 = param1;
         if(this.var_377)
         {
            Mouse.show();
         }
         else
         {
            Mouse.hide();
         }
      }
      
      public function defineCustomCursorType(param1:uint, param2:DisplayObject) : void
      {
         this.var_1684[param1] = param2;
      }
      
      private function onStageMouseMove(param1:MouseEvent) : void
      {
         x = param1.stageX - 2;
         y = param1.stageY;
         if(this._type == MouseCursorType.const_31)
         {
            this.var_377 = false;
            Mouse.show();
         }
         else
         {
            this.var_377 = true;
            Mouse.hide();
         }
      }
      
      private function onStageMouseLeave(param1:Event) : void
      {
         if(this._type != MouseCursorType.const_31)
         {
            Mouse.hide();
            this.var_377 = false;
         }
      }
   }
}

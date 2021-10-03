package com.sulake.habbo.room
{
   import com.sulake.core.assets.IAssetLibrary;
   import com.sulake.core.communication.connection.IConnection;
   import com.sulake.core.runtime.Component;
   import com.sulake.core.runtime.IContext;
   import com.sulake.core.runtime.IID;
   import com.sulake.core.runtime.IUnknown;
   import com.sulake.core.runtime.IUpdateReceiver;
   import com.sulake.core.utils.Map;
   import com.sulake.habbo.advertisement.IAdManager;
   import com.sulake.habbo.advertisement.events.AdEvent;
   import com.sulake.habbo.communication.IHabboCommunicationManager;
   import com.sulake.habbo.configuration.IHabboConfigurationManager;
   import com.sulake.habbo.room.events.RoomEngineEvent;
   import com.sulake.habbo.room.events.RoomEngineObjectEvent;
   import com.sulake.habbo.room.events.RoomEngineRoomColorEvent;
   import com.sulake.habbo.room.events.RoomObjectDimmerStateUpdateEvent;
   import com.sulake.habbo.room.events.RoomObjectFurnitureActionEvent;
   import com.sulake.habbo.room.events.RoomObjectMoveEvent;
   import com.sulake.habbo.room.events.RoomObjectRoomActionEvent;
   import com.sulake.habbo.room.events.RoomObjectRoomAdEvent;
   import com.sulake.habbo.room.events.RoomObjectStateChangeEvent;
   import com.sulake.habbo.room.events.RoomObjectWidgetRequestEvent;
   import com.sulake.habbo.room.messages.RoomObjectAvatarFigureUpdateMessage;
   import com.sulake.habbo.room.messages.RoomObjectAvatarUpdateMessage;
   import com.sulake.habbo.room.messages.RoomObjectDataUpdateMessage;
   import com.sulake.habbo.room.messages.RoomObjectItemDataUpdateMessage;
   import com.sulake.habbo.room.messages.RoomObjectRoomAdUpdateMessage;
   import com.sulake.habbo.room.messages.RoomObjectRoomColorUpdateMessage;
   import com.sulake.habbo.room.messages.RoomObjectRoomMaskUpdateMessage;
   import com.sulake.habbo.room.messages.RoomObjectRoomPlaneVisibilityUpdateMessage;
   import com.sulake.habbo.room.messages.RoomObjectRoomUpdateMessage;
   import com.sulake.habbo.room.messages.RoomObjectUpdateStateMessage;
   import com.sulake.habbo.room.object.RoomObjectCategoryEnum;
   import com.sulake.habbo.room.object.RoomObjectVariableEnum;
   import com.sulake.habbo.room.object.RoomPlaneData;
   import com.sulake.habbo.room.object.RoomPlaneParser;
   import com.sulake.habbo.room.utils.LegacyWallGeometry;
   import com.sulake.habbo.room.utils.RoomCamera;
   import com.sulake.habbo.room.utils.RoomData;
   import com.sulake.habbo.room.utils.RoomInstanceData;
   import com.sulake.habbo.room.utils.SelectedRoomObjectData;
   import com.sulake.habbo.room.utils.TileHeightMap;
   import com.sulake.habbo.session.ISessionDataManager;
   import com.sulake.iid.IIDHabboAdManager;
   import com.sulake.iid.IIDHabboCommunicationManager;
   import com.sulake.iid.IIDHabboConfigurationManager;
   import com.sulake.iid.IIDRoomManager;
   import com.sulake.iid.IIDRoomObjectFactory;
   import com.sulake.iid.IIDRoomObjectVisualizationFactory;
   import com.sulake.iid.IIDRoomRendererFactory;
   import com.sulake.iid.IIDSessionDataManager;
   import com.sulake.room.IRoomInstance;
   import com.sulake.room.IRoomManager;
   import com.sulake.room.IRoomManagerListener;
   import com.sulake.room.IRoomObjectFactory;
   import com.sulake.room.events.RoomObjectEvent;
   import com.sulake.room.events.RoomObjectMouseEvent;
   import com.sulake.room.messages.RoomObjectUpdateMessage;
   import com.sulake.room.object.IRoomObject;
   import com.sulake.room.object.IRoomObjectController;
   import com.sulake.room.object.IRoomObjectVisualizationFactory;
   import com.sulake.room.object.visualization.IRoomObjectSpriteVisualization;
   import com.sulake.room.object.visualization.IRoomObjectVisualization;
   import com.sulake.room.renderer.IRoomRenderer;
   import com.sulake.room.renderer.IRoomRendererFactory;
   import com.sulake.room.renderer.IRoomRenderingCanvas;
   import com.sulake.room.utils.IRoomGeometry;
   import com.sulake.room.utils.IVector3d;
   import com.sulake.room.utils.NumberBank;
   import com.sulake.room.utils.RoomGeometry;
   import com.sulake.room.utils.Vector3d;
   import com.sulake.room.utils.XMLValidator;
   import flash.display.Bitmap;
   import flash.display.BitmapData;
   import flash.display.DisplayObject;
   import flash.display.Sprite;
   import flash.events.Event;
   import flash.events.MouseEvent;
   import flash.geom.Matrix;
   import flash.geom.Point;
   import flash.geom.Rectangle;
   import flash.utils.getTimer;
   
   public class RoomEngine extends Component implements IRoomEngine, IRoomManagerListener, IRoomCreator, IRoomEngineServices, IUpdateReceiver
   {
      
      private static const const_585:String = "temporary_room";
      
      private static const const_327:int = -1;
      
      private static const const_584:String = "room";
      
      private static const const_905:int = -2;
      
      private static const const_1225:String = "tile_cursor";
      
      private static const const_907:int = -3;
      
      private static const const_1226:String = "selection_arrow";
      
      private static const const_906:String = "overlay";
      
      private static const const_326:String = "object_icon_sprite";
      
      private static const const_412:int = 15;
       
      
      private var _communication:IHabboCommunicationManager = null;
      
      private var _connection:IConnection = null;
      
      private var var_46:IRoomManager = null;
      
      private var var_815:IRoomRendererFactory = null;
      
      private var var_24:IRoomObjectFactory = null;
      
      private var var_528:IRoomObjectVisualizationFactory = null;
      
      private var var_301:IAdManager = null;
      
      private var var_405:ISessionDataManager = null;
      
      private var var_153:IHabboConfigurationManager;
      
      private var var_71:RoomObjectEventHandler = null;
      
      private var _roomMessageHandler:RoomMessageHandler = null;
      
      private var var_13:RoomContentLoader = null;
      
      private var var_2031:Boolean = false;
      
      private var var_657:NumberBank;
      
      private var var_1013:Map;
      
      private var var_453:Boolean = false;
      
      private var var_96:int = 0;
      
      private var var_97:int = 0;
      
      private var var_1252:int = -1;
      
      private var var_1253:int = 0;
      
      private var var_1251:int = 0;
      
      private var var_1012:Boolean = false;
      
      private var var_814:Boolean = false;
      
      private var var_2029:int = 0;
      
      private var var_2030:int = 0;
      
      private var var_320:Map = null;
      
      private var var_319:Map = null;
      
      public function RoomEngine(param1:IContext, param2:uint = 0)
      {
         super(param1,param2);
         this.var_319 = new Map();
         this.var_657 = new NumberBank(1000);
         this.var_1013 = new Map();
         this.var_320 = new Map();
         this.var_71 = new RoomObjectEventHandler(this);
         this._roomMessageHandler = new RoomMessageHandler(this);
         this.var_13 = new RoomContentLoader();
         queueInterface(new IIDRoomObjectFactory(),this.onObjectFactoryReady);
         queueInterface(new IIDRoomObjectVisualizationFactory(),this.onVisualizationFactoryReady);
         queueInterface(new IIDRoomManager(),this.onRoomManagerReady);
         queueInterface(new IIDRoomRendererFactory(),this.onRendererFactoryReady);
         queueInterface(new IIDHabboCommunicationManager(),this.onCommunicationReady);
         queueInterface(new IIDHabboConfigurationManager(),this.onHabboConfigurationReady);
         queueInterface(new IIDHabboAdManager(),this.onAdManagerReady);
         queueInterface(new IIDSessionDataManager(),this.onSessionDataManagerReady);
         this.initialize();
         registerUpdateReceiver(this,1);
      }
      
      public function get isInitialized() : Boolean
      {
         return this.var_453;
      }
      
      public function get roomManager() : IRoomManager
      {
         return this.var_46;
      }
      
      public function get connection() : IConnection
      {
         return this._connection;
      }
      
      public function get activeRoomId() : int
      {
         return this.var_96;
      }
      
      public function get activeRoomCategory() : int
      {
         return this.var_97;
      }
      
      public function isPublicRoomWorldType(param1:String) : Boolean
      {
         if(this.var_13 != null)
         {
            return this.var_13.isPublicRoomWorldType(param1);
         }
         return false;
      }
      
      override public function dispose() : void
      {
         var _loc1_:int = 0;
         var _loc2_:* = null;
         removeUpdateReceiver(this);
         if(this.var_24 != null)
         {
            this.var_24.release(new IIDRoomObjectFactory());
            this.var_24 = null;
         }
         if(this.var_528 != null)
         {
            this.var_528.release(new IIDRoomObjectVisualizationFactory());
            this.var_528 = null;
         }
         if(this.var_46 != null)
         {
            this.var_46.release(new IIDRoomManager());
            this.var_46 = null;
         }
         if(this.var_815 != null)
         {
            this.var_815.release(new IIDRoomRendererFactory());
            this.var_815 = null;
         }
         if(this._communication != null)
         {
            this._communication.release(new IIDHabboCommunicationManager());
            this._communication = null;
         }
         if(this.var_153 != null)
         {
            this.var_153.release(new IIDHabboConfigurationManager());
            this.var_153 = null;
         }
         if(this.var_301)
         {
            this.var_301.release(new IIDHabboAdManager());
            this.var_301 = null;
         }
         this._connection = null;
         if(this.var_657 != null)
         {
            this.var_657.dispose();
            this.var_657 = null;
         }
         if(this.var_1013 != null)
         {
            this.var_1013.dispose();
         }
         if(this.var_71 != null)
         {
            this.var_71.dispose();
            this.var_71 = null;
         }
         if(this._roomMessageHandler != null)
         {
            this._roomMessageHandler.dispose();
            this._roomMessageHandler = null;
         }
         if(this.var_13 != null)
         {
            this.var_13.dispose();
            this.var_13 = null;
         }
         if(this.var_320 != null)
         {
            this.var_320.dispose();
            this.var_320 = null;
         }
         if(this.var_319 != null)
         {
            _loc1_ = 0;
            while(_loc1_ < this.var_319.length)
            {
               _loc2_ = this.var_319.getWithIndex(_loc1_) as RoomInstanceData;
               if(_loc2_ != null)
               {
                  _loc2_.dispose();
               }
               _loc1_++;
            }
            this.var_319.dispose();
            this.var_319 = null;
         }
         super.dispose();
      }
      
      private function initialize() : void
      {
      }
      
      private function getRoomInstanceData(param1:int, param2:int) : RoomInstanceData
      {
         var _loc3_:String = this.getRoomIdentifier(param1,param2);
         var _loc4_:RoomInstanceData = this.var_319.getValue(_loc3_) as RoomInstanceData;
         if(_loc4_ == null)
         {
            _loc4_ = new RoomInstanceData(param1,param2);
            this.var_319.add(_loc3_,_loc4_);
         }
         return _loc4_;
      }
      
      public function setTileHeightMap(param1:int, param2:int, param3:TileHeightMap) : void
      {
         var _loc4_:RoomInstanceData = this.getRoomInstanceData(param1,param2);
         if(_loc4_ != null)
         {
            _loc4_.tileHeightMap = param3;
         }
      }
      
      public function getTileHeightMap(param1:int, param2:int) : TileHeightMap
      {
         var _loc3_:RoomInstanceData = this.getRoomInstanceData(param1,param2);
         if(_loc3_ != null)
         {
            return _loc3_.tileHeightMap;
         }
         return null;
      }
      
      public function setWorldType(param1:int, param2:int, param3:String) : void
      {
         var _loc4_:RoomInstanceData = this.getRoomInstanceData(param1,param2);
         if(_loc4_ != null)
         {
            _loc4_.worldType = param3;
         }
      }
      
      public function getWorldType(param1:int, param2:int) : String
      {
         var _loc3_:RoomInstanceData = this.getRoomInstanceData(param1,param2);
         if(_loc3_ != null)
         {
            return _loc3_.worldType;
         }
         return null;
      }
      
      public function getLegacyGeometry(param1:int, param2:int) : LegacyWallGeometry
      {
         var _loc3_:RoomInstanceData = this.getRoomInstanceData(param1,param2);
         if(_loc3_ != null)
         {
            return _loc3_.legacyGeometry;
         }
         return null;
      }
      
      private function getRoomCamera(param1:int, param2:int) : RoomCamera
      {
         var _loc3_:RoomInstanceData = this.getRoomInstanceData(param1,param2);
         if(_loc3_ != null)
         {
            return _loc3_.roomCamera;
         }
         return null;
      }
      
      public function setSelectedObjectData(param1:int, param2:int, param3:SelectedRoomObjectData) : void
      {
         var _loc4_:RoomInstanceData = this.getRoomInstanceData(param1,param2);
         if(_loc4_ != null)
         {
            _loc4_.selectedObject = param3;
            if(param3 != null)
            {
               _loc4_.placedObject = null;
            }
         }
      }
      
      public function getSelectedObjectData(param1:int, param2:int) : ISelectedRoomObjectData
      {
         var _loc3_:RoomInstanceData = this.getRoomInstanceData(param1,param2);
         if(_loc3_ != null)
         {
            return _loc3_.selectedObject;
         }
         return null;
      }
      
      public function setPlacedObjectData(param1:int, param2:int, param3:SelectedRoomObjectData) : void
      {
         var _loc4_:RoomInstanceData = this.getRoomInstanceData(param1,param2);
         if(_loc4_ != null)
         {
            _loc4_.placedObject = param3;
         }
      }
      
      public function getPlacedObjectData(param1:int, param2:int) : ISelectedRoomObjectData
      {
         var _loc3_:RoomInstanceData = this.getRoomInstanceData(param1,param2);
         if(_loc3_ != null)
         {
            return _loc3_.placedObject;
         }
         return null;
      }
      
      public function update(param1:uint) : void
      {
         var _loc2_:* = null;
         if(this.var_46 != null)
         {
            this.var_46.update(param1);
            this.updateRoomCameras(param1);
            _loc2_ = this.var_46.getRoom(this.getRoomIdentifier(this.var_96,this.var_97));
            if(_loc2_ != null && _loc2_.getRenderer() != null)
            {
               _loc2_.getRenderer().update(param1);
            }
         }
      }
      
      private function updateRoomCameras(param1:uint) : void
      {
         var _loc3_:* = null;
         var _loc4_:* = null;
         var _loc5_:int = 0;
         var _loc6_:int = 0;
         var _loc7_:int = 0;
         var _loc8_:int = 0;
         var _loc9_:int = 0;
         var _loc10_:* = null;
         var _loc11_:* = null;
         var _loc2_:int = 0;
         while(_loc2_ < this.var_319.length)
         {
            _loc3_ = this.var_319.getWithIndex(_loc2_) as RoomInstanceData;
            _loc4_ = null;
            _loc5_ = 0;
            _loc6_ = 0;
            if(_loc3_ != null)
            {
               _loc4_ = _loc3_.roomCamera;
               _loc5_ = _loc3_.roomId;
               _loc6_ = _loc3_.roomCategory;
            }
            if(_loc4_ != null)
            {
               _loc7_ = 1;
               _loc8_ = _loc4_.targetId;
               _loc9_ = _loc4_.targetCategory;
               _loc10_ = this.getRoomObject(_loc5_,_loc6_,_loc8_,_loc9_);
               if(_loc10_ != null)
               {
                  _loc11_ = new Vector3d();
                  _loc11_.assign(_loc10_.getLocation());
                  if(_loc5_ != this.var_96 || _loc6_ != this.var_97 || !this.var_1012)
                  {
                     this.updateRoomCamera(_loc5_,_loc6_,_loc7_,_loc11_,param1);
                  }
               }
            }
            _loc2_++;
         }
      }
      
      private function updateRoomCamera(param1:int, param2:int, param3:int, param4:Vector3d, param5:uint) : void
      {
         var _loc11_:Boolean = false;
         var _loc12_:* = NaN;
         var _loc13_:* = null;
         var _loc14_:Number = NaN;
         var _loc15_:Number = NaN;
         var _loc16_:Number = NaN;
         var _loc17_:Number = NaN;
         var _loc18_:Number = NaN;
         var _loc19_:Number = NaN;
         var _loc20_:* = NaN;
         var _loc21_:* = null;
         var _loc22_:Number = NaN;
         var _loc23_:Number = NaN;
         var _loc24_:* = null;
         var _loc25_:Number = NaN;
         var _loc26_:Number = NaN;
         var _loc27_:* = NaN;
         var _loc28_:* = NaN;
         var _loc29_:* = NaN;
         var _loc30_:* = NaN;
         var _loc31_:* = null;
         var _loc32_:* = null;
         var _loc33_:Boolean = false;
         var _loc34_:Boolean = false;
         var _loc35_:Boolean = false;
         var _loc36_:Boolean = false;
         var _loc37_:Number = NaN;
         var _loc38_:Number = NaN;
         var _loc39_:* = NaN;
         var _loc40_:* = NaN;
         var _loc41_:* = NaN;
         var _loc42_:int = 0;
         var _loc43_:int = 0;
         var _loc44_:int = 0;
         var _loc45_:int = 0;
         var _loc46_:* = null;
         var _loc47_:* = null;
         var _loc6_:IRoomRenderingCanvas = this.getRoomCanvas(param1,param2,param3);
         var _loc7_:RoomInstanceData = this.getRoomInstanceData(param1,param2);
         if(_loc6_ == null || _loc7_ == null)
         {
            return;
         }
         var _loc8_:RoomGeometry = _loc6_.geometry as RoomGeometry;
         var _loc9_:RoomCamera = _loc7_.roomCamera;
         var _loc10_:IRoomInstance = this.getRoom(param1,param2);
         if(_loc8_ != null && _loc9_ != null && _loc10_ != null)
         {
            _loc11_ = true;
            param4.x = Math.round(param4.x);
            param4.y = Math.round(param4.y);
            _loc12_ = Number(Math.floor(param4.z) + 1);
            _loc13_ = this.getRoomCanvasRectangle(param1,param2,param3);
            if(_loc13_ != null)
            {
               _loc14_ = _loc10_.getNumber(RoomVariableEnum.const_763) - 0.5;
               _loc15_ = _loc10_.getNumber(RoomVariableEnum.const_884) - 0.5;
               _loc16_ = _loc10_.getNumber(RoomVariableEnum.const_832) + 0.5;
               _loc17_ = _loc10_.getNumber(RoomVariableEnum.const_728) + 0.5;
               _loc18_ = Math.round((_loc14_ + _loc16_) / 2);
               _loc19_ = Math.round((_loc15_ + _loc17_) / 2);
               _loc20_ = 2;
               _loc21_ = new Point(param4.x - _loc18_,param4.y - _loc19_);
               _loc22_ = _loc8_.scale / Math.sqrt(2);
               _loc23_ = _loc22_ / 2;
               _loc24_ = new Matrix();
               _loc24_.rotate(-(_loc8_.direction.x + 90) / 180 * 0);
               _loc21_ = _loc24_.transformPoint(_loc21_);
               _loc21_.y *= _loc23_ / _loc22_;
               _loc25_ = _loc13_.width / 2 / _loc22_ - 1;
               _loc26_ = _loc13_.height / 2 / _loc23_ - 1;
               _loc27_ = 0;
               _loc28_ = 0;
               _loc29_ = 0;
               _loc30_ = 0;
               _loc31_ = _loc8_.getScreenPoint(new Vector3d(_loc18_,_loc19_,_loc20_));
               _loc31_.x += Math.round(_loc13_.width / 2);
               _loc31_.y += Math.round(_loc13_.height / 2);
               _loc32_ = this.getActiveRoomBoundingRectangle(param3);
               if(_loc32_ == null)
               {
                  _loc8_.adjustLocation(new Vector3d(0,0),25);
                  return;
               }
               _loc32_.offset(-_loc6_.screenOffsetX,-_loc6_.screenOffsetY);
               if(!(_loc32_.width > 1 && _loc32_.height > 1))
               {
                  _loc8_.adjustLocation(new Vector3d(-30,-30),25);
                  return;
               }
               _loc27_ = Number((_loc32_.left - _loc31_.x - _loc8_.scale * 0.25) / _loc22_);
               _loc29_ = Number((_loc32_.right - _loc31_.x + _loc8_.scale * 0.25) / _loc22_);
               _loc28_ = Number((_loc32_.top - _loc31_.y - _loc8_.scale * 0.5) / _loc23_);
               _loc30_ = Number((_loc32_.bottom - _loc31_.y + _loc8_.scale * 0.5) / _loc23_);
               _loc33_ = false;
               _loc34_ = false;
               _loc35_ = false;
               _loc36_ = false;
               _loc37_ = Math.round((_loc29_ - _loc27_) * _loc22_);
               if(_loc37_ < _loc13_.width)
               {
                  _loc12_ = 2;
                  _loc21_.x = (_loc29_ + _loc27_) / 2;
                  _loc35_ = true;
               }
               else
               {
                  if(_loc21_.x > _loc29_ - _loc25_)
                  {
                     _loc21_.x = _loc29_ - _loc25_;
                     _loc33_ = true;
                  }
                  if(_loc21_.x < _loc27_ + _loc25_)
                  {
                     _loc21_.x = _loc27_ + _loc25_;
                     _loc33_ = true;
                  }
               }
               _loc38_ = Math.round((_loc30_ - _loc28_) * _loc23_);
               if(_loc38_ < _loc13_.height)
               {
                  _loc12_ = 2;
                  _loc21_.y = (_loc30_ + _loc28_) / 2;
                  _loc36_ = true;
               }
               else
               {
                  if(_loc21_.y > _loc30_ - _loc26_)
                  {
                     _loc21_.y = _loc30_ - _loc26_;
                     _loc34_ = true;
                  }
                  if(_loc21_.y < _loc28_ + _loc26_)
                  {
                     _loc21_.y = _loc28_ + _loc26_;
                     _loc34_ = true;
                  }
                  _loc21_.y /= _loc23_ / _loc22_;
               }
               _loc24_.invert();
               _loc21_ = _loc24_.transformPoint(_loc21_);
               _loc21_.x += _loc18_;
               _loc21_.y += _loc19_;
               _loc39_ = 0.35;
               _loc40_ = 0.1;
               _loc41_ = 0.2;
               _loc42_ = 10;
               _loc43_ = 10;
               _loc44_ = Math.round(_loc13_.width);
               _loc45_ = Math.round(_loc13_.height);
               if(_loc9_.limitedLocationX && _loc9_.screenWd == _loc44_ && _loc9_.screenHt == _loc45_)
               {
                  _loc41_ = 0;
               }
               if(_loc9_.limitedLocationY && _loc9_.screenWd == _loc44_ && _loc9_.screenHt == _loc45_)
               {
                  _loc39_ = 0;
                  _loc40_ = 0;
               }
               _loc13_.right *= 1 - _loc41_ * 2;
               _loc13_.bottom *= 1 - (_loc39_ + _loc40_);
               if(_loc13_.right < _loc42_)
               {
                  _loc13_.right = _loc42_;
               }
               if(_loc13_.bottom < _loc43_)
               {
                  _loc13_.bottom = _loc43_;
               }
               if(_loc39_ + _loc40_ > 0)
               {
                  _loc13_.offset(-_loc13_.width / 2,-_loc13_.height * (_loc40_ / (_loc39_ + _loc40_)));
               }
               else
               {
                  _loc13_.offset(-_loc13_.width / 2,-_loc13_.height / 2);
               }
               _loc31_ = _loc8_.getScreenPoint(param4);
               if(_loc31_ != null)
               {
                  _loc31_.x += _loc6_.screenOffsetX;
                  _loc31_.y += _loc6_.screenOffsetY;
                  param4.z = _loc12_;
                  param4.x = Math.round(_loc21_.x * 2) / 2;
                  param4.y = Math.round(_loc21_.y * 2) / 2;
                  if(_loc9_.location == null)
                  {
                     _loc8_.location = param4;
                     if(_loc11_)
                     {
                        _loc9_.initializeLocation(new Vector3d(0,0,0));
                     }
                     else
                     {
                        _loc9_.initializeLocation(param4);
                     }
                  }
                  _loc46_ = _loc8_.getScreenPoint(param4);
                  _loc47_ = new Vector3d(0,0,0);
                  if(_loc46_ != null)
                  {
                     _loc47_.x = _loc46_.x;
                     _loc47_.y = _loc46_.y;
                  }
                  if((_loc31_.x < _loc13_.left || _loc31_.x > _loc13_.right) && !_loc35_ || (_loc31_.y < _loc13_.top || _loc31_.y > _loc13_.bottom) && !_loc36_ || _loc35_ && !_loc9_.centeredLocX || _loc36_ && !_loc9_.centeredLocY || (_loc9_.roomWd != _loc32_.width || _loc9_.roomHt != _loc32_.height))
                  {
                     _loc9_.limitedLocationX = _loc33_;
                     _loc9_.limitedLocationY = _loc34_;
                     if(_loc11_)
                     {
                        _loc9_.target = _loc47_;
                     }
                     else
                     {
                        _loc9_.target = param4;
                     }
                  }
                  else
                  {
                     if(!_loc33_)
                     {
                        _loc9_.limitedLocationX = false;
                     }
                     if(!_loc34_)
                     {
                        _loc9_.limitedLocationY = false;
                     }
                  }
                  if(_loc11_)
                  {
                     _loc9_.update(param5,_loc8_.scale / 2,_loc8_.scale);
                  }
                  else
                  {
                     _loc9_.update(param5,0.5,1);
                  }
                  if(_loc11_)
                  {
                     _loc6_.screenOffsetX = -_loc9_.location.x;
                     _loc6_.screenOffsetY = -_loc9_.location.y;
                  }
                  else
                  {
                     _loc8_.adjustLocation(_loc9_.location,25);
                  }
                  _loc9_.centeredLocX = _loc35_;
                  _loc9_.centeredLocY = _loc36_;
                  _loc9_.screenWd = _loc44_;
                  _loc9_.screenHt = _loc45_;
                  _loc9_.roomWd = _loc32_.width;
                  _loc9_.roomHt = _loc32_.height;
               }
            }
         }
      }
      
      private function onObjectFactoryReady(param1:IID = null, param2:IUnknown = null) : void
      {
         if(disposed)
         {
            return;
         }
         this.var_24 = param2 as IRoomObjectFactory;
         this.initializeObjectEvents();
         this.initializeRoomManager();
      }
      
      private function onVisualizationFactoryReady(param1:IID = null, param2:IUnknown = null) : void
      {
         if(disposed)
         {
            return;
         }
         this.var_528 = param2 as IRoomObjectVisualizationFactory;
         if(this.var_13 != null)
         {
            this.var_13.visualizationFactory = this.var_528;
         }
         this.initializeRoomManager();
      }
      
      private function onRoomManagerReady(param1:IID = null, param2:IUnknown = null) : void
      {
         if(disposed)
         {
            return;
         }
         this.var_46 = param2 as IRoomManager;
         if(this.var_46 != null)
         {
            this.var_46.addObjectUpdateCategory(RoomObjectCategoryEnum.OBJECT_CATEGORY_FURNITURE);
            this.var_46.addObjectUpdateCategory(RoomObjectCategoryEnum.const_27);
            this.var_46.addObjectUpdateCategory(RoomObjectCategoryEnum.OBJECT_CATEGORY_USER);
            this.var_46.addObjectUpdateCategory(RoomObjectCategoryEnum.const_306);
            this.var_46.addObjectUpdateCategory(RoomObjectCategoryEnum.const_79);
            this.var_46.setContentLoader(this.var_13);
         }
         this.initializeRoomManager();
      }
      
      private function onRendererFactoryReady(param1:IID = null, param2:IUnknown = null) : void
      {
         if(disposed)
         {
            return;
         }
         this.var_815 = param2 as IRoomRendererFactory;
         this.initializeRoomManager();
      }
      
      private function onCommunicationReady(param1:IID = null, param2:IUnknown = null) : void
      {
         if(disposed)
         {
            return;
         }
         this._communication = param2 as IHabboCommunicationManager;
         if(this._communication != null)
         {
            this._connection = this._communication.getHabboMainConnection(this.onConnectionReady);
            if(this._connection != null)
            {
               this.onConnectionReady(this._connection);
            }
         }
         this.initializeRoomManager();
      }
      
      private function onConnectionReady(param1:IConnection) : void
      {
         if(disposed)
         {
            return;
         }
         if(param1 != null)
         {
            this._connection = param1;
            if(this._roomMessageHandler != null)
            {
               this._roomMessageHandler.connection = param1;
            }
         }
      }
      
      private function onHabboConfigurationReady(param1:IID = null, param2:IUnknown = null) : void
      {
         if(disposed)
         {
            return;
         }
         this.var_153 = param2 as IHabboConfigurationManager;
         if(this.var_13 != null)
         {
            events.addEventListener(RoomContentLoader.const_613,this.onContentLoaderReady);
            this.var_13.initialize(events,this.var_153);
         }
         this.initializeRoomManager();
      }
      
      private function onContentLoaderReady(param1:Event) : void
      {
         if(param1 != null && param1.type == RoomContentLoader.const_613)
         {
            this.var_2031 = true;
            this.initializeRoomManager();
         }
      }
      
      private function onAdManagerReady(param1:IID = null, param2:IUnknown = null) : void
      {
         if(disposed)
         {
            return;
         }
         this.var_301 = param2 as IAdManager;
         this.var_301.events.addEventListener(AdEvent.const_443,this.showRoomAd);
      }
      
      private function onSessionDataManagerReady(param1:IID = null, param2:IUnknown = null) : void
      {
         if(disposed)
         {
            return;
         }
         this.var_405 = param2 as ISessionDataManager;
         this.var_13.sessionDataManager = this.var_405;
      }
      
      private function initializeObjectEvents() : void
      {
         if(this.var_24 != null)
         {
            if(this.var_24.events != null)
            {
               this.var_24.events.addEventListener(RoomObjectMouseEvent.const_231,this.roomObjectEventHandler);
               this.var_24.events.addEventListener(RoomObjectMouseEvent.const_493,this.roomObjectEventHandler);
               this.var_24.events.addEventListener(RoomObjectMouseEvent.const_562,this.roomObjectEventHandler);
               this.var_24.events.addEventListener(RoomObjectStateChangeEvent.const_143,this.roomObjectEventHandler);
               this.var_24.events.addEventListener(RoomObjectStateChangeEvent.const_622,this.roomObjectEventHandler);
               this.var_24.events.addEventListener(RoomObjectWidgetRequestEvent.const_136,this.roomObjectEventHandler);
               this.var_24.events.addEventListener(RoomObjectWidgetRequestEvent.const_131,this.roomObjectEventHandler);
               this.var_24.events.addEventListener(RoomObjectWidgetRequestEvent.ROOM_OBJECT_WIDGET_REQUEST_STICKIE,this.roomObjectEventHandler);
               this.var_24.events.addEventListener(RoomObjectWidgetRequestEvent.const_134,this.roomObjectEventHandler);
               this.var_24.events.addEventListener(RoomObjectWidgetRequestEvent.const_128,this.roomObjectEventHandler);
               this.var_24.events.addEventListener(RoomObjectWidgetRequestEvent.const_146,this.roomObjectEventHandler);
               this.var_24.events.addEventListener(RoomObjectWidgetRequestEvent.const_145,this.roomObjectEventHandler);
               this.var_24.events.addEventListener(RoomObjectWidgetRequestEvent.const_153,this.roomObjectEventHandler);
               this.var_24.events.addEventListener(RoomObjectWidgetRequestEvent.const_101,this.roomObjectEventHandler);
               this.var_24.events.addEventListener(RoomObjectWidgetRequestEvent.const_126,this.roomObjectEventHandler);
               this.var_24.events.addEventListener(RoomObjectFurnitureActionEvent.const_573,this.roomObjectEventHandler);
               this.var_24.events.addEventListener(RoomObjectFurnitureActionEvent.ROOM_OBJECT_DICE_OFF,this.roomObjectEventHandler);
               this.var_24.events.addEventListener(RoomObjectFurnitureActionEvent.const_442,this.roomObjectEventHandler);
               this.var_24.events.addEventListener(RoomObjectFurnitureActionEvent.const_434,this.roomObjectEventHandler);
               this.var_24.events.addEventListener(RoomObjectFurnitureActionEvent.const_559,this.roomObjectEventHandler);
               this.var_24.events.addEventListener(RoomObjectFurnitureActionEvent.const_455,this.roomObjectEventHandler);
               this.var_24.events.addEventListener(RoomObjectFurnitureActionEvent.const_447,this.roomObjectEventHandler);
               this.var_24.events.addEventListener(RoomObjectFurnitureActionEvent.ROOM_OBJECT_SOUND_MACHINE_START,this.roomObjectEventHandler);
               this.var_24.events.addEventListener(RoomObjectFurnitureActionEvent.const_553,this.roomObjectEventHandler);
               this.var_24.events.addEventListener(RoomObjectFurnitureActionEvent.const_572,this.roomObjectEventHandler);
               this.var_24.events.addEventListener(RoomObjectFurnitureActionEvent.const_489,this.roomObjectEventHandler);
               this.var_24.events.addEventListener(RoomObjectFurnitureActionEvent.const_478,this.roomObjectEventHandler);
               this.var_24.events.addEventListener(RoomObjectDimmerStateUpdateEvent.const_62,this.roomObjectEventHandler);
               this.var_24.events.addEventListener(RoomObjectMoveEvent.const_546,this.roomObjectEventHandler);
               this.var_24.events.addEventListener(RoomObjectMoveEvent.const_462,this.roomObjectEventHandler);
               this.var_24.events.addEventListener(RoomObjectRoomAdEvent.const_283,this.roomObjectEventHandler);
               this.var_24.events.addEventListener(RoomObjectRoomAdEvent.const_446,this.roomObjectEventHandler);
               this.var_24.events.addEventListener(RoomObjectRoomAdEvent.const_355,this.roomObjectEventHandler);
               this.var_24.events.addEventListener(RoomObjectRoomAdEvent.const_386,this.roomObjectEventHandler);
               this.var_24.events.addEventListener(RoomObjectRoomActionEvent.const_490,this.roomObjectEventHandler);
               this.var_24.events.addEventListener(RoomObjectRoomActionEvent.const_1200,this.roomObjectEventHandler);
               this.var_24.events.addEventListener(RoomObjectRoomActionEvent.const_477,this.roomObjectEventHandler);
            }
         }
      }
      
      private function initializeRoomManager() : void
      {
         if(this.var_24 == null || this.var_528 == null || this.var_46 == null || this.var_815 == null || this._communication == null || this.var_153 == null || !this.var_2031)
         {
            return;
         }
         this.var_46.initialize(<nothing/>,this);
      }
      
      public function roomManagerInitialized(param1:Boolean = true) : void
      {
         var _loc2_:int = 0;
         var _loc3_:* = null;
         if(param1)
         {
            this.var_453 = true;
            events.dispatchEvent(new RoomEngineEvent(RoomEngineEvent.const_717,0,0));
            _loc2_ = 0;
            while(_loc2_ < this.var_320.length)
            {
               _loc3_ = this.var_320.getWithIndex(_loc2_) as RoomData;
               if(_loc3_ != null)
               {
                  this.initializeRoom(_loc3_.roomId,_loc3_.roomCategory,_loc3_.data);
               }
               _loc2_++;
            }
         }
      }
      
      public function setActiveRoom(param1:int, param2:int) : void
      {
         this.var_96 = param1;
         this.var_97 = param2;
      }
      
      public function getRoomIdentifier(param1:int, param2:int) : String
      {
         return "hard_coded_room_id";
      }
      
      private function getRoomId(param1:String) : int
      {
         return 1;
      }
      
      private function getRoomCategory(param1:String) : int
      {
         return 1;
      }
      
      public function isPublicRoom(param1:int, param2:int) : Boolean
      {
         return this.isPublicRoomWorldType(this.getWorldType(param1,param2));
      }
      
      public function getRoomNumberValue(param1:int, param2:int, param3:String) : Number
      {
         var _loc4_:IRoomInstance = this.getRoom(param1,param2);
         if(_loc4_ != null)
         {
            return _loc4_.getNumber(param3);
         }
         return NaN;
      }
      
      public function getRoomStringValue(param1:int, param2:int, param3:String) : String
      {
         var _loc4_:IRoomInstance = this.getRoom(param1,param2);
         if(_loc4_ != null)
         {
            return _loc4_.getString(param3);
         }
         return null;
      }
      
      public function setIsPlayingGame(param1:int, param2:int, param3:Boolean) : void
      {
         var _loc5_:int = 0;
         var _loc4_:IRoomInstance = this.getRoom(param1,param2);
         if(_loc4_ != null)
         {
            _loc5_ = !!param3 ? 1 : 0;
            _loc4_.setNumber(RoomVariableEnum.const_1162,_loc5_);
            if(_loc5_ == 0)
            {
               events.dispatchEvent(new RoomEngineEvent(RoomEngineEvent.const_519,param1,param2));
            }
            else
            {
               events.dispatchEvent(new RoomEngineEvent(RoomEngineEvent.const_581,param1,param2));
            }
         }
      }
      
      public function getIsPlayingGame(param1:int, param2:int) : Boolean
      {
         var _loc4_:Number = NaN;
         var _loc3_:IRoomInstance = this.getRoom(param1,param2);
         if(_loc3_ != null)
         {
            _loc4_ = _loc3_.getNumber(RoomVariableEnum.const_1162);
            if(_loc4_ > 0)
            {
               return true;
            }
         }
         return false;
      }
      
      public function getRoom(param1:int, param2:int) : IRoomInstance
      {
         if(!this.var_453)
         {
            return null;
         }
         var _loc3_:String = this.getRoomIdentifier(param1,param2);
         return this.var_46.getRoom(_loc3_);
      }
      
      public function initializeRoom(param1:int, param2:int, param3:XML) : void
      {
         var _loc4_:String = this.getRoomIdentifier(param1,param2);
         var _loc5_:* = null;
         var _loc6_:String = "111";
         var _loc7_:String = "201";
         var _loc8_:String = "1";
         if(!this.var_453)
         {
            _loc5_ = this.var_320.remove(_loc4_);
            if(_loc5_ != null)
            {
               _loc6_ = _loc5_.floorType;
               _loc7_ = _loc5_.wallType;
               _loc8_ = _loc5_.landscapeType;
            }
            _loc5_ = new RoomData(param1,param2,param3);
            _loc5_.floorType = _loc6_;
            _loc5_.wallType = _loc7_;
            _loc5_.landscapeType = _loc8_;
            this.var_320.add(_loc4_,_loc5_);
            Logger.log("Room Engine not initilized yet, can not create room. Room data stored for later initialization.");
            return;
         }
         if(param3 == null)
         {
            Logger.log("Room property messages received before floor height map, will initialize when floor height map received.");
            return;
         }
         _loc5_ = this.var_320.remove(_loc4_);
         if(_loc5_ != null)
         {
            if(_loc5_.floorType != null && _loc5_.floorType.length > 0)
            {
               _loc6_ = _loc5_.floorType;
            }
            if(_loc5_.wallType != null && _loc5_.wallType.length > 0)
            {
               _loc7_ = _loc5_.wallType;
            }
            if(_loc5_.landscapeType != null && _loc5_.landscapeType.length > 0)
            {
               _loc8_ = _loc5_.landscapeType;
            }
         }
         var _loc9_:IRoomInstance = this.createRoom(_loc4_,param3,_loc6_,_loc7_,_loc8_,this.getWorldType(param1,param2));
         if(_loc9_ == null)
         {
            return;
         }
         events.dispatchEvent(new RoomEngineEvent(RoomEngineEvent.const_766,param1,param2));
      }
      
      private function createRoom(param1:String, param2:XML, param3:String, param4:String, param5:String, param6:String) : IRoomInstance
      {
         var _loc12_:* = null;
         var _loc13_:int = 0;
         var _loc14_:int = 0;
         var _loc15_:* = null;
         var _loc16_:Number = NaN;
         var _loc17_:Number = NaN;
         var _loc18_:Number = NaN;
         var _loc19_:Number = NaN;
         var _loc20_:* = null;
         var _loc21_:* = null;
         var _loc22_:* = null;
         var _loc23_:int = 0;
         var _loc24_:* = null;
         var _loc25_:Number = NaN;
         var _loc26_:Number = NaN;
         var _loc27_:Number = NaN;
         var _loc28_:Number = NaN;
         var _loc29_:* = null;
         var _loc30_:* = null;
         var _loc31_:* = null;
         if(!this.var_453)
         {
            return null;
         }
         var _loc7_:IRoomInstance = this.var_46.createRoom(param1,param2);
         if(_loc7_ == null)
         {
            return null;
         }
         var _loc8_:int = 0;
         var _loc9_:* = null;
         var _loc10_:* = 1;
         if(this.isPublicRoomWorldType(param6))
         {
            _loc12_ = this.var_13.getPublicRoomContentType(param6);
            _loc9_ = _loc7_.createRoomObject(const_327,_loc12_,_loc8_) as IRoomObjectController;
            _loc9_.getModelController().setString(RoomObjectVariableEnum.const_1000,param6,true);
            _loc7_.setNumber(RoomVariableEnum.const_647,1,true);
            _loc13_ = parseInt(this.var_153.getKey("ads.billboard.displayDelayMillis","1000"));
            _loc9_.getModelController().setNumber(RoomVariableEnum.const_974,_loc13_,true);
            if(this.var_13 != null)
            {
               _loc10_ = Number(this.var_13.getPublicRoomWorldHeightScale(param6));
            }
         }
         else
         {
            _loc9_ = _loc7_.createRoomObject(const_327,const_584,_loc8_) as IRoomObjectController;
            _loc7_.setNumber(RoomVariableEnum.const_647,0,true);
         }
         _loc7_.setNumber(RoomVariableEnum.const_657,_loc10_,true);
         if(param2 != null)
         {
            _loc14_ = 0;
            if(param2.dimensions.length() == 1)
            {
               _loc15_ = param2.dimensions[0];
               _loc16_ = Number(_loc15_.@minX);
               _loc17_ = Number(_loc15_.@maxX);
               _loc18_ = Number(_loc15_.@minY);
               _loc19_ = Number(_loc15_.@maxY);
               _loc7_.setNumber(RoomVariableEnum.const_763,_loc16_);
               _loc7_.setNumber(RoomVariableEnum.const_832,_loc17_);
               _loc7_.setNumber(RoomVariableEnum.const_884,_loc18_);
               _loc7_.setNumber(RoomVariableEnum.const_728,_loc19_);
               _loc14_ += _loc16_ * 423 + _loc17_ * 671 + _loc18_ * 913 + _loc19_ * 7509;
               if(_loc9_ != null && _loc9_.getModelController() != null)
               {
                  _loc9_.getModelController().setNumber(RoomObjectVariableEnum.const_1018,_loc14_,true);
               }
            }
         }
         if(_loc9_ != null && _loc9_.getEventHandler() != null)
         {
            _loc9_.getEventHandler().initialize(param2);
         }
         var _loc11_:* = null;
         if(param3 != null)
         {
            _loc11_ = new RoomObjectRoomUpdateMessage(RoomObjectRoomUpdateMessage.const_793,param3);
            _loc9_.getEventHandler().processUpdateMessage(_loc11_);
         }
         if(param4 != null)
         {
            _loc11_ = new RoomObjectRoomUpdateMessage(RoomObjectRoomUpdateMessage.const_778,param4);
            _loc9_.getEventHandler().processUpdateMessage(_loc11_);
         }
         if(param5 != null)
         {
            _loc11_ = new RoomObjectRoomUpdateMessage(RoomObjectRoomUpdateMessage.const_727,param5);
            _loc9_.getEventHandler().processUpdateMessage(_loc11_);
         }
         if(param2 != null)
         {
            if(param2.doors.door.length() > 0)
            {
               _loc20_ = param2.doors.door;
               _loc21_ = ["x","y","z","dir"];
               _loc22_ = null;
               _loc23_ = 0;
               while(_loc23_ < _loc20_.length())
               {
                  _loc24_ = _loc20_[_loc23_];
                  if(XMLValidator.checkRequiredAttributes(_loc24_,_loc21_))
                  {
                     _loc25_ = Number(_loc24_.@x);
                     _loc26_ = Number(_loc24_.@y);
                     _loc27_ = Number(_loc24_.@z);
                     _loc28_ = Number(_loc24_.@dir);
                     _loc29_ = "null";
                     _loc30_ = "door_" + _loc23_;
                     _loc31_ = new Vector3d(_loc25_,_loc26_,_loc27_);
                     _loc22_ = new RoomObjectRoomMaskUpdateMessage(RoomObjectRoomMaskUpdateMessage.const_547,_loc30_,_loc29_,_loc31_,RoomObjectRoomMaskUpdateMessage.const_238);
                     _loc9_.getEventHandler().processUpdateMessage(_loc22_);
                     if(_loc28_ == 90 || _loc28_ == 180)
                     {
                        if(_loc28_ == 90)
                        {
                           _loc7_.setNumber(RoomObjectVariableEnum.const_715,_loc25_ - 0.5,true);
                           _loc7_.setNumber(RoomObjectVariableEnum.const_897,_loc26_,true);
                        }
                        if(_loc28_ == 180)
                        {
                           _loc7_.setNumber(RoomObjectVariableEnum.const_715,_loc25_,true);
                           _loc7_.setNumber(RoomObjectVariableEnum.const_897,_loc26_ - 0.5,true);
                        }
                        _loc7_.setNumber(RoomObjectVariableEnum.const_989,_loc27_,true);
                        _loc7_.setNumber(RoomObjectVariableEnum.const_1119,_loc28_,true);
                     }
                  }
                  _loc23_++;
               }
            }
         }
         _loc7_.createRoomObject(const_905,const_1225,RoomObjectCategoryEnum.const_306);
         if(this.var_153.getKey("avatar.widget.enabled","0") == "0")
         {
            _loc7_.createRoomObject(const_907,const_1226,RoomObjectCategoryEnum.const_306);
         }
         return _loc7_;
      }
      
      public function getObjectRoom(param1:int, param2:int) : IRoomObjectController
      {
         return this.getObject(this.getRoomIdentifier(param1,param2),const_327,RoomObjectCategoryEnum.const_79);
      }
      
      public function updateObjectRoom(param1:int, param2:int, param3:String = null, param4:String = null, param5:String = null) : Boolean
      {
         var _loc8_:* = null;
         var _loc9_:* = null;
         var _loc6_:IRoomObjectController = this.getObjectRoom(param1,param2);
         if(_loc6_ == null)
         {
            _loc8_ = this.getRoomIdentifier(param1,param2);
            _loc9_ = this.var_320.getValue(_loc8_);
            if(_loc9_ == null)
            {
               _loc9_ = new RoomData(param1,param2,null);
               this.var_320.add(_loc8_,_loc9_);
            }
            if(param3 != null)
            {
               _loc9_.floorType = param3;
            }
            if(param4 != null)
            {
               _loc9_.wallType = param4;
            }
            if(param5 != null)
            {
               _loc9_.landscapeType = param5;
            }
            return true;
         }
         if(_loc6_.getEventHandler() == null)
         {
            return false;
         }
         var _loc7_:* = null;
         if(param3 != null)
         {
            _loc7_ = new RoomObjectRoomUpdateMessage(RoomObjectRoomUpdateMessage.const_793,param3);
            _loc6_.getEventHandler().processUpdateMessage(_loc7_);
         }
         if(param4 != null)
         {
            _loc7_ = new RoomObjectRoomUpdateMessage(RoomObjectRoomUpdateMessage.const_778,param4);
            _loc6_.getEventHandler().processUpdateMessage(_loc7_);
         }
         if(param5 != null)
         {
            _loc7_ = new RoomObjectRoomUpdateMessage(RoomObjectRoomUpdateMessage.const_727,param5);
            _loc6_.getEventHandler().processUpdateMessage(_loc7_);
         }
         return true;
      }
      
      public function updateObjectRoomColor(param1:int, param2:int, param3:uint, param4:int, param5:Boolean) : Boolean
      {
         var _loc6_:IRoomObjectController = this.getObjectRoom(param1,param2);
         if(_loc6_ == null || _loc6_.getEventHandler() == null)
         {
            return false;
         }
         var _loc7_:* = null;
         _loc7_ = new RoomObjectRoomColorUpdateMessage(RoomObjectRoomColorUpdateMessage.const_1481,param3,param4,param5);
         _loc6_.getEventHandler().processUpdateMessage(_loc7_);
         events.dispatchEvent(new RoomEngineRoomColorEvent(param1,param2,param3,param4,param5));
         return true;
      }
      
      public function updateObjectRoomVisibilities(param1:int, param2:int, param3:Boolean, param4:Boolean = true) : Boolean
      {
         var _loc5_:IRoomObjectController = this.getObjectRoom(param1,param2);
         if(_loc5_ == null || _loc5_.getEventHandler() == null)
         {
            return false;
         }
         var _loc6_:* = null;
         _loc6_ = new RoomObjectRoomPlaneVisibilityUpdateMessage(RoomObjectRoomPlaneVisibilityUpdateMessage.const_1126,param3);
         _loc5_.getEventHandler().processUpdateMessage(_loc6_);
         _loc6_ = new RoomObjectRoomPlaneVisibilityUpdateMessage(RoomObjectRoomPlaneVisibilityUpdateMessage.const_1208,param4);
         _loc5_.getEventHandler().processUpdateMessage(_loc6_);
         return true;
      }
      
      public function disposeRoom(param1:int, param2:int) : void
      {
         var _loc3_:String = this.getRoomIdentifier(param1,param2);
         this.var_46.disposeRoom(_loc3_);
         var _loc4_:RoomInstanceData = this.var_319.remove(_loc3_);
         if(_loc4_ != null)
         {
            _loc4_.dispose();
         }
         events.dispatchEvent(new RoomEngineEvent(RoomEngineEvent.const_666,param1,param2));
      }
      
      public function setOwnUserId(param1:int, param2:int, param3:int) : void
      {
         var _loc4_:RoomCamera = this.getRoomCamera(param1,param2);
         if(_loc4_ != null)
         {
            _loc4_.targetId = param3;
            _loc4_.targetCategory = RoomObjectCategoryEnum.OBJECT_CATEGORY_USER;
         }
      }
      
      public function createRoomCanvas(param1:int, param2:int, param3:int, param4:int, param5:int, param6:int) : DisplayObject
      {
         var _loc12_:* = null;
         var _loc13_:Number = NaN;
         var _loc14_:Number = NaN;
         var _loc15_:Number = NaN;
         var _loc16_:Number = NaN;
         var _loc17_:* = null;
         var _loc18_:* = null;
         var _loc19_:* = null;
         var _loc7_:String = this.getRoomIdentifier(param1,param2);
         var _loc8_:IRoomInstance = this.var_46.getRoom(_loc7_);
         if(_loc8_ == null)
         {
            return null;
         }
         var _loc9_:IRoomRenderer = _loc8_.getRenderer() as IRoomRenderer;
         if(_loc9_ == null)
         {
            _loc9_ = this.var_815.createRenderer();
         }
         if(_loc9_ == null)
         {
            return null;
         }
         _loc9_.roomObjectVariableAccurateZ = RoomObjectVariableEnum.const_1185;
         _loc8_.setRenderer(_loc9_);
         var _loc10_:IRoomRenderingCanvas = _loc9_.createCanvas(param3,param4,param5,param6);
         if(_loc10_ == null)
         {
            return null;
         }
         _loc10_.mouseListener = this.var_71;
         if(_loc10_.geometry != null)
         {
            _loc12_ = this.getWorldType(param1,param2);
            if(this.isPublicRoomWorldType(_loc12_))
            {
               if(this.var_13 != null)
               {
                  if(this.var_13.getPublicRoomWorldSize(_loc12_) != 64)
                  {
                     _loc10_.geometry.performZoomOut();
                  }
               }
            }
            _loc10_.geometry.z_scale = _loc8_.getNumber(RoomVariableEnum.const_657);
         }
         if(_loc10_.geometry != null)
         {
            _loc13_ = _loc8_.getNumber(RoomObjectVariableEnum.const_715);
            _loc14_ = _loc8_.getNumber(RoomObjectVariableEnum.const_897);
            _loc15_ = _loc8_.getNumber(RoomObjectVariableEnum.const_989);
            _loc16_ = _loc8_.getNumber(RoomObjectVariableEnum.const_1119);
            _loc17_ = new Vector3d(_loc13_,_loc14_,_loc15_);
            _loc18_ = null;
            if(_loc16_ == 90)
            {
               _loc18_ = new Vector3d(-1000,0,0);
            }
            if(_loc16_ == 180)
            {
               _loc18_ = new Vector3d(0,-1000,0);
            }
            _loc10_.geometry.setDisplacement(_loc17_,_loc18_);
         }
         var _loc11_:Sprite = _loc10_.displayObject as Sprite;
         if(_loc11_ != null)
         {
            _loc19_ = new Sprite();
            _loc19_.name = const_906;
            _loc19_.mouseEnabled = false;
            _loc11_.addChild(_loc19_);
         }
         return _loc11_;
      }
      
      private function getRoomCanvas(param1:int, param2:int, param3:int) : IRoomRenderingCanvas
      {
         var _loc4_:String = this.getRoomIdentifier(param1,param2);
         var _loc5_:IRoomInstance = this.var_46.getRoom(_loc4_);
         if(_loc5_ == null)
         {
            return null;
         }
         var _loc6_:IRoomRenderer = _loc5_.getRenderer() as IRoomRenderer;
         if(_loc6_ == null)
         {
            return null;
         }
         return _loc6_.getCanvas(param3);
      }
      
      public function modifyRoomCanvas(param1:int, param2:int, param3:int, param4:int, param5:int) : Boolean
      {
         var _loc6_:IRoomRenderingCanvas = this.getRoomCanvas(param1,param2,param3);
         if(_loc6_ == null)
         {
            return false;
         }
         _loc6_.initialize(param4,param5);
         return true;
      }
      
      public function setRoomCanvasMask(param1:int, param2:int, param3:int, param4:Boolean) : void
      {
         var _loc5_:IRoomRenderingCanvas = this.getRoomCanvas(param1,param2,param3);
         if(_loc5_ == null)
         {
            return;
         }
         _loc5_.useMask = param4;
      }
      
      private function getRoomCanvasRectangle(param1:int, param2:int, param3:int) : Rectangle
      {
         var _loc4_:IRoomRenderingCanvas = this.getRoomCanvas(param1,param2,param3);
         if(_loc4_ == null)
         {
            return null;
         }
         return new Rectangle(0,0,_loc4_.width,_loc4_.height);
      }
      
      public function getRoomCanvasGeometry(param1:int, param2:int, param3:int) : IRoomGeometry
      {
         var _loc4_:IRoomRenderingCanvas = this.getRoomCanvas(param1,param2,param3);
         if(_loc4_ == null)
         {
            return null;
         }
         return _loc4_.geometry;
      }
      
      public function getRoomCanvasScreenOffset(param1:int, param2:int, param3:int) : Point
      {
         var _loc4_:IRoomRenderingCanvas = this.getRoomCanvas(param1,param2,param3);
         if(_loc4_ == null)
         {
            return null;
         }
         return new Point(_loc4_.screenOffsetX,_loc4_.screenOffsetY);
      }
      
      private function handleRoomDragging(param1:IRoomRenderingCanvas, param2:int, param3:int, param4:String, param5:Boolean, param6:Boolean, param7:Boolean) : Boolean
      {
         var _loc8_:int = param2 - this.var_1253;
         var _loc9_:int = param3 - this.var_1251;
         if(param4 == MouseEvent.MOUSE_DOWN)
         {
            if(!param5 && !param6 && !param7)
            {
               this.var_1012 = true;
               this.var_814 = false;
               this.var_2029 = this.var_1253;
               this.var_2030 = this.var_1251;
            }
         }
         else if(param4 == MouseEvent.MOUSE_UP)
         {
            if(this.var_1012)
            {
               this.var_1012 = false;
            }
         }
         else if(param4 == MouseEvent.MOUSE_MOVE)
         {
            if(this.var_1012)
            {
               if(!this.var_814)
               {
                  _loc8_ = param2 - this.var_2029;
                  _loc9_ = param3 - this.var_2030;
                  if(_loc8_ <= -const_412 || _loc8_ >= const_412 || _loc9_ <= -const_412 || _loc9_ >= const_412)
                  {
                     this.var_814 = true;
                  }
                  _loc8_ = 0;
                  _loc9_ = 0;
               }
               if(_loc8_ != 0 || _loc9_ != 0)
               {
                  param1.screenOffsetX += _loc8_;
                  param1.screenOffsetY += _loc9_;
                  this.var_814 = true;
               }
            }
         }
         else if(param4 == MouseEvent.CLICK)
         {
            if(this.var_814)
            {
               this.var_814 = false;
               return true;
            }
         }
         return false;
      }
      
      public function handleRoomCanvasMouseEvent(param1:int, param2:int, param3:int, param4:String, param5:Boolean, param6:Boolean, param7:Boolean, param8:Boolean) : void
      {
         var _loc10_:* = null;
         var _loc11_:* = null;
         var _loc12_:* = null;
         var _loc13_:* = null;
         var _loc14_:* = null;
         var _loc9_:IRoomRenderingCanvas = this.getRoomCanvas(this.var_96,this.var_97,param1);
         if(_loc9_ != null)
         {
            _loc10_ = this.getOverlaySprite(_loc9_);
            _loc11_ = this.getOverlayIconSprite(_loc10_,const_326);
            if(_loc11_ != null)
            {
               _loc12_ = _loc11_.getRect(_loc11_);
               _loc11_.x = param2 - _loc12_.width / 2;
               _loc11_.y = param3 - _loc12_.height / 2;
            }
            if(!this.handleRoomDragging(_loc9_,param2,param3,param4,param5,param6,param7))
            {
               if(!_loc9_.handleMouseEvent(param2,param3,param4,param5,param6,param7,param8))
               {
                  _loc13_ = "";
                  if(param4 == MouseEvent.CLICK)
                  {
                     if(events != null)
                     {
                        events.dispatchEvent(new RoomEngineObjectEvent(RoomEngineObjectEvent.const_433,this.var_96,this.var_97,-1,RoomObjectCategoryEnum.const_168));
                     }
                     _loc13_ = "null";
                  }
                  else if(param4 == MouseEvent.MOUSE_MOVE)
                  {
                     _loc13_ = "null";
                  }
                  else if(param4 == MouseEvent.MOUSE_DOWN)
                  {
                     _loc13_ = "null";
                  }
                  if(this.var_71 != null)
                  {
                     _loc14_ = new RoomObjectMouseEvent(_loc13_,null,const_327,const_584);
                     this.var_71.handleRoomObjectEvent(_loc14_,this.var_96,this.var_97);
                  }
               }
            }
            this.var_1252 = param1;
            this.var_1253 = param2;
            this.var_1251 = param3;
         }
      }
      
      private function getOverlaySprite(param1:IRoomRenderingCanvas) : Sprite
      {
         if(param1 == null)
         {
            return null;
         }
         var _loc2_:Sprite = param1.displayObject as Sprite;
         if(_loc2_ == null)
         {
            return null;
         }
         return _loc2_.getChildByName(const_906) as Sprite;
      }
      
      private function addOverlayIconSprite(param1:Sprite, param2:String, param3:BitmapData) : Sprite
      {
         if(param1 == null || param3 == null)
         {
            return null;
         }
         var _loc4_:Sprite = this.getOverlayIconSprite(param1,param2);
         if(_loc4_ != null)
         {
            return null;
         }
         _loc4_ = new Sprite();
         _loc4_.name = param2;
         _loc4_.mouseEnabled = false;
         var _loc5_:Bitmap = new Bitmap(param3);
         _loc4_.addChild(_loc5_);
         param1.addChild(_loc4_);
         return _loc4_;
      }
      
      private function removeOverlayIconSprite(param1:Sprite, param2:String) : Boolean
      {
         var _loc4_:* = null;
         var _loc5_:* = null;
         if(param1 == null)
         {
            return false;
         }
         var _loc3_:int = param1.numChildren - 1;
         while(_loc3_ >= 0)
         {
            _loc4_ = param1.getChildAt(_loc3_) as Sprite;
            if(_loc4_ != null)
            {
               if(_loc4_.name == param2)
               {
                  param1.removeChildAt(_loc3_);
                  _loc5_ = _loc4_.getChildAt(0) as Bitmap;
                  if(_loc5_ != null && _loc5_.bitmapData != null)
                  {
                     _loc5_.bitmapData.dispose();
                     _loc5_.bitmapData = null;
                  }
                  return true;
               }
            }
            _loc3_--;
         }
         return false;
      }
      
      private function getOverlayIconSprite(param1:Sprite, param2:String) : Sprite
      {
         var _loc4_:* = null;
         if(param1 == null)
         {
            return null;
         }
         var _loc3_:int = param1.numChildren - 1;
         while(_loc3_ >= 0)
         {
            _loc4_ = param1.getChildAt(_loc3_) as Sprite;
            if(_loc4_ != null)
            {
               if(_loc4_.name == param2)
               {
                  return _loc4_;
               }
            }
            _loc3_--;
         }
         return null;
      }
      
      public function setObjectMoverIconSprite(param1:int, param2:int, param3:Boolean, param4:String = null) : void
      {
         var _loc7_:* = null;
         var _loc8_:int = 0;
         var _loc9_:* = null;
         var _loc10_:* = null;
         var _loc5_:* = null;
         if(param3)
         {
            _loc5_ = this.getRoomObjectImage(this.var_96,this.var_97,param1,param2,new Vector3d(),1,null);
         }
         else if(this.var_13 != null)
         {
            _loc7_ = null;
            _loc8_ = 0;
            if(param2 == RoomObjectCategoryEnum.OBJECT_CATEGORY_FURNITURE)
            {
               _loc7_ = this.var_13.getActiveObjectType(param1);
               _loc8_ = this.var_13.getActiveObjectColorIndex(param1);
            }
            else if(param2 == RoomObjectCategoryEnum.const_27)
            {
               _loc7_ = this.var_13.getWallItemType(param1,param4);
               _loc8_ = this.var_13.getWallItemColorIndex(param1);
            }
            if(param2 == RoomObjectCategoryEnum.OBJECT_CATEGORY_USER)
            {
               _loc7_ = this.getUserType(param1);
               if(_loc7_ == "pet")
               {
                  _loc7_ = this.getPetType(param4);
               }
               _loc5_ = this.getGenericRoomObjectImage(_loc7_,param4,new Vector3d(180),1,null);
            }
            else
            {
               _loc5_ = this.getGenericRoomObjectImage(_loc7_,String(_loc8_),new Vector3d(),1,null,0,param4);
            }
         }
         if(_loc5_ == null || _loc5_.data == null)
         {
            return;
         }
         var _loc6_:IRoomRenderingCanvas = this.getRoomCanvas(this.var_96,this.var_97,this.var_1252);
         if(_loc6_ != null)
         {
            _loc9_ = this.getOverlaySprite(_loc6_);
            this.removeOverlayIconSprite(_loc9_,const_326);
            _loc10_ = this.addOverlayIconSprite(_loc9_,const_326,_loc5_.data);
            if(_loc10_ != null)
            {
               _loc10_.x = this.var_1253 - _loc5_.data.width / 2;
               _loc10_.y = this.var_1251 - _loc5_.data.height / 2;
            }
         }
      }
      
      public function setObjectMoverIconSpriteVisible(param1:Boolean) : void
      {
         var _loc3_:* = null;
         var _loc4_:* = null;
         var _loc2_:IRoomRenderingCanvas = this.getRoomCanvas(this.var_96,this.var_97,this.var_1252);
         if(_loc2_ != null)
         {
            _loc3_ = this.getOverlaySprite(_loc2_);
            _loc4_ = this.getOverlayIconSprite(_loc3_,const_326);
            if(_loc4_ != null)
            {
               _loc4_.visible = param1;
            }
         }
      }
      
      public function removeObjectMoverIconSprite() : void
      {
         var _loc2_:* = null;
         var _loc1_:IRoomRenderingCanvas = this.getRoomCanvas(this.var_96,this.var_97,this.var_1252);
         if(_loc1_ != null)
         {
            _loc2_ = this.getOverlaySprite(_loc1_);
            this.removeOverlayIconSprite(_loc2_,const_326);
         }
      }
      
      public function getRoomObjectCount(param1:int, param2:int, param3:int) : int
      {
         if(!this.var_453)
         {
            return 0;
         }
         var _loc4_:String = this.getRoomIdentifier(param1,param2);
         var _loc5_:IRoomInstance = this.var_46.getRoom(_loc4_);
         if(_loc5_ == null)
         {
            return 0;
         }
         return _loc5_.getObjectCount(param3);
      }
      
      public function getRoomObject(param1:int, param2:int, param3:int, param4:int) : IRoomObject
      {
         if(!this.var_453)
         {
            return null;
         }
         var _loc5_:String = this.getRoomIdentifier(param1,param2);
         var _loc6_:IRoomInstance = this.var_46.getRoom(_loc5_);
         if(_loc6_ == null)
         {
            return null;
         }
         return _loc6_.getObject(param3,param4);
      }
      
      public function getRoomObjectWithIndex(param1:int, param2:int, param3:int, param4:int) : IRoomObject
      {
         if(!this.var_453)
         {
            return null;
         }
         var _loc5_:String = this.getRoomIdentifier(param1,param2);
         var _loc6_:IRoomInstance = this.var_46.getRoom(_loc5_);
         if(_loc6_ == null)
         {
            return null;
         }
         return _loc6_.getObjectWithIndex(param3,param4);
      }
      
      public function modifyRoomObject(param1:int, param2:int, param3:String) : Boolean
      {
         if(this.var_71 != null)
         {
            return this.var_71.modifyRoomObject(this.var_96,this.var_97,param1,param2,param3);
         }
         return false;
      }
      
      public function modifyRoomObjectData(param1:int, param2:int, param3:String) : Boolean
      {
         if(this.var_71 != null)
         {
            if(param2 == RoomObjectCategoryEnum.const_27)
            {
               return this.var_71.modifyWallItemData(this.var_96,this.var_97,param1,param3);
            }
         }
         return false;
      }
      
      public function deleteRoomObject(param1:int, param2:int) : Boolean
      {
         if(this.var_71 != null)
         {
            if(param2 == RoomObjectCategoryEnum.const_27)
            {
               return this.var_71.deleteWallItem(this.var_96,this.var_97,param1);
            }
         }
         return false;
      }
      
      public function initializeRoomObjectInsert(param1:int, param2:int, param3:int, param4:String = null) : Boolean
      {
         var _loc5_:IRoomInstance = this.getRoom(this.var_96,this.var_97);
         if(_loc5_ == null || _loc5_.getNumber(RoomVariableEnum.const_647) != 0)
         {
            return false;
         }
         if(this.var_71 != null)
         {
            return this.var_71.initializeRoomObjectInsert(this.var_96,this.var_97,param1,param2,param3,param4);
         }
         return false;
      }
      
      public function cancelRoomObjectInsert() : void
      {
         if(this.var_71 != null)
         {
            this.var_71.cancelRoomObjectInsert(this.var_96,this.var_97);
         }
      }
      
      private function getRoomObjectAdURL(param1:String) : String
      {
         if(this.var_13 != null)
         {
            return this.var_13.getRoomObjectAdURL(param1);
         }
         return "";
      }
      
      public function setRoomObjectAlias(param1:String, param2:String) : void
      {
         if(this.var_13 != null)
         {
            this.var_13.setRoomObjectAlias(param1,param2);
         }
      }
      
      public function getRoomObjectCategory(param1:String) : int
      {
         if(this.var_13 != null)
         {
            return this.var_13.getObjectCategory(param1);
         }
         return RoomObjectCategoryEnum.const_168;
      }
      
      private function getFurnitureType(param1:int) : String
      {
         if(this.var_13 != null)
         {
            return this.var_13.getActiveObjectType(param1);
         }
         return "";
      }
      
      private function getWallItemType(param1:int, param2:String = null) : String
      {
         if(this.var_13 != null)
         {
            return this.var_13.getWallItemType(param1,param2);
         }
         return "";
      }
      
      private function getUserType(param1:int) : String
      {
         switch(param1)
         {
            case 1:
               return "user";
            case 2:
               return "pet";
            case 3:
               return "bot";
            default:
               return null;
         }
      }
      
      private function getPetType(param1:String) : String
      {
         var _loc2_:* = null;
         var _loc3_:int = 0;
         if(param1 != null)
         {
            _loc2_ = param1.split(" ");
            if(_loc2_.length > 1)
            {
               _loc3_ = parseInt(_loc2_[0]);
               if(_loc3_ >= 8)
               {
                  if(this.var_13 != null)
                  {
                     return this.var_13.getPetType(_loc3_);
                  }
               }
               return "pet";
            }
         }
         return null;
      }
      
      public function getPetColor(param1:int, param2:int) : PetColorResult
      {
         if(this.var_13 != null)
         {
            return this.var_13.getPetColor(param1,param2);
         }
         return null;
      }
      
      private function getFurnitureColorIndex(param1:int) : int
      {
         if(this.var_13 != null)
         {
            return this.var_13.getActiveObjectColorIndex(param1);
         }
         return 0;
      }
      
      private function getWallItemColorIndex(param1:int) : int
      {
         if(this.var_13 != null)
         {
            return this.var_13.getWallItemColorIndex(param1);
         }
         return 0;
      }
      
      public function getSelectionArrow(param1:int, param2:int) : IRoomObjectController
      {
         return this.getObject(this.getRoomIdentifier(param1,param2),const_907,RoomObjectCategoryEnum.const_306);
      }
      
      public function getTileCursor(param1:int, param2:int) : IRoomObjectController
      {
         return this.getObject(this.getRoomIdentifier(param1,param2),const_905,RoomObjectCategoryEnum.const_306);
      }
      
      public function addObjectFurniture(param1:int, param2:int, param3:int, param4:int, param5:IVector3d, param6:IVector3d, param7:int, param8:String, param9:Number = NaN, param10:int = -1) : Boolean
      {
         var _loc11_:String = this.getFurnitureType(param4);
         var _loc12_:int = this.getFurnitureColorIndex(param4);
         var _loc13_:String = this.getRoomObjectAdURL(_loc11_);
         if(_loc11_ == null)
         {
            _loc11_ = "";
         }
         var _loc14_:IRoomObjectController = this.createObjectFurniture(param1,param2,param3,_loc11_);
         if(_loc14_ == null)
         {
            return false;
         }
         if(_loc14_ != null && _loc14_.getModelController() != null)
         {
            _loc14_.getModelController().setNumber(RoomObjectVariableEnum.const_229,_loc12_,true);
            _loc14_.getModelController().setNumber(RoomObjectVariableEnum.const_400,param4,true);
            _loc14_.getModelController().setString(RoomObjectVariableEnum.const_332,_loc13_,true);
            _loc14_.getModelController().setNumber(RoomObjectVariableEnum.const_1039,1,true);
            _loc14_.getModelController().setNumber(RoomObjectVariableEnum.const_1114,param10);
            _loc14_.getModelController().setNumber(RoomObjectVariableEnum.const_1096,getTimer());
         }
         if(!this.updateObjectFurniture(param1,param2,param3,param5,param6,param7,param8,param9))
         {
            return false;
         }
         if(events != null)
         {
            events.dispatchEvent(new RoomEngineObjectEvent(RoomEngineObjectEvent.const_318,param1,param2,param3,RoomObjectCategoryEnum.OBJECT_CATEGORY_FURNITURE));
         }
         var _loc15_:ISelectedRoomObjectData = this.getPlacedObjectData(param1,param2);
         if(_loc15_ && Math.abs(_loc15_.id) == param3 && _loc15_.category == RoomObjectCategoryEnum.OBJECT_CATEGORY_FURNITURE)
         {
            this.selectRoomObject(param1,param2,param3,RoomObjectCategoryEnum.OBJECT_CATEGORY_FURNITURE);
         }
         return true;
      }
      
      public function addObjectFurnitureByName(param1:int, param2:int, param3:int, param4:String, param5:IVector3d, param6:IVector3d, param7:int, param8:String, param9:Number = NaN) : Boolean
      {
         var _loc13_:* = null;
         var _loc10_:String = this.getWorldType(param1,param2);
         if(this.isPublicRoomWorldType(_loc10_) && this.var_13 != null)
         {
            _loc13_ = this.var_13.getPublicRoomContentType(_loc10_) + "_";
            param4 = _loc13_ + param4;
         }
         var _loc11_:IRoomObjectController = this.createObjectFurniture(param1,param2,param3,param4);
         if(_loc11_ == null)
         {
            return false;
         }
         if(!this.updateObjectFurniture(param1,param2,param3,param5,param6,param7,param8,param9))
         {
            return false;
         }
         if(events != null)
         {
            events.dispatchEvent(new RoomEngineObjectEvent(RoomEngineObjectEvent.const_318,param1,param2,param3,RoomObjectCategoryEnum.OBJECT_CATEGORY_FURNITURE));
         }
         var _loc12_:ISelectedRoomObjectData = this.getPlacedObjectData(param1,param2);
         if(_loc12_ && Math.abs(_loc12_.id) == param3 && _loc12_.category == RoomObjectCategoryEnum.OBJECT_CATEGORY_FURNITURE)
         {
            this.selectRoomObject(param1,param2,param3,RoomObjectCategoryEnum.OBJECT_CATEGORY_FURNITURE);
         }
         return true;
      }
      
      public function updateObjectFurniture(param1:int, param2:int, param3:int, param4:IVector3d, param5:IVector3d, param6:int, param7:String, param8:Number = NaN) : Boolean
      {
         var _loc9_:IRoomObjectController = this.getObjectFurniture(param1,param2,param3);
         if(_loc9_ == null)
         {
            return false;
         }
         var _loc10_:RoomObjectUpdateMessage = new RoomObjectUpdateMessage(param4,param5);
         var _loc11_:RoomObjectDataUpdateMessage = new RoomObjectDataUpdateMessage(param6,param7,param8);
         if(_loc9_ != null && _loc9_.getEventHandler() != null)
         {
            _loc9_.getEventHandler().processUpdateMessage(_loc10_);
            _loc9_.getEventHandler().processUpdateMessage(_loc11_);
         }
         return true;
      }
      
      public function updateObjectFurnitureLocation(param1:int, param2:int, param3:int, param4:RoomObjectUpdateMessage) : Boolean
      {
         var _loc5_:IRoomObjectController = this.getObjectFurniture(param1,param2,param3);
         if(_loc5_ == null)
         {
            return false;
         }
         if(_loc5_ != null && _loc5_.getEventHandler() != null)
         {
            _loc5_.getEventHandler().processUpdateMessage(param4);
         }
         return true;
      }
      
      private function createObjectFurniture(param1:int, param2:int, param3:int, param4:String) : IRoomObjectController
      {
         var _loc5_:int = 0;
         return this.createObject(this.getRoomIdentifier(param1,param2),param3,param4,_loc5_);
      }
      
      private function getObjectFurniture(param1:int, param2:int, param3:int) : IRoomObjectController
      {
         return this.getObject(this.getRoomIdentifier(param1,param2),param3,RoomObjectCategoryEnum.OBJECT_CATEGORY_FURNITURE);
      }
      
      public function disposeObjectFurniture(param1:int, param2:int, param3:int) : void
      {
         this.disposeObject(this.getRoomIdentifier(param1,param2),param3,RoomObjectCategoryEnum.OBJECT_CATEGORY_FURNITURE);
      }
      
      public function addObjectWallItem(param1:int, param2:int, param3:int, param4:int, param5:IVector3d, param6:IVector3d, param7:int, param8:String) : Boolean
      {
         var _loc9_:String = this.getWallItemType(param4,param8);
         var _loc10_:int = this.getWallItemColorIndex(param4);
         var _loc11_:String = this.getRoomObjectAdURL(_loc9_);
         if(_loc9_ == null)
         {
            _loc9_ = "";
         }
         var _loc12_:IRoomObjectController = this.createObjectWallItem(param1,param2,param3,_loc9_);
         if(_loc12_ == null)
         {
            return false;
         }
         if(_loc12_ != null && _loc12_.getModelController() != null)
         {
            _loc12_.getModelController().setNumber(RoomObjectVariableEnum.const_229,_loc10_,false);
            _loc12_.getModelController().setNumber(RoomObjectVariableEnum.const_400,param4,true);
            _loc12_.getModelController().setString(RoomObjectVariableEnum.const_332,_loc11_,true);
            _loc12_.getModelController().setNumber(RoomObjectVariableEnum.const_1185,1,true);
         }
         if(!this.updateObjectWallItem(param1,param2,param3,param5,param6,param7,param8))
         {
            return false;
         }
         if(events != null)
         {
            events.dispatchEvent(new RoomEngineObjectEvent(RoomEngineObjectEvent.const_318,param1,param2,param3,RoomObjectCategoryEnum.const_27));
         }
         var _loc13_:ISelectedRoomObjectData = this.getPlacedObjectData(param1,param2);
         if(_loc13_ && _loc13_.id == param3 && _loc13_.category == RoomObjectCategoryEnum.const_27)
         {
            this.selectRoomObject(param1,param2,param3,RoomObjectCategoryEnum.const_27);
         }
         return true;
      }
      
      public function updateObjectWallItem(param1:int, param2:int, param3:int, param4:IVector3d, param5:IVector3d, param6:int, param7:String) : Boolean
      {
         var _loc8_:IRoomObjectController = this.getObjectWallItem(param1,param2,param3);
         if(_loc8_ == null)
         {
            return false;
         }
         var _loc9_:RoomObjectUpdateMessage = new RoomObjectUpdateMessage(param4,param5);
         var _loc10_:RoomObjectDataUpdateMessage = new RoomObjectDataUpdateMessage(param6,param7);
         if(_loc8_ != null && _loc8_.getEventHandler() != null)
         {
            _loc8_.getEventHandler().processUpdateMessage(_loc9_);
            _loc8_.getEventHandler().processUpdateMessage(_loc10_);
         }
         this.updateObjectRoomWindow(param1,param2,param3);
         return true;
      }
      
      public function updateObjectRoomWindow(param1:int, param2:int, param3:int, param4:Boolean = true) : void
      {
         var _loc9_:* = null;
         var _loc10_:* = null;
         var _loc5_:String = "undefined_" + param3;
         var _loc6_:* = null;
         var _loc7_:IRoomObjectController = this.getObjectWallItem(param1,param2,param3);
         if(_loc7_ != null)
         {
            if(_loc7_.getModel() != null)
            {
               if(_loc7_.getModel().getNumber(RoomObjectVariableEnum.const_1178) > 0)
               {
                  _loc9_ = _loc7_.getModel().getString(RoomObjectVariableEnum.const_1098);
                  _loc10_ = _loc7_.getLocation();
                  if(param4)
                  {
                     _loc6_ = new RoomObjectRoomMaskUpdateMessage(RoomObjectRoomMaskUpdateMessage.const_547,_loc5_,_loc9_,_loc10_);
                  }
                  else
                  {
                     _loc6_ = new RoomObjectRoomMaskUpdateMessage(RoomObjectRoomMaskUpdateMessage.const_642,_loc5_);
                  }
               }
            }
         }
         else
         {
            _loc6_ = new RoomObjectRoomMaskUpdateMessage(RoomObjectRoomMaskUpdateMessage.const_642,_loc5_);
         }
         var _loc8_:IRoomObjectController = this.getObjectRoom(param1,param2);
         if(_loc8_ != null && _loc8_.getEventHandler() != null && _loc6_ != null)
         {
            _loc8_.getEventHandler().processUpdateMessage(_loc6_);
         }
      }
      
      public function updateObjectWallItemData(param1:int, param2:int, param3:int, param4:String) : Boolean
      {
         var _loc5_:IRoomObjectController = this.getObjectWallItem(param1,param2,param3);
         if(_loc5_ == null)
         {
            return false;
         }
         var _loc6_:RoomObjectItemDataUpdateMessage = new RoomObjectItemDataUpdateMessage(param4);
         if(_loc5_ != null && _loc5_.getEventHandler() != null)
         {
            _loc5_.getEventHandler().processUpdateMessage(_loc6_);
         }
         return true;
      }
      
      private function createObjectWallItem(param1:int, param2:int, param3:int, param4:String) : IRoomObjectController
      {
         var _loc5_:int = 0;
         return this.createObject(this.getRoomIdentifier(param1,param2),param3,param4,_loc5_);
      }
      
      private function getObjectWallItem(param1:int, param2:int, param3:int) : IRoomObjectController
      {
         return this.getObject(this.getRoomIdentifier(param1,param2),param3,RoomObjectCategoryEnum.const_27);
      }
      
      public function disposeObjectWallItem(param1:int, param2:int, param3:int) : void
      {
         this.disposeObject(this.getRoomIdentifier(param1,param2),param3,RoomObjectCategoryEnum.const_27);
         this.updateObjectRoomWindow(param1,param2,param3,false);
      }
      
      public function addObjectUser(param1:int, param2:int, param3:int, param4:IVector3d, param5:IVector3d, param6:Number, param7:int, param8:String = null) : Boolean
      {
         var _loc11_:* = null;
         var _loc12_:* = null;
         if(this.getObjectUser(param1,param2,param3) != null)
         {
            return false;
         }
         var _loc9_:String = this.getUserType(param7);
         if(_loc9_ == "pet")
         {
            _loc9_ = this.getPetType(param8);
         }
         var _loc10_:IRoomObjectController = this.createObjectUser(param1,param2,param3,_loc9_);
         if(_loc10_ == null)
         {
            return false;
         }
         if(_loc10_ != null && _loc10_.getEventHandler() != null)
         {
            _loc11_ = new RoomObjectUpdateMessage(param4,param5);
            _loc10_.getEventHandler().processUpdateMessage(_loc11_);
            if(param8 != null)
            {
               _loc12_ = new RoomObjectAvatarFigureUpdateMessage(param8);
               _loc10_.getEventHandler().processUpdateMessage(_loc12_);
            }
         }
         if(events != null)
         {
            events.dispatchEvent(new RoomEngineObjectEvent(RoomEngineObjectEvent.const_318,param1,param2,param3,RoomObjectCategoryEnum.OBJECT_CATEGORY_USER));
         }
         return true;
      }
      
      public function updateObjectUser(param1:int, param2:int, param3:int, param4:IVector3d, param5:IVector3d, param6:IVector3d = null, param7:Number = NaN) : Boolean
      {
         var _loc8_:IRoomObjectController = this.getObjectUser(param1,param2,param3);
         if(_loc8_ == null || _loc8_.getEventHandler() == null || _loc8_.getModel() == null)
         {
            return false;
         }
         if(param4 == null)
         {
            param4 = _loc8_.getLocation();
         }
         if(param6 == null)
         {
            param6 = _loc8_.getDirection();
         }
         if(isNaN(param7))
         {
            param7 = _loc8_.getModel().getNumber(RoomObjectVariableEnum.const_316);
         }
         var _loc9_:RoomObjectUpdateMessage = new RoomObjectAvatarUpdateMessage(param4,param5,param6,param7);
         _loc8_.getEventHandler().processUpdateMessage(_loc9_);
         return true;
      }
      
      public function updateObjectUserState(param1:int, param2:int, param3:int, param4:RoomObjectUpdateStateMessage) : Boolean
      {
         var _loc5_:IRoomObjectController = this.getObjectUser(param1,param2,param3);
         if(_loc5_ == null || _loc5_.getEventHandler() == null)
         {
            return false;
         }
         _loc5_.getEventHandler().processUpdateMessage(param4);
         return true;
      }
      
      private function createObjectUser(param1:int, param2:int, param3:int, param4:String) : IRoomObjectController
      {
         var _loc5_:int = 0;
         return this.createObject(this.getRoomIdentifier(param1,param2),param3,param4,_loc5_);
      }
      
      private function getObjectUser(param1:int, param2:int, param3:int) : IRoomObjectController
      {
         return this.getObject(this.getRoomIdentifier(param1,param2),param3,RoomObjectCategoryEnum.OBJECT_CATEGORY_USER);
      }
      
      public function disposeObjectUser(param1:int, param2:int, param3:int) : void
      {
         this.disposeObject(this.getRoomIdentifier(param1,param2),param3,RoomObjectCategoryEnum.OBJECT_CATEGORY_USER);
      }
      
      private function createObject(param1:String, param2:int, param3:String, param4:int) : IRoomObjectController
      {
         var _loc5_:IRoomInstance = this.var_46.getRoom(param1);
         if(_loc5_ == null)
         {
            return null;
         }
         var _loc6_:* = null;
         return _loc5_.createRoomObject(param2,param3,param4) as IRoomObjectController;
      }
      
      private function getObject(param1:String, param2:int, param3:int) : IRoomObjectController
      {
         var _loc4_:IRoomInstance = this.var_46.getRoom(param1);
         if(_loc4_ == null)
         {
            return null;
         }
         var _loc5_:* = null;
         return _loc4_.getObject(param2,param3) as IRoomObjectController;
      }
      
      private function disposeObject(param1:String, param2:int, param3:int) : void
      {
         var _loc4_:IRoomInstance = this.var_46.getRoom(param1);
         if(_loc4_ == null)
         {
            return;
         }
         if(_loc4_.disposeObject(param2,param3))
         {
            if(events != null)
            {
               events.dispatchEvent(new RoomEngineObjectEvent(RoomEngineObjectEvent.const_857,this.var_96,this.var_97,param2,param3));
            }
         }
      }
      
      private function roomObjectEventHandler(param1:RoomObjectEvent) : void
      {
         if(this.var_71 != null)
         {
            this.var_71.handleRoomObjectEvent(param1,this.var_96,this.var_97);
         }
      }
      
      public function getFurnitureIcon(param1:int, param2:IGetImageListener, param3:String = null) : ImageResult
      {
         return this.getFurnitureImage(param1,new Vector3d(),1,param2,0,param3);
      }
      
      public function getWallItemIcon(param1:int, param2:IGetImageListener, param3:String = null) : ImageResult
      {
         return this.getWallItemImage(param1,new Vector3d(),1,param2,0,param3);
      }
      
      public function getFurnitureImage(param1:int, param2:IVector3d, param3:int, param4:IGetImageListener, param5:uint = 0, param6:String = null, param7:int = -1) : ImageResult
      {
         var _loc8_:* = null;
         var _loc9_:String = "";
         if(this.var_13 != null)
         {
            _loc8_ = this.var_13.getActiveObjectType(param1);
            _loc9_ = String(this.var_13.getActiveObjectColorIndex(param1));
         }
         return this.getGenericRoomObjectImage(_loc8_,_loc9_,param2,param3,param4,param5,param6,param7);
      }
      
      public function getPetImage(param1:int, param2:int, param3:IVector3d, param4:int, param5:IGetImageListener, param6:uint = 0) : ImageResult
      {
         var _loc7_:* = null;
         var _loc8_:* = param2 + "";
         if(this.var_13 != null)
         {
            _loc7_ = this.var_13.getPetType(param1);
         }
         return this.getGenericRoomObjectImage(_loc7_,_loc8_,param3,param4,param5,param6);
      }
      
      public function getWallItemImage(param1:int, param2:IVector3d, param3:int, param4:IGetImageListener, param5:uint = 0, param6:String = null, param7:int = -1) : ImageResult
      {
         var _loc8_:* = null;
         var _loc9_:String = "";
         if(this.var_13 != null)
         {
            _loc8_ = this.var_13.getWallItemType(param1,param6);
            _loc9_ = String(this.var_13.getWallItemColorIndex(param1));
         }
         return this.getGenericRoomObjectImage(_loc8_,_loc9_,param2,param3,param4,param5,param6,param7);
      }
      
      public function getRoomImage(param1:String, param2:String, param3:String, param4:int, param5:IGetImageListener, param6:String = null) : ImageResult
      {
         if(param1 == null)
         {
            param1 = "";
         }
         if(param2 == null)
         {
            param2 = "";
         }
         if(param3 == null)
         {
            param3 = "";
         }
         var _loc7_:String = const_584;
         var _loc8_:* = param1 + "\n" + param2 + "\n" + param3 + "\n";
         if(param6 != null)
         {
            _loc8_ += param6;
         }
         return this.getGenericRoomObjectImage(_loc7_,_loc8_,new Vector3d(),param4,param5);
      }
      
      public function getRoomObjectImage(param1:int, param2:int, param3:int, param4:int, param5:IVector3d, param6:int, param7:IGetImageListener, param8:uint = 0) : ImageResult
      {
         var _loc11_:* = null;
         var _loc14_:* = null;
         var _loc9_:* = null;
         var _loc10_:String = "";
         var _loc12_:String = this.getRoomIdentifier(param1,param2);
         var _loc13_:IRoomInstance = this.var_46.getRoom(_loc12_);
         if(_loc13_ != null)
         {
            _loc14_ = _loc13_.getObject(param3,param4);
            if(_loc14_ != null && _loc14_.getModel() != null)
            {
               _loc9_ = _loc14_.getType();
               switch(param4)
               {
                  case RoomObjectCategoryEnum.OBJECT_CATEGORY_FURNITURE:
                  case RoomObjectCategoryEnum.const_27:
                     _loc10_ = String(_loc14_.getModel().getNumber(RoomObjectVariableEnum.const_229));
                     _loc11_ = _loc14_.getModel().getString(RoomObjectVariableEnum.const_518);
                     break;
                  case RoomObjectCategoryEnum.OBJECT_CATEGORY_USER:
                     _loc10_ = _loc14_.getModel().getString(RoomObjectVariableEnum.const_190);
               }
            }
         }
         return this.getGenericRoomObjectImage(_loc9_,_loc10_,param5,param6,param7,param8,_loc11_);
      }
      
      private function initializeRoomForGettingImage(param1:IRoomObjectController, param2:String) : void
      {
         var _loc3_:* = null;
         var _loc4_:* = null;
         var _loc5_:* = null;
         var _loc6_:* = null;
         var _loc7_:* = null;
         var _loc8_:* = null;
         var _loc9_:* = null;
         var _loc10_:* = null;
         var _loc11_:* = null;
         if(param2 != null)
         {
            _loc3_ = param2.split("\n");
            if(_loc3_.length >= 3)
            {
               _loc4_ = _loc3_[0];
               _loc5_ = _loc3_[1];
               _loc6_ = _loc3_[2];
               _loc7_ = _loc3_[3];
               _loc8_ = new RoomPlaneParser();
               _loc8_.addPlane(RoomPlaneData.const_198,new Vector3d(0,0,0),new Vector3d(10,0,0),new Vector3d(0,10,0));
               _loc8_.addPlane(RoomPlaneData.const_167,new Vector3d(0,0,0),new Vector3d(0,10,0),new Vector3d(0,0,10));
               _loc8_.addPlane(RoomPlaneData.const_167,new Vector3d(10,0,0),new Vector3d(-10,0,0),new Vector3d(0,0,10));
               _loc8_.addPlane(RoomPlaneData.const_305,new Vector3d(10,0,0),new Vector3d(-10,0,0),new Vector3d(0,0,10));
               _loc9_ = _loc8_.getXML();
               param1.getEventHandler().initialize(_loc9_);
               param1.getModelController().setString(RoomObjectVariableEnum.const_782,_loc4_);
               param1.getModelController().setString(RoomObjectVariableEnum.const_631,_loc5_);
               param1.getModelController().setString(RoomObjectVariableEnum.const_865,_loc6_);
               if(_loc7_ != null)
               {
                  _loc10_ = null;
                  _loc11_ = "undefined_1";
                  _loc10_ = new RoomObjectRoomMaskUpdateMessage(RoomObjectRoomMaskUpdateMessage.const_547,_loc11_,_loc7_,new Vector3d(2,0,1.75));
                  param1.getEventHandler().processUpdateMessage(_loc10_);
               }
            }
         }
      }
      
      public function getGenericRoomObjectImage(param1:String, param2:String, param3:IVector3d, param4:int, param5:IGetImageListener, param6:uint = 0, param7:String = null, param8:int = -1) : ImageResult
      {
         var _loc17_:* = null;
         var _loc18_:* = null;
         var _loc9_:ImageResult = new ImageResult();
         _loc9_.id = -1;
         if(!this.var_453 || param1 == null)
         {
            return _loc9_;
         }
         var _loc10_:IRoomInstance = this.var_46.getRoom(const_585);
         if(_loc10_ == null)
         {
            _loc10_ = this.var_46.createRoom(const_585,null);
            if(_loc10_ == null)
            {
               return _loc9_;
            }
         }
         var _loc11_:int = this.var_657.reserveNumber();
         var _loc12_:int = this.getRoomObjectCategory(param1);
         if(_loc11_ < 0)
         {
            return _loc9_;
         }
         _loc11_ += 1;
         var _loc13_:IRoomObjectController = _loc10_.createRoomObject(_loc11_,param1,_loc12_) as IRoomObjectController;
         if(_loc13_ == null || _loc13_.getModelController() == null || _loc13_.getEventHandler() == null)
         {
            return _loc9_;
         }
         switch(_loc12_)
         {
            case RoomObjectCategoryEnum.OBJECT_CATEGORY_FURNITURE:
            case RoomObjectCategoryEnum.const_27:
               _loc13_.getModelController().setNumber(RoomObjectVariableEnum.const_229,int(param2));
               _loc13_.getModelController().setString(RoomObjectVariableEnum.const_518,param7);
               break;
            case RoomObjectCategoryEnum.OBJECT_CATEGORY_USER:
               if(param1 == "user" || param1 == "bot" || param1 == "pet")
               {
                  _loc13_.getModelController().setString(RoomObjectVariableEnum.const_190,param2);
               }
               else
               {
                  _loc13_.getModelController().setNumber(RoomObjectVariableEnum.PET_PALETTE_INDEX,int(param2));
               }
               break;
            case RoomObjectCategoryEnum.const_79:
               this.initializeRoomForGettingImage(_loc13_,param2);
         }
         _loc13_.setDirection(param3);
         var _loc14_:* = null;
         _loc14_ = _loc13_.getVisualization() as IRoomObjectSpriteVisualization;
         if(_loc14_ == null)
         {
            _loc10_.disposeObject(_loc11_,_loc12_);
            return _loc9_;
         }
         if(param8 > -1)
         {
            _loc17_ = _loc13_.getModel().getString(RoomObjectVariableEnum.const_91);
            _loc18_ = new RoomObjectDataUpdateMessage(param8,_loc17_);
            if(_loc13_.getEventHandler() != null)
            {
               _loc13_.getEventHandler().processUpdateMessage(_loc18_);
            }
         }
         var _loc15_:RoomGeometry = new RoomGeometry(param4,new Vector3d(-135,30,0),new Vector3d(11,11,5));
         _loc14_.update(_loc15_,0,true);
         var _loc16_:BitmapData = _loc14_.getImage(param6);
         _loc9_.data = _loc16_;
         _loc9_.id = _loc11_;
         if(!this.isRoomObjectContentAvailable(param1) && param5 != null)
         {
            this.var_1013.add(String(_loc11_),param5);
            _loc13_.getModelController().setNumber(RoomObjectVariableEnum.const_1058,param4,true);
         }
         else
         {
            _loc10_.disposeObject(_loc11_,_loc12_);
            this.var_657.freeNumber(_loc11_ - 1);
            _loc9_.id = 0;
         }
         _loc15_.dispose();
         return _loc9_;
      }
      
      public function getRoomObjectBoundingRectangle(param1:int, param2:int, param3:int, param4:int, param5:int) : Rectangle
      {
         var _loc7_:* = null;
         var _loc8_:* = null;
         var _loc9_:* = null;
         var _loc10_:* = null;
         var _loc11_:* = null;
         var _loc6_:IRoomGeometry = this.getRoomCanvasGeometry(param1,param2,param5);
         if(_loc6_ != null)
         {
            _loc7_ = this.getRoomObject(param1,param2,param3,param4);
            if(_loc7_ != null)
            {
               _loc8_ = _loc7_.getVisualization();
               if(_loc8_ != null)
               {
                  _loc9_ = _loc8_.boundingRectangle;
                  _loc10_ = _loc6_.getScreenPoint(_loc7_.getLocation());
                  if(_loc10_ != null)
                  {
                     _loc9_.offset(_loc10_.x,_loc10_.y);
                     _loc11_ = this.getRoomCanvas(param1,param2,param5);
                     if(_loc11_ != null)
                     {
                        _loc9_.offset(_loc11_.width / 2 + _loc11_.screenOffsetX,_loc11_.height / 2 + _loc11_.screenOffsetY);
                        return _loc9_;
                     }
                  }
               }
            }
         }
         return null;
      }
      
      public function getActiveRoomBoundingRectangle(param1:int) : Rectangle
      {
         return this.getRoomObjectBoundingRectangle(this.var_96,this.var_97,const_327,RoomObjectCategoryEnum.const_79,param1);
      }
      
      public function isRoomObjectContentAvailable(param1:String) : Boolean
      {
         return this.var_46.isContentAvailable(param1);
      }
      
      public function contentLoaded(param1:String, param2:Boolean = false) : void
      {
         var _loc9_:* = null;
         var _loc10_:int = 0;
         var _loc11_:* = null;
         var _loc12_:* = null;
         var _loc13_:* = null;
         var _loc14_:Number = NaN;
         var _loc3_:IRoomInstance = this.var_46.getRoom(const_585);
         if(_loc3_ == null)
         {
            return;
         }
         if(this.var_13 == null)
         {
            return;
         }
         var _loc4_:* = null;
         var _loc5_:* = 0;
         var _loc6_:int = this.var_13.getObjectCategory(param1);
         var _loc7_:int = _loc3_.getObjectCount(_loc6_);
         var _loc8_:int = _loc7_ - 1;
         while(_loc8_ >= 0)
         {
            _loc9_ = _loc3_.getObjectWithIndex(_loc8_,_loc6_);
            if(_loc9_ != null && _loc9_.getModel() != null && _loc9_.getType() == param1)
            {
               _loc10_ = _loc9_.getId();
               _loc11_ = null;
               _loc12_ = null;
               _loc12_ = _loc9_.getVisualization() as IRoomObjectSpriteVisualization;
               if(_loc12_ != null)
               {
                  _loc14_ = _loc9_.getModel().getNumber(RoomObjectVariableEnum.const_1058);
                  if(_loc4_ != null && _loc5_ != _loc14_)
                  {
                     _loc4_.dispose();
                     _loc4_ = null;
                  }
                  if(_loc4_ == null)
                  {
                     _loc5_ = Number(_loc14_);
                     _loc4_ = new RoomGeometry(_loc14_,new Vector3d(-135,30,0),new Vector3d(11,11,5));
                  }
                  _loc12_.update(_loc4_,0,true);
                  _loc11_ = _loc12_.image;
               }
               _loc3_.disposeObject(_loc10_,_loc6_);
               this.var_657.freeNumber(_loc10_ - 1);
               _loc13_ = this.var_1013.remove(String(_loc10_)) as IGetImageListener;
               if(_loc13_ != null && _loc11_ != null)
               {
                  _loc13_.imageReady(_loc10_,_loc11_);
               }
               else if(_loc11_ != null)
               {
                  _loc11_.dispose();
               }
            }
            _loc8_--;
         }
         if(_loc4_ != null)
         {
            _loc4_.dispose();
         }
      }
      
      public function objectInitialized(param1:String, param2:int, param3:int) : void
      {
         var _loc7_:* = null;
         var _loc8_:int = 0;
         var _loc9_:* = null;
         var _loc4_:int = this.getRoomId(param1);
         var _loc5_:int = this.getRoomCategory(param1);
         if(param3 == RoomObjectCategoryEnum.const_27)
         {
            this.updateObjectRoomWindow(_loc4_,_loc5_,param2);
         }
         var _loc6_:IRoomObjectController = this.getRoomObject(_loc4_,_loc5_,param2,param3) as IRoomObjectController;
         if(_loc6_ != null && _loc6_.getModel() != null && _loc6_.getEventHandler() != null)
         {
            _loc7_ = _loc6_.getModel().getString(RoomObjectVariableEnum.const_91);
            if(_loc7_ != null)
            {
               _loc8_ = _loc6_.getState(0);
               _loc9_ = new RoomObjectDataUpdateMessage(_loc8_,_loc7_);
               _loc6_.getEventHandler().processUpdateMessage(_loc9_);
            }
         }
      }
      
      public function selectAvatar(param1:int, param2:int, param3:int, param4:Boolean) : void
      {
         if(this.var_71 != null)
         {
            this.var_71.setSelectedAvatar(param1,param2,param3,param4);
         }
      }
      
      public function getSelectedAvatarId() : int
      {
         if(this.var_71 != null)
         {
            return this.var_71.getSelectedAvatarId();
         }
         return -1;
      }
      
      public function selectRoomObject(param1:int, param2:int, param3:int, param4:int) : void
      {
         if(this.var_71 == null)
         {
            return;
         }
         this.var_71.setSelectedObject(param1,param2,param3,param4);
      }
      
      public function loadRoomResources(param1:String) : Array
      {
         if(this.var_13 != null)
         {
            return this.var_13.loadLegacyContent(param1,events);
         }
         return new Array();
      }
      
      private function showRoomAd(param1:AdEvent) : void
      {
         var _loc2_:* = null;
         var _loc3_:* = null;
         var _loc4_:* = null;
         if(this.var_13 != null)
         {
            _loc2_ = this.getWorldType(param1.roomId,param1.roomCategory);
            this.var_13.addGraphicAsset(this.var_13.getPublicRoomContentType(_loc2_),RoomObjectVariableEnum.const_408,param1.image,true);
            this.var_13.addGraphicAsset(this.var_13.getPublicRoomContentType(_loc2_),RoomObjectVariableEnum.const_1021,param1.adWarningL,true);
            this.var_13.addGraphicAsset(this.var_13.getPublicRoomContentType(_loc2_),RoomObjectVariableEnum.const_1014,param1.adWarningR,true);
            _loc3_ = this.getObjectRoom(param1.roomId,param1.roomCategory);
            if(_loc3_ == null)
            {
               return;
            }
            _loc4_ = null;
            _loc4_ = new RoomObjectRoomAdUpdateMessage(RoomObjectRoomAdUpdateMessage.const_993,RoomObjectVariableEnum.const_408,param1.clickUrl);
            _loc3_.getEventHandler().processUpdateMessage(_loc4_);
         }
      }
      
      public function insertContentLibrary(param1:int, param2:int, param3:IAssetLibrary) : Boolean
      {
         return this.var_13.insertObjectContent(param1,param2,param3);
      }
      
      public function setActiveObjectType(param1:int, param2:String) : void
      {
         this.var_13.setActiveObjectType(param1,param2);
      }
   }
}

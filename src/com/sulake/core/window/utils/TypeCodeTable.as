package com.sulake.core.window.utils
{
   import com.sulake.core.window.enum.WindowType;
   import flash.utils.Dictionary;
   
   public class TypeCodeTable extends WindowType
   {
       
      
      public function TypeCodeTable()
      {
         super();
      }
      
      public static function fillTables(param1:Dictionary, param2:Dictionary = null) : void
      {
         var _loc3_:* = null;
         param1["background"] = const_800;
         param1["bitmap"] = const_827;
         param1["border"] = const_870;
         param1["border_notify"] = const_1538;
         param1["button"] = const_568;
         param1["button_thick"] = const_828;
         param1["button_icon"] = const_1642;
         param1["button_group_left"] = const_722;
         param1["button_group_center"] = const_847;
         param1["button_group_right"] = const_703;
         param1["canvas"] = const_758;
         param1["checkbox"] = const_639;
         param1["closebutton"] = const_1103;
         param1["container"] = const_391;
         param1["container_button"] = const_624;
         param1["display_object_wrapper"] = const_861;
         param1["dropmenu"] = const_439;
         param1["dropmenu_item"] = const_557;
         param1["frame"] = const_384;
         param1["frame_notify"] = const_1367;
         param1["header"] = const_690;
         param1["html"] = const_1128;
         param1["icon"] = const_1122;
         param1["itemgrid"] = const_1101;
         param1["itemgrid_horizontal"] = const_508;
         param1["itemgrid_vertical"] = const_743;
         param1["itemlist"] = const_1032;
         param1["itemlist_horizontal"] = const_369;
         param1["itemlist_vertical"] = const_397;
         param1["label"] = WINDOW_TYPE_LABEL;
         param1["maximizebox"] = const_1473;
         param1["menu"] = const_1572;
         param1["menu_item"] = const_1555;
         param1["submenu"] = const_1171;
         param1["minimizebox"] = const_1591;
         param1["notify"] = const_1545;
         param1["CanCreateRoomMessageComposer"] = const_890;
         param1["password"] = const_698;
         param1["radiobutton"] = const_805;
         param1["region"] = const_765;
         param1["restorebox"] = const_1571;
         param1["scaler"] = const_749;
         param1["scaler_horizontal"] = const_1421;
         param1["scaler_vertical"] = const_1486;
         param1["scrollbar_horizontal"] = const_437;
         param1["scrollbar_vertical"] = const_792;
         param1["scrollbar_slider_button_up"] = const_1026;
         param1["scrollbar_slider_button_down"] = const_1008;
         param1["scrollbar_slider_button_left"] = const_1124;
         param1["scrollbar_slider_button_right"] = const_1144;
         param1["scrollbar_slider_bar_horizontal"] = const_1141;
         param1["scrollbar_slider_bar_vertical"] = const_1204;
         param1["scrollbar_slider_track_horizontal"] = const_1016;
         param1["scrollbar_slider_track_vertical"] = const_1093;
         param1["scrollable_itemlist"] = const_1406;
         param1["scrollable_itemlist_vertical"] = const_466;
         param1["scrollable_itemlist_horizontal"] = const_1112;
         param1["selector"] = const_839;
         param1["selector_list"] = const_864;
         param1["submenu"] = const_1171;
         param1["tab_button"] = const_448;
         param1["tab_container_button"] = const_1146;
         param1["tab_context"] = const_367;
         param1["tab_content"] = const_1135;
         param1["tab_selector"] = const_777;
         param1["text"] = const_580;
         param1["input"] = const_619;
         param1["toolbar"] = const_1489;
         param1["tooltip"] = const_357;
         if(param2 != null)
         {
            for(param2[param1[_loc3_]] in param1)
            {
            }
         }
      }
   }
}

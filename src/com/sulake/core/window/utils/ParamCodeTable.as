package com.sulake.core.window.utils
{
   import com.sulake.core.window.enum.WindowParam;
   import flash.utils.Dictionary;
   
   public class ParamCodeTable extends WindowParam
   {
       
      
      public function ParamCodeTable()
      {
         super();
      }
      
      public static function fillTables(param1:Dictionary, param2:Dictionary = null) : void
      {
         var _loc3_:* = null;
         param1["CanCreateRoomMessageComposer"] = const_185;
         param1["bound_to_parent_rect"] = const_97;
         param1["child_window"] = const_1108;
         param1["embedded_controller"] = const_1147;
         param1["resize_to_accommodate_children"] = const_63;
         param1["input_event_processor"] = const_30;
         param1["internal_event_handling"] = const_862;
         param1["mouse_dragging_target"] = const_269;
         param1["mouse_dragging_trigger"] = const_353;
         param1["mouse_scaling_target"] = const_295;
         param1["mouse_scaling_trigger"] = const_554;
         param1["horizontal_mouse_scaling_trigger"] = const_237;
         param1["vertical_mouse_scaling_trigger"] = const_217;
         param1["observe_parent_input_events"] = const_1044;
         param1["optimize_region_to_layout_size"] = const_441;
         param1["parent_window"] = const_1017;
         param1["relative_horizontal_scale_center"] = const_196;
         param1["relative_horizontal_scale_fixed"] = const_127;
         param1["relative_horizontal_scale_move"] = const_342;
         param1["relative_horizontal_scale_strech"] = const_352;
         param1["relative_scale_center"] = const_1181;
         param1["relative_scale_fixed"] = const_899;
         param1["relative_scale_move"] = const_1172;
         param1["relative_scale_strech"] = const_1072;
         param1["relative_vertical_scale_center"] = const_193;
         param1["relative_vertical_scale_fixed"] = const_148;
         param1["relative_vertical_scale_move"] = const_383;
         param1["relative_vertical_scale_strech"] = const_344;
         param1["on_resize_align_left"] = const_853;
         param1["on_resize_align_right"] = const_528;
         param1["on_resize_align_center"] = const_517;
         param1["on_resize_align_top"] = const_816;
         param1["on_resize_align_bottom"] = const_513;
         param1["on_resize_align_middle"] = const_452;
         param1["on_accommodate_align_left"] = const_1087;
         param1["on_accommodate_align_right"] = const_535;
         param1["on_accommodate_align_center"] = const_889;
         param1["on_accommodate_align_top"] = const_1056;
         param1["on_accommodate_align_bottom"] = WINDOW_PARAM_ON_ACCOMMODATE_ALIGN_BOTTOM;
         param1["on_accommodate_align_middle"] = const_882;
         param1["route_input_events_to_parent"] = const_506;
         param1["use_parent_graphic_context"] = const_32;
         param1["draggable_with_mouse"] = const_1029;
         param1["scalable_with_mouse"] = const_1163;
         param1["reflect_horizontal_resize_to_parent"] = const_507;
         param1["reflect_vertical_resize_to_parent"] = const_457;
         param1["reflect_resize_to_parent"] = const_299;
         param1["force_clipping"] = WINDOW_PARAM_FORCE_CLIPPING;
         param1["inherit_caption"] = const_1156;
         if(param2 != null)
         {
            for(param2[param1[_loc3_]] in param1)
            {
            }
         }
      }
   }
}

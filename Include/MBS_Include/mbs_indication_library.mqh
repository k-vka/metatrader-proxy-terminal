//=== mbs_indication_library.mqh ==========================================/

//================================== Init_Common_Indication ===============/

void     Init_Common_Indication()
{
int      i;
string   label_name;

//---------------------------- Init Common Labels -------------------------/

   for (i = 1; i <= label_common_number; i++)
   {
//--- Get Common Label Name ---/

      label_name = label_common_prefix + IntegerToString(i,0,'0');

//--- Delete Common Label ---/
      
      ObjectDelete(label_name);

//--- Create Common Label ---/

      ObjectCreate(label_name,OBJ_LABEL,0,0,0);

//--- Set X Distance ---/

      ObjectSet(label_name,OBJPROP_XDISTANCE,label_common_x_distance);

//--- Set Y distance ---/
   
      ObjectSet(label_name,OBJPROP_YDISTANCE,label_common_y_distance);
      label_common_y_distance = label_common_y_distance + label_common_y_step;

//--- Reset Label Text ---/
      
      ObjectSetText(label_name,"",label_common_font_size,label_common_font_name,label_common_font_color);

   }

//-------------------------------------------------------------------------/

   return;
}

//================================== DeInit_Common_Indication =============/

void     DeInit_Common_Indication()
{
int      i;
string   label_name;

//---------------------------- DeInit Common Labels -----------------------/

   for (i = 1; i <= label_common_number; i++)
   {
//--- Get Common Label Name ---/

      label_name = label_common_prefix + IntegerToString(i,0,'0');

//--- Delete Common Label ---/
      
      ObjectDelete(label_name);
   }

//-------------------------------------------------------------------------/

   return;
}

//=== eof mbs_indication_library.mqh ======================================/


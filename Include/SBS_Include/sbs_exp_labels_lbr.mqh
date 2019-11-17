//================== sbs_exp_labels_lbr.mqh ============================/

//====================== Delete Labels ==============================/

void  Delete_Labels()
{
   ObjectDelete(l_symbol);
   ObjectDelete(l_balance);
   ObjectDelete(l_equity);
   ObjectDelete(l_freemargin);
   ObjectDelete(l_leverage);
   ObjectDelete(l_margin);
   ObjectDelete(l_server);
   ObjectDelete(l_stopoutlevel);  

   ObjectDelete(l_orderticket);
   ObjectDelete(l_ordertype);
   ObjectDelete(l_orderlots);
   ObjectDelete(l_orderprofit);
   
   ObjectDelete(l_spread);
   ObjectDelete(l_points);
   
//   ObjectDelete(l_sbs_indi01);
//   ObjectDelete(l_sbs_indi02);

//   ObjectDelete(l_zone_counters);
//   ObjectDelete(l_zone_high_info);
//   ObjectDelete(l_zone_low_info);

//   ObjectDelete(l_dss_of_macd_01);

   ObjectDelete(l_alx_ft_01);
   ObjectDelete(l_alx_tdi_01);

   return;
}

//====================== Create Labels ==============================/

void  Create_Labels()
{

   label_x_distance = 5;
   label_y_distance = 20;
   label_y_step     = 14;
   
//---------------------- Create ----------------------------/

   ObjectCreate(l_symbol,OBJ_LABEL,0,0,0);
   ObjectCreate(l_balance,OBJ_LABEL,0,0,0);
   ObjectCreate(l_equity,OBJ_LABEL,0,0,0);
   ObjectCreate(l_freemargin,OBJ_LABEL,0,0,0);
   ObjectCreate(l_leverage,OBJ_LABEL,0,0,0);
   ObjectCreate(l_margin,OBJ_LABEL,0,0,0);
   ObjectCreate(l_server,OBJ_LABEL,0,0,0);
   ObjectCreate(l_stopoutlevel,OBJ_LABEL,0,0,0);

   ObjectCreate(l_orderticket,OBJ_LABEL,0,0,0);
   ObjectCreate(l_ordertype,OBJ_LABEL,0,0,0);
   ObjectCreate(l_orderlots,OBJ_LABEL,0,0,0);
   ObjectCreate(l_orderprofit,OBJ_LABEL,0,0,0);
   
   ObjectCreate(l_spread,OBJ_LABEL,0,0,0);
   ObjectCreate(l_points,OBJ_LABEL,0,0,0);
   
//   ObjectCreate(l_sbs_indi01,OBJ_LABEL,0,0,0);
//   ObjectCreate(l_sbs_indi02,OBJ_LABEL,0,0,0);

//   ObjectCreate(l_zone_counters,OBJ_LABEL,0,0,0);
//   ObjectCreate(l_zone_high_info,OBJ_LABEL,0,0,0);
//   ObjectCreate(l_zone_low_info,OBJ_LABEL,0,0,0);

//   ObjectCreate(l_dss_of_macd_01,OBJ_LABEL,0,0,0);

   ObjectCreate(l_alx_ft_01,OBJ_LABEL,0,0,0);
   ObjectCreate(l_alx_tdi_01,OBJ_LABEL,0,0,0);
   
//--------------------- X distance ------------------------/
   
   ObjectSet(l_symbol,OBJPROP_XDISTANCE,label_x_distance);
   ObjectSet(l_balance,OBJPROP_XDISTANCE,label_x_distance);
   ObjectSet(l_equity,OBJPROP_XDISTANCE,label_x_distance);
   ObjectSet(l_freemargin,OBJPROP_XDISTANCE,label_x_distance);
   ObjectSet(l_leverage,OBJPROP_XDISTANCE,label_x_distance);
   ObjectSet(l_margin,OBJPROP_XDISTANCE,label_x_distance);
   ObjectSet(l_server,OBJPROP_XDISTANCE,label_x_distance);
   ObjectSet(l_stopoutlevel,OBJPROP_XDISTANCE,label_x_distance);

   ObjectSet(l_orderticket,OBJPROP_XDISTANCE,label_x_distance);
   ObjectSet(l_ordertype,OBJPROP_XDISTANCE,label_x_distance);
   ObjectSet(l_orderlots,OBJPROP_XDISTANCE,label_x_distance);
   ObjectSet(l_orderprofit,OBJPROP_XDISTANCE,label_x_distance);

   ObjectSet(l_spread,OBJPROP_XDISTANCE,label_x_distance);
   ObjectSet(l_points,OBJPROP_XDISTANCE,label_x_distance);
   
//   ObjectSet(l_sbs_indi01,OBJPROP_XDISTANCE,label_x_distance);
//   ObjectSet(l_sbs_indi02,OBJPROP_XDISTANCE,label_x_distance);

//   ObjectSet(l_zone_counters,OBJPROP_XDISTANCE,label_x_distance);
//   ObjectSet(l_zone_high_info,OBJPROP_XDISTANCE,label_x_distance);
//   ObjectSet(l_zone_low_info,OBJPROP_XDISTANCE,label_x_distance);

//   ObjectSet(l_dss_of_macd_01,OBJPROP_XDISTANCE,label_x_distance);

   ObjectSet(l_alx_ft_01,OBJPROP_XDISTANCE,label_x_distance);
   ObjectSet(l_alx_tdi_01,OBJPROP_XDISTANCE,label_x_distance);

//---------------------- Y distance ------------------------------/
   
   ObjectSet(l_symbol,OBJPROP_YDISTANCE,label_y_distance);       label_y_distance += label_y_step;
   ObjectSet(l_balance,OBJPROP_YDISTANCE,label_y_distance);      label_y_distance += label_y_step;
   ObjectSet(l_equity,OBJPROP_YDISTANCE,label_y_distance);       label_y_distance += label_y_step;
   ObjectSet(l_freemargin,OBJPROP_YDISTANCE,label_y_distance);   label_y_distance += label_y_step;
   ObjectSet(l_leverage,OBJPROP_YDISTANCE,label_y_distance);     label_y_distance += label_y_step;
   ObjectSet(l_margin,OBJPROP_YDISTANCE,label_y_distance);       label_y_distance += label_y_step;
   ObjectSet(l_server,OBJPROP_YDISTANCE,label_y_distance);       label_y_distance += label_y_step;
   ObjectSet(l_stopoutlevel,OBJPROP_YDISTANCE,label_y_distance); label_y_distance += label_y_step;

   ObjectSet(l_orderticket,OBJPROP_YDISTANCE,label_y_distance);  label_y_distance += label_y_step;
   ObjectSet(l_ordertype,OBJPROP_YDISTANCE,label_y_distance);    label_y_distance += label_y_step;
   ObjectSet(l_orderlots,OBJPROP_YDISTANCE,label_y_distance);    label_y_distance += label_y_step;
   ObjectSet(l_orderprofit,OBJPROP_YDISTANCE,label_y_distance);  label_y_distance += label_y_step;

   ObjectSet(l_spread,OBJPROP_YDISTANCE,label_y_distance);       label_y_distance += label_y_step;
   ObjectSet(l_points,OBJPROP_YDISTANCE,label_y_distance);       label_y_distance += label_y_step;
   
//   ObjectSet(l_sbs_indi01,OBJPROP_YDISTANCE,label_y_distance);   label_y_distance += label_y_step;
//   ObjectSet(l_sbs_indi02,OBJPROP_YDISTANCE,label_y_distance);   label_y_distance += label_y_step;
   
//   ObjectSet(l_zone_counters,OBJPROP_YDISTANCE,label_y_distance);  label_y_distance += label_y_step;
//   ObjectSet(l_zone_high_info,OBJPROP_YDISTANCE,label_y_distance); label_y_distance += label_y_step;
//   ObjectSet(l_zone_low_info,OBJPROP_YDISTANCE,label_y_distance);  label_y_distance += label_y_step;

//   ObjectSet(l_dss_of_macd_01,OBJPROP_YDISTANCE,label_y_distance);  label_y_distance += label_y_step;

   ObjectSet(l_alx_ft_01,OBJPROP_YDISTANCE,label_y_distance);     label_y_distance += label_y_step;
   ObjectSet(l_alx_tdi_01,OBJPROP_YDISTANCE,label_y_distance);    label_y_distance += label_y_step;

//---------------------- Seyt Text ----------------------------------/
   
   Update_Labels();

//-------------------------------------------------------------------/   

   return;
}

//====================== Update Labels ==============================/

void  Update_Labels()
{
string   stopout;
string   order_s;
//string   dss_signal;

string   indi_01_trend_state = "___";
string   indi_02_trend_state = "___";

string   signal_info = "___";

   stopout = AccountStopoutLevel();
   
   if (AccountStopoutMode() == 0)
   {
      stopout = stopout + "%";
   }

   switch(order_status)
   {
      case NO_ORDER:   {order_s = "___"; break;}
      case BUY_ORDER:  {order_s = "BUY"; break;}
      case SELL_ORDER: {order_s = "SELL"; break;}
   }
/* 
   switch(sbs_indi_01_trend.state)
   {
      case SBS_INDI_NO_STATE:    {indi_01_trend_state = "NOS"; break;}
      case SBS_INDI_UPPER_STATE: {indi_01_trend_state = "UPR"; break;}
      case SBS_INDI_UP_STATE:    {indi_01_trend_state = " UP"; break;}
      case SBS_INDI_LOWER_STATE: {indi_01_trend_state = "LWR"; break;}
      case SBS_INDI_DOWN_STATE:  {indi_01_trend_state = "DWN"; break;}
   }
   
   switch(sbs_indi_02_trend.state)
   {
      case SBS_INDI_NO_STATE:    {indi_02_trend_state = "NOS"; break;}
      case SBS_INDI_UPPER_STATE: {indi_02_trend_state = "UPR"; break;}
      case SBS_INDI_UP_STATE:    {indi_02_trend_state = " UP"; break;}
      case SBS_INDI_LOWER_STATE: {indi_02_trend_state = "LWR"; break;}
      case SBS_INDI_DOWN_STATE:  {indi_02_trend_state = "DWN"; break;}
   }
*/
//------------------------ Text ------------------------------------/
   
   ObjectSetText(l_symbol,"Symbol: " + Symbol() + ", " + Period() + ", " + AccountCurrency() + ", " + 
                          Bars + ", " + ss_wk_number,label_font_size,label_font_name,label_font_color);
   ObjectSetText(l_balance,"Balance: "+DoubleToStr(AccountBalance(),2),label_font_size,label_font_name,label_font_color);
   ObjectSetText(l_equity,"Equity: "+DoubleToStr(AccountEquity(),2),label_font_size,label_font_name,label_font_color);
   ObjectSetText(l_freemargin,"Free Margin: "+DoubleToStr(AccountFreeMargin(),2),label_font_size,label_font_name,label_font_color);
   ObjectSetText(l_leverage,"Leverage: "+AccountLeverage(),label_font_size,label_font_name,label_font_color);
   ObjectSetText(l_margin,"Margin: "+DoubleToStr(AccountMargin(),2),label_font_size,label_font_name,label_font_color);
   ObjectSetText(l_server,"Server: "+AccountServer(),label_font_size,label_font_name,label_font_color);
   ObjectSetText(l_stopoutlevel,"StopoutLevel: "+stopout,label_font_size,label_font_name,label_font_color);

   ObjectSetText(l_orderticket,"Order ticket/Open Time: "+DoubleToStr(order_ticket,0)+" / "+TimeToString(order_open_time,TIME_DATE|TIME_MINUTES),
                  label_font_size,label_font_name,label_font_color);
   ObjectSetText(l_ordertype,"Order type: "+order_s,label_font_size,label_font_name,label_font_color);
   ObjectSetText(l_orderlots,"Order lots: ",label_font_size,label_font_name,label_font_color);
   ObjectSetText(l_orderprofit,"Order Profit: ",label_font_size,label_font_name,label_font_color);

   ObjectSetText(l_spread,"Spread: "+spread,label_font_size,label_font_name,label_font_color);
   ObjectSetText(l_points,"Point: "+DoubleToStr(Point,Digits)+" / "+n_Point,label_font_size,label_font_name,label_font_color);
   
//   ObjectSetText(l_sbs_indi01,"Indi_01 (State/CBar): "+indi_01_trend_state+" / "+
//                               DoubleToStr(sbs_indi_01_trend.cross_bar,0),label_font_size,label_font_name,label_font_color);
//   ObjectSetText(l_sbs_indi02,"Indi_01 (State/CBar): "+indi_02_trend_state+" / "+
//                               DoubleToStr(sbs_indi_02_trend.cross_bar,0),label_font_size,label_font_name,label_font_color);
/*
   ObjectSetText(l_zone_counters,"ZN_CNTRS(T/R/A): "+DoubleToStr(shv_zones_total,0)+"/"+
                                                      DoubleToStr(shv_zones_rejected,0)+"/"+
                                                      DoubleToStr(shv_zones_accepted,0),
                 label_font_size,label_font_name,label_font_color);
                 
   if (sbs_indi_shv_high_zone.zone_found)
   {
      ObjectSetText(l_zone_high_info,"ZN_HI(F/T/ID/H/L/A): Y/"+sbs_indi_shv_high_zone.type+"/"+
                                                      DoubleToStr(sbs_indi_shv_high_zone.id,0)+"/"+
                                                      DoubleToStr(sbs_indi_shv_high_zone.hi,Digits)+"/"+
                                                      DoubleToStr(sbs_indi_shv_high_zone.lo,Digits)+"/"+
                                                      DoubleToStr(sbs_indi_shv_high_zone.age,0),
                 label_font_size,label_font_name,label_font_color);
   }
   else
   {
      ObjectSetText(l_zone_high_info,"ZN_HI(F/T/ID/H/L/A): not found",
                 label_font_size,label_font_name,label_font_color);
   }
   
   if (sbs_indi_shv_low_zone.zone_found)
   {
      ObjectSetText(l_zone_low_info,"ZN_LO(F/T/ID/H/L/A): Y/"+sbs_indi_shv_low_zone.type+"/"+
                                                      DoubleToStr(sbs_indi_shv_low_zone.id,0)+"/"+
                                                      DoubleToStr(sbs_indi_shv_low_zone.hi,Digits)+"/"+
                                                      DoubleToStr(sbs_indi_shv_low_zone.lo,Digits)+"/"+
                                                      DoubleToStr(sbs_indi_shv_low_zone.age,0),
                 label_font_size,label_font_name,label_font_color);
   }
   else
   {
      ObjectSetText(l_zone_low_info,"ZN_HI(F/T/ID/H/L/A): not found",
                 label_font_size,label_font_name,label_font_color);
   }
   
   switch(sbs_indi_dss_of_macd_01.signal)
   {
      case NO_ORDER:   {dss_signal = "___"; break;}
      case BUY_ORDER:  {dss_signal = "BUY"; break;}
      case SELL_ORDER: {dss_signal = "SELL"; break;}
   }

   ObjectSetText(l_dss_of_macd_01,"DSS of MACD: "+dss_signal,label_font_size,label_font_name,label_font_color);
*/
/*
   signal_info = "___";
   
   switch(alx_ft_signal.trend)
   {
      case NO_ORDER:   {signal_info = "---"; break;}
      case BUY_ORDER:  {signal_info = "BUY"; break;}
      case SELL_ORDER: {signal_info = "SELL"; break;}
   }
*/
   ObjectSetText(l_alx_ft_01,"TMA(B/BS): ("+
//                                 IntegerToString(alx_xst_signal.trend_H1,0,' ')+"/"+

                                 DoubleToStr(sbs_alx_tma_basic_hi_data[0],Digits)+"/"+
                                 DoubleToStr(sbs_alx_tma_basic_lo_data[0],Digits)+")("+
                                 DoubleToStr(sbs_alx_tma_basic_short_hi_data[0],Digits)+"/"+
                                 DoubleToStr(sbs_alx_tma_basic_short_lo_data[0],Digits)+")"
   
                                 ,label_font_size,label_font_name,label_font_color);

   signal_info = "___";
  
   switch(alx_tdi_signal.trend)
   {
      case NO_ORDER:         {signal_info = "---"; break;}
      case BUY_ORDER:        {signal_info = "BUY"; break;}
      case SELL_ORDER:       {signal_info = "SELL"; break;}
      case CLOSE_BUY_ORDER:  {signal_info = "C_BUY"; break;}
      case CLOSE_SELL_ORDER: {signal_info = "C_SELL"; break;}
   }

   ObjectSetText(l_alx_tdi_01,"TMA (U1): ("+
//                                 DoubleToStr(alx_tdi_signal.bandUp,Digits)+"/"+
//                                 DoubleToStr(alx_tdi_signal.bandMiddle ,Digits)+"/"+
//                                 DoubleToStr(alx_tdi_signal.bandDown,Digits)+"/"+
//                                 DoubleToStr(alx_tdi_signal.rsiPriceLine,Digits)+"/"+
//                                 DoubleToStr(alx_tdi_signal.rsiSignalLine,Digits)

                                 DoubleToStr(sbs_alx_tma_upper1_hi_data[0],Digits)+"/"+
                                 DoubleToStr(sbs_alx_tma_upper1_lo_data[0],Digits)+")"

                                
                                
                     ,label_font_size,label_font_name,label_font_color);
   
//--------------------------------------------------------------------/ 

   return;
}

//======================== Delete_SHV_Lines ==========================/

void     Delete_SHV_Lines()
{
   ObjectDelete(0,SBS_SHV_HI_ZONE_HI_LINE_NAME);
   ObjectDelete(0,SBS_SHV_HI_ZONE_LO_LINE_NAME);
   ObjectDelete(0,SBS_SHV_LO_ZONE_HI_LINE_NAME);
   ObjectDelete(0,SBS_SHV_LO_ZONE_LO_LINE_NAME);
   ObjectDelete(0,SBS_SHV_ZONE_MIDDLE_LINE_NAME);

//--------------------------------------------------------------------/ 

   return;
}

//======================== Update_SHV_Lines ==========================/

void     Update_SHV_Lines()
{
//------------------------ Delete SHV Lines --------------------------/

   Delete_SHV_Lines();
   
//----------------------- Create SHV Lines (Inside Zone) -------------/

   if (
         (sbs_indi_shv_high_zone.zone_found) &&
         (sbs_indi_shv_low_zone.zone_found) &&
         (sbs_indi_shv_high_zone.id == sbs_indi_shv_low_zone.id)
      )
   {
      ObjectCreate(0,SBS_SHV_HI_ZONE_HI_LINE_NAME,OBJ_HLINE,0,0,sbs_indi_shv_high_zone.hi);
      ObjectCreate(0,SBS_SHV_HI_ZONE_LO_LINE_NAME,OBJ_HLINE,0,0,sbs_indi_shv_high_zone.lo);
      
      ObjectSetInteger(0,SBS_SHV_HI_ZONE_HI_LINE_NAME,OBJPROP_COLOR,SBS_SHV_HH_COLOR);
      ObjectSetInteger(0,SBS_SHV_HI_ZONE_LO_LINE_NAME,OBJPROP_COLOR,SBS_SHV_HL_COLOR);
      
      ObjectSetInteger(0,SBS_SHV_HI_ZONE_HI_LINE_NAME,OBJPROP_STYLE,STYLE_DASH);
      ObjectSetInteger(0,SBS_SHV_HI_ZONE_LO_LINE_NAME,OBJPROP_STYLE,STYLE_DASH);
      
      ObjectSetInteger(0,SBS_SHV_HI_ZONE_HI_LINE_NAME,OBJPROP_BACK,false);
      ObjectSetInteger(0,SBS_SHV_HI_ZONE_LO_LINE_NAME,OBJPROP_BACK,false);

      return;
   }

//----------------------- Create SHV Lines (High Zone) ---------------/

   if (
         (sbs_indi_shv_high_zone.zone_found)
      )
   {
      ObjectCreate(0,SBS_SHV_HI_ZONE_HI_LINE_NAME,OBJ_HLINE,0,0,sbs_indi_shv_high_zone.hi);
      ObjectCreate(0,SBS_SHV_HI_ZONE_LO_LINE_NAME,OBJ_HLINE,0,0,sbs_indi_shv_high_zone.lo);
      
      ObjectSetInteger(0,SBS_SHV_HI_ZONE_HI_LINE_NAME,OBJPROP_COLOR,SBS_SHV_HH_COLOR);
      ObjectSetInteger(0,SBS_SHV_HI_ZONE_LO_LINE_NAME,OBJPROP_COLOR,SBS_SHV_HL_COLOR);
      
      ObjectSetInteger(0,SBS_SHV_HI_ZONE_HI_LINE_NAME,OBJPROP_BACK,false);
      ObjectSetInteger(0,SBS_SHV_HI_ZONE_LO_LINE_NAME,OBJPROP_BACK,false);
   }

//----------------------- Create SHV Lines (Low Zone) ----------------/

   if (
         (sbs_indi_shv_low_zone.zone_found)
      )
   {
      ObjectCreate(0,SBS_SHV_LO_ZONE_HI_LINE_NAME,OBJ_HLINE,0,0,sbs_indi_shv_low_zone.hi);
      ObjectCreate(0,SBS_SHV_LO_ZONE_LO_LINE_NAME,OBJ_HLINE,0,0,sbs_indi_shv_low_zone.lo);
      
      ObjectSetInteger(0,SBS_SHV_LO_ZONE_HI_LINE_NAME,OBJPROP_COLOR,SBS_SHV_LH_COLOR);
      ObjectSetInteger(0,SBS_SHV_LO_ZONE_LO_LINE_NAME,OBJPROP_COLOR,SBS_SHV_LL_COLOR);
      
      ObjectSetInteger(0,SBS_SHV_LO_ZONE_HI_LINE_NAME,OBJPROP_BACK,false);
      ObjectSetInteger(0,SBS_SHV_LO_ZONE_LO_LINE_NAME,OBJPROP_BACK,false);
   }

//----------------------- Create SHV Line (Middle between Zones) -----/

   if (
         (sbs_indi_shv_high_zone.zone_found) &&
         (sbs_indi_shv_low_zone.zone_found)
      )
   {
      ObjectCreate(0,SBS_SHV_LO_ZONE_HI_LINE_NAME,OBJ_HLINE,0,0,
                   sbs_indi_shv_high_zone.lo - (0.5 * (sbs_indi_shv_high_zone.lo - sbs_indi_shv_low_zone.hi)));

      ObjectSetInteger(0,SBS_SHV_ZONE_MIDDLE_LINE_NAME,OBJPROP_COLOR,SBS_SHV_ZM_COLOR);
      
      ObjectSetInteger(0,SBS_SHV_ZONE_MIDDLE_LINE_NAME,OBJPROP_BACK,false);
   }

//--------------------------------------------------------------------/ 

   return;
}

//======================== Delete_FT_ZZL_Lines =======================/

void     Delete_FT_ZZL_Lines()
{
   ObjectDelete(0,SBS_FT3_SIGNAL_BAR_LNAME);

//--------------------------------------------------------------------/ 

   return;
}

//======================== Update_FT_ZZL_Lines =======================/

void     Update_FT_ZZL_Lines()
{
//------------------------ Create/Update FT3 Signal Bar Vertical Line /

   if (
         (sbs_ft_zzl_profile.ft3_signal != NO_ORDER) &&
         (sbs_ft_zzl_profile.ft3_bar != NO_BAR_NUMBER)
      )
   {
//--- Check if line does not exist ---/

      if (
            (ObjectFind(SBS_FT3_SIGNAL_BAR_LNAME) < 0)
         )
      {
      
         ObjectCreate(0,SBS_FT3_SIGNAL_BAR_LNAME,OBJ_VLINE,0,Time[sbs_ft_zzl_profile.ft3_bar],0);
      
         ObjectSetInteger(0,SBS_FT3_SIGNAL_BAR_LNAME,OBJPROP_COLOR,SBS_FT3_SIGNAL_BAR_COLOR);
         ObjectSetInteger(0,SBS_FT3_SIGNAL_BAR_LNAME,OBJPROP_STYLE,SBS_FT3_SIGNAL_BAR_STYLE);
         ObjectSetInteger(0,SBS_FT3_SIGNAL_BAR_LNAME,OBJPROP_WIDTH,SBS_FT3_SIGNAL_BAR_WIDTH);
         ObjectSetInteger(0,SBS_FT3_SIGNAL_BAR_LNAME,OBJPROP_BACK,false);
      }

//--- Update if needed ---/

      if (ObjectGet(SBS_FT3_SIGNAL_BAR_LNAME,OBJPROP_TIME1) != Time[sbs_ft_zzl_profile.ft3_bar])
      {
         ObjectSet(SBS_FT3_SIGNAL_BAR_LNAME,OBJPROP_TIME1,Time[sbs_ft_zzl_profile.ft3_bar]);
      }
   
   }

//------------------------ Create/Update FT3 Signal Bounce Line ------/
/*
   if (
         (sbs_ft_zzl_profile.ft3_signal != NO_ORDER) &&
         (sbs_ft_zzl_profile.ft3_bar != NO_BAR_NUMBER) &&
         (sbs_ft_zzl_profile.ft3_second_bar != NO_BAR_NUMBER) &&
         (sbs_ft_zzl_profile.ft3_bounce_bar != NO_BAR_NUMBER)
      )
   {
//--- Check if line does not exist ---/

      if (
            (ObjectFind(SBS_FT3_BOUNCE_BAR_LNAME) < 0)
         )
      {
         ObjectCreate(0,SBS_FT3_BOUNCE_BAR_LNAME,OBJ_HLINE,0,0,sbs_ft_zzl_profile.ft3_bounce_val);
      
         ObjectSetInteger(0,SBS_FT3_BOUNCE_BAR_LNAME,OBJPROP_COLOR,SBS_FT3_BOUNCE_BAR_COLOR);
         ObjectSetInteger(0,SBS_FT3_BOUNCE_BAR_LNAME,OBJPROP_STYLE,SBS_FT3_BOUNCE_BAR_STYLE);
         ObjectSetInteger(0,SBS_FT3_BOUNCE_BAR_LNAME,OBJPROP_WIDTH,SBS_FT3_BOUNCE_BAR_WIDTH);
         ObjectSetInteger(0,SBS_FT3_BOUNCE_BAR_LNAME,OBJPROP_BACK,false);
      }

//--- Update if needed ---/

      if (ObjectGet(SBS_FT3_BOUNCE_BAR_LNAME,OBJPROP_PRICE1) != sbs_ft_zzl_profile.ft3_bounce_val)
      {
         ObjectSet(SBS_FT3_BOUNCE_BAR_LNAME,OBJPROP_PRICE1,sbs_ft_zzl_profile.ft3_bounce_val);
      }
   
   }
*/   

//------------------------ Create/Update FT3 Signal Hi Level Line ------/

   if (
         (sbs_ft_zzl_profile.ft3_signal != NO_ORDER) &&
         (sbs_ft_zzl_profile.ft3_bounce_bar != NO_BAR_NUMBER) &&
         (sbs_ft_zzl_profile.ft3_extremum_bar != NO_BAR_NUMBER)
      )
   {
//--- Check if HI LINE does not exist ---/

      if (
            (ObjectFind(SBS_FT3_HI_LINE_LNAME) < 0)
         )
      {
         ObjectCreate(0,SBS_FT3_HI_LINE_LNAME,OBJ_HLINE,0,0,sbs_ft_zzl_case.hi_level);
      
         ObjectSetInteger(0,SBS_FT3_HI_LINE_LNAME,OBJPROP_COLOR,SBS_FT3_HI_LINE_COLOR);
         ObjectSetInteger(0,SBS_FT3_HI_LINE_LNAME,OBJPROP_STYLE,SBS_FT3_HI_LINE_STYLE);
         ObjectSetInteger(0,SBS_FT3_HI_LINE_LNAME,OBJPROP_WIDTH,SBS_FT3_HI_LINE_WIDTH);
         ObjectSetInteger(0,SBS_FT3_HI_LINE_LNAME,OBJPROP_BACK,false);
      }

//--- Update if needed ---/

      if (ObjectGet(SBS_FT3_HI_LINE_LNAME,OBJPROP_PRICE1) != sbs_ft_zzl_case.hi_level)
      {
         ObjectSet(SBS_FT3_HI_LINE_LNAME,OBJPROP_PRICE1,sbs_ft_zzl_case.hi_level);
      }
   
   }

//------------------------ Create/Update FT3 Signal Lo Level Line ------/

   if (
         (sbs_ft_zzl_profile.ft3_signal != NO_ORDER) &&
         (sbs_ft_zzl_profile.ft3_bounce_bar != NO_BAR_NUMBER) &&
         (sbs_ft_zzl_profile.ft3_extremum_bar != NO_BAR_NUMBER)
      )
   {
//--- Check if LO LINE does not exist ---/

      if (
            (ObjectFind(SBS_FT3_LO_LINE_LNAME) < 0)
         )
      {
         ObjectCreate(0,SBS_FT3_LO_LINE_LNAME,OBJ_HLINE,0,0,sbs_ft_zzl_case.lo_level);
      
         ObjectSetInteger(0,SBS_FT3_LO_LINE_LNAME,OBJPROP_COLOR,SBS_FT3_LO_LINE_COLOR);
         ObjectSetInteger(0,SBS_FT3_LO_LINE_LNAME,OBJPROP_STYLE,SBS_FT3_LO_LINE_STYLE);
         ObjectSetInteger(0,SBS_FT3_LO_LINE_LNAME,OBJPROP_WIDTH,SBS_FT3_LO_LINE_WIDTH);
         ObjectSetInteger(0,SBS_FT3_LO_LINE_LNAME,OBJPROP_BACK,false);
      }

//--- Update if needed ---/

      if (ObjectGet(SBS_FT3_LO_LINE_LNAME,OBJPROP_PRICE1) != sbs_ft_zzl_case.lo_level)
      {
         ObjectSet(SBS_FT3_LO_LINE_LNAME,OBJPROP_PRICE1,sbs_ft_zzl_case.lo_level);
      }
   
   }

//------------------------ Create/Update FT3 Signal Md Level Line ------/

   if (
         (sbs_ft_zzl_profile.ft3_signal != NO_ORDER) &&
         (sbs_ft_zzl_profile.ft3_bounce_bar != NO_BAR_NUMBER) &&
         (sbs_ft_zzl_profile.ft3_extremum_bar != NO_BAR_NUMBER)
      )
   {
//--- Check if MD LINE does not exist ---/

      if (
            (ObjectFind(SBS_FT3_MD_LINE_LNAME) < 0)
         )
      {
         ObjectCreate(0,SBS_FT3_MD_LINE_LNAME,OBJ_HLINE,0,0,sbs_ft_zzl_case.md_level);
      
         ObjectSetInteger(0,SBS_FT3_MD_LINE_LNAME,OBJPROP_COLOR,SBS_FT3_MD_LINE_COLOR);
         ObjectSetInteger(0,SBS_FT3_MD_LINE_LNAME,OBJPROP_STYLE,SBS_FT3_MD_LINE_STYLE);
         ObjectSetInteger(0,SBS_FT3_MD_LINE_LNAME,OBJPROP_WIDTH,SBS_FT3_MD_LINE_WIDTH);
         ObjectSetInteger(0,SBS_FT3_MD_LINE_LNAME,OBJPROP_BACK,false);
      }

//--- Update if needed ---/

      if (ObjectGet(SBS_FT3_MD_LINE_LNAME,OBJPROP_PRICE1) != sbs_ft_zzl_case.md_level)
      {
         ObjectSet(SBS_FT3_MD_LINE_LNAME,OBJPROP_PRICE1,sbs_ft_zzl_case.md_level);
      }
   
   }

//--------------------------------------------------------------------/ 

   return;
}


//====================== SBS_UpdateIndication =========================/

void     SBS_UpdateIndication()
{
//------------------------ Update Labels ------------------------------/

   Update_Labels();

//------------------------ Update Lines -------------------------------/

//   Update_SHV_Lines();
   Update_FT_ZZL_Lines();

//------------------------ Redraw Current Chart -----------------------/

   ChartRedraw(0);
   
   return;
}

//================== eof sbs_exp_labels_lbr.mqh ========================/
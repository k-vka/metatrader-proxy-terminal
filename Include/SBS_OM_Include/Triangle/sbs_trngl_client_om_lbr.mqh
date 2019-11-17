//================== sbs_trngl_client_om_lbr.mqh ===========================/

//========================= Init_SBS_Client_Order_Management =============/

void     Init_SBS_Triangle_Client_Order_Management()
{
int      i;
int      j;

   for (i = 0; i < SBS_TRIANGLE_DESCRIPTOR_NUMBER; i++)
   {
      for (j = 0; j < SBS_TRIANGLE_DESCRIPTOR_ASSOCIATE_ORDER_NUMBER; j++)
      {
//--- order_online ---/

         sbs_triangle_client_order_data.client_order_descriptor[i].client_order[j].order_online.ticket      = -1;
         sbs_triangle_client_order_data.client_order_descriptor[i].client_order[j].order_online.signal      = NO_ORDER;
         sbs_triangle_client_order_data.client_order_descriptor[i].client_order[j].order_online.order_price = 0;
         sbs_triangle_client_order_data.client_order_descriptor[i].client_order[j].order_online.stoploss    = 0;
         sbs_triangle_client_order_data.client_order_descriptor[i].client_order[j].order_online.order_time  = 0;
         
         sbs_triangle_client_order_data.client_order_descriptor[i].client_order[j].order_online.stoploss_change_time = 0;

//--- order_synch ---/

         sbs_triangle_client_order_data.client_order_descriptor[i].client_order[j].order_synch.signal      = NO_ORDER;
         sbs_triangle_client_order_data.client_order_descriptor[i].client_order[j].order_synch.order_price = 0;
         sbs_triangle_client_order_data.client_order_descriptor[i].client_order[j].order_synch.stoploss    = 0;
         sbs_triangle_client_order_data.client_order_descriptor[i].client_order[j].order_synch.order_time  = 0;
         sbs_triangle_client_order_data.client_order_descriptor[i].client_order[j].order_synch.synch_time  = 0;
      }
   }
   
   for (i = 0; i < SBS_TRIANGLE_DESCRIPTOR_NUMBER; i++)
   {
//--- order_phf ---/

         sbs_triangle_client_order_data.client_order_descriptor[i].order_phf.signal     = NO_ORDER;
         sbs_triangle_client_order_data.client_order_descriptor[i].order_phf.state      = SBS_TRIANGLE_ORDER_NO_STATE;
         sbs_triangle_client_order_data.client_order_descriptor[i].order_phf.synch_time = 0;
         sbs_triangle_client_order_data.client_order_descriptor[i].order_phf.price      = 0;
         sbs_triangle_client_order_data.client_order_descriptor[i].order_phf.stoploss   = 0;
         sbs_triangle_client_order_data.client_order_descriptor[i].order_phf.target     = 0;
   }
   
//------------------------------------------------------------------------/

   return;
}

//======================= SBS_Triangle_Client_Get_OM_Context ===============/

void   SBS_Triangle_Client_Get_OM_Context()
{
int      total_orders;
int      order_type;
int      order_magic_no;

int      i;
int      j;
int      order_no;

//------------------------- Reset order_online Data ------------------------/
   
   for (i = 0; i < SBS_TRIANGLE_DESCRIPTOR_NUMBER; i++)
   {
      for (j = 0; j < SBS_TRIANGLE_DESCRIPTOR_ASSOCIATE_ORDER_NUMBER; j++)
      {
//--- order_online ---/

         sbs_triangle_client_order_data.client_order_descriptor[i].client_order[j].order_online.signal = NO_ORDER;
      }
   }
   
//------------------------- Get Open Orders Data -----------------------/

//--- Symbol & Account Data ---/

   sbs_client_order_state.free_margin       = AccountFreeMargin();
   sbs_client_order_state.leverage          = AccountLeverage();
   
   sbs_client_order_state.spread            = MarketInfo(Symbol(),MODE_SPREAD);
   sbs_client_order_state.one_lot_tick_cost = MarketInfo(Symbol(),MODE_TICKVALUE);
   sbs_client_order_state.min_lot           = MarketInfo(Symbol(),MODE_MINLOT);
   sbs_client_order_state.max_lot           = MarketInfo(Symbol(),MODE_MAXLOT);
   sbs_client_order_state.lot_step          = MarketInfo(Symbol(),MODE_LOTSTEP);

//--- total_orders ---/

   total_orders = OrdersTotal();

//--- check each open order ---/

   if (total_orders > 0)
   {
      for (order_no = 0; order_no < total_orders ; order_no++)
      {
         if (OrderSelect(order_no, SELECT_BY_POS, MODE_TRADES) == true)
         {
            if (OrderSymbol() == Symbol())
            {
               order_type     = OrderType();
               order_magic_no = OrderMagicNumber();

               for (i = 0; i < SBS_TRIANGLE_DESCRIPTOR_NUMBER; i++)
               {
                  for (j = 0; j < SBS_TRIANGLE_DESCRIPTOR_ASSOCIATE_ORDER_NUMBER; j++)
                  {
//--- check for BUY Order ---/

                     if (
                           (order_type     == OP_BUY) &&
                           (order_magic_no == SBS_CLIENT_BUY_ORDER_MAGIC_NUMBER + (100 * i) + j)
                        )
                     {
                        sbs_triangle_client_order_data.client_order_descriptor[i].client_order[j].order_online.ticket      = OrderTicket();
                        sbs_triangle_client_order_data.client_order_descriptor[i].client_order[j].order_online.signal      = BUY_ORDER;
                        sbs_triangle_client_order_data.client_order_descriptor[i].client_order[j].order_online.order_price = OrderOpenPrice();
                        sbs_triangle_client_order_data.client_order_descriptor[i].client_order[j].order_online.stoploss    = OrderStopLoss();
                        sbs_triangle_client_order_data.client_order_descriptor[i].client_order[j].order_online.order_time  = OrderOpenTime();
                     }

//--- check for SELL Order ---/

                     if (
                           (order_type     == OP_SELL) &&
                           (order_magic_no == SBS_CLIENT_SELL_ORDER_MAGIC_NUMBER + (100 * i) + j)
                        )
                     {
                        sbs_triangle_client_order_data.client_order_descriptor[i].client_order[j].order_online.ticket      = OrderTicket();
                        sbs_triangle_client_order_data.client_order_descriptor[i].client_order[j].order_online.signal      = SELL_ORDER;
                        sbs_triangle_client_order_data.client_order_descriptor[i].client_order[j].order_online.order_price = OrderOpenPrice();
                        sbs_triangle_client_order_data.client_order_descriptor[i].client_order[j].order_online.stoploss    = OrderStopLoss();
                        sbs_triangle_client_order_data.client_order_descriptor[i].client_order[j].order_online.order_time  = OrderOpenTime();
                     }
                  
                  }     // EOF for (j = 0; j < SBS_TRIANGLE_DESCRIPTOR_ASSOCIATE_ORDER_NUMBER; j++)
               }     // EOF for (i = 0; i < SBS_TRIANGLE_DESCRIPTOR_NUMBER; i++)
               
            }
         }
         else        // OrderSelect error
         {
            Print("DFMC_ODATA: SBS_Triangle_Client_Get_OM_Context() ERROR error=" + IntegerToString(GetLastError(),0) + ", order_no=" + IntegerToString(order_no,0));
         }
      }
   }

//--------------------------------------------------------------------------/

   return;
}

//======================= SBS_Triangle_Client_OM_Processing ================/

void   SBS_Triangle_Client_OM_Processing()
{
int      i;
int      j;

//--- Reset operation_label_data ---/

//   sbs_client_order_state.operation_label_data = "";

//----------------------- SYNCH vs OPEN ------------------------------------/

   for (i = 0; i < SBS_TRIANGLE_DESCRIPTOR_NUMBER; i++)
   {
      for (j = 0; j < SBS_TRIANGLE_DESCRIPTOR_ASSOCIATE_ORDER_NUMBER; j++)
      {
//--- (BUY_ORDER or SELL_ORDER) vs NO_ORDER ---/

         if (
               (sbs_triangle_client_order_data.client_order_descriptor[i].client_order[j].order_online.signal == NO_ORDER) &&
               (sbs_triangle_client_order_data.client_order_descriptor[i].client_order[j].order_synch.signal != NO_ORDER)
            )
         {
            SBS_Triangle_Client_Synch_ONLINE_Order(i,j);
         }

//--- (NOT BUY_ORDER) vs BUY_ORDER ---/

         if (
               (sbs_triangle_client_order_data.client_order_descriptor[i].client_order[j].order_online.signal == BUY_ORDER) &&
               (sbs_triangle_client_order_data.client_order_descriptor[i].client_order[j].order_synch.signal != BUY_ORDER)
            )
         {
            SBS_Triangle_Client_Synch_ONLINE_Order(i,j);
         }

//--- (NOT SELL_ORDER) vs SELL_ORDER ---/

         if (
               (sbs_triangle_client_order_data.client_order_descriptor[i].client_order[j].order_online.signal == SELL_ORDER) &&
               (sbs_triangle_client_order_data.client_order_descriptor[i].client_order[j].order_synch.signal != SELL_ORDER)
            )
         {
            SBS_Triangle_Client_Synch_ONLINE_Order(i,j);
         }
         
      }     // EOF for (j = 0; j < SBS_TRIANGLE_DESCRIPTOR_ASSOCIATE_ORDER_NUMBER; j++)
   }     // EOF for (i = 0; i < SBS_TRIANGLE_DESCRIPTOR_NUMBER; i++)

//----------------------- Check SYNCH Order vs PHF Order -------------------/

   for (i = 0; i < SBS_TRIANGLE_DESCRIPTOR_NUMBER; i++)
   {

//--- NO_ORDER vs (BUY_ORDER or SELL_ORDER) ---/   SIMPLE OPEN

      if (
            (
               (sbs_triangle_client_order_data.client_order_descriptor[i].client_order[0].order_synch.signal == NO_ORDER) &&
               (sbs_triangle_client_order_data.client_order_descriptor[i].client_order[1].order_synch.signal == NO_ORDER) &&
               (sbs_triangle_client_order_data.client_order_descriptor[i].client_order[2].order_synch.signal == NO_ORDER)
            ) &&
            
            (
               (sbs_triangle_client_order_data.client_order_descriptor[i].order_phf.signal == BUY_ORDER) ||
               (sbs_triangle_client_order_data.client_order_descriptor[i].order_phf.signal == SELL_ORDER)
            ) &&
            
            (sbs_triangle_client_order_data.client_order_descriptor[i].order_phf.state == SBS_TRIANGLE_ORDER_OPEN_STAGE_1)
         )
      {
      
//--- Check Open Order FLAGS ---/

         if (
               (sbs_client_order_state.sbs_global_operational_data.open_order_flag  == SBS_CLIENT_FLAG_SET_VALUE) &&
               (sbs_client_order_state.sbs_private_operational_data.open_order_flag == SBS_CLIENT_FLAG_SET_VALUE) &&
               
               (
                  (sbs_client_order_state.sbs_private_operational_data.obs_order_val == SBS_CLIENT_FLAG_NOT_SET_VALUE) ||
               
                  (
                     (sbs_client_order_state.sbs_private_operational_data.obs_order_val == SELL_ORDER) &&
                     (sbs_triangle_client_order_data.client_order_descriptor[i].order_phf.signal == SELL_ORDER)
                  ) ||
                  
                  (
                     (sbs_client_order_state.sbs_private_operational_data.obs_order_val == BUY_ORDER) &&
                     (sbs_triangle_client_order_data.client_order_descriptor[i].order_phf.signal == BUY_ORDER)
                  )
               )
            )
         {
            Print(">>> OPEN_SIMPLE: " +
                         "descr_no=" + IntegerToString(i,0) + ", " +
                    "synch_signal=(" + IntegerToString(sbs_triangle_client_order_data.client_order_descriptor[i].client_order[0].order_synch.signal,0) + "," +
                                       IntegerToString(sbs_triangle_client_order_data.client_order_descriptor[i].client_order[1].order_synch.signal,0) + "," +
                                       IntegerToString(sbs_triangle_client_order_data.client_order_descriptor[i].client_order[2].order_synch.signal,0) + ")," +
                       "phf_signal=" + IntegerToString(sbs_triangle_client_order_data.client_order_descriptor[i].order_phf.signal,0) + "," +
                        "phf_state=" + IntegerToString(sbs_triangle_client_order_data.client_order_descriptor[i].order_phf.state,0)
            );
      
            SBS_Triangle_Client_OM_Open_Order(i);
         }

         continue;
      }

//--- BUY_ORDER vs (SELL_ORDER or (NO_ORDER and SBS_TRIANGLE_ORDER_NO_STATE)) ---/     REVERSE OPEN / CLOSE ALL
         
      if (
            (
               (sbs_triangle_client_order_data.client_order_descriptor[i].client_order[0].order_synch.signal == BUY_ORDER) ||
               (sbs_triangle_client_order_data.client_order_descriptor[i].client_order[1].order_synch.signal == BUY_ORDER) ||
               (sbs_triangle_client_order_data.client_order_descriptor[i].client_order[2].order_synch.signal == BUY_ORDER)
            ) &&
            
            (
               (sbs_triangle_client_order_data.client_order_descriptor[i].order_phf.signal == SELL_ORDER) ||
               
               (
                  (sbs_triangle_client_order_data.client_order_descriptor[i].order_phf.signal == NO_ORDER) &&                    // CLOSE ALL ORDERS
                  (sbs_triangle_client_order_data.client_order_descriptor[i].order_phf.state  == SBS_TRIANGLE_ORDER_NO_STATE)
               )
            )
         )
      {
         Print(">>> BUY_CLOSE_REVERSE: " +
                         "descr_no=" + IntegerToString(i,0) + ", " +
                    "synch_signal=(" + IntegerToString(sbs_triangle_client_order_data.client_order_descriptor[i].client_order[0].order_synch.signal,0) + "," +
                                       IntegerToString(sbs_triangle_client_order_data.client_order_descriptor[i].client_order[1].order_synch.signal,0) + "," +
                                       IntegerToString(sbs_triangle_client_order_data.client_order_descriptor[i].client_order[2].order_synch.signal,0) + ")," +
                       "phf_signal=" + IntegerToString(sbs_triangle_client_order_data.client_order_descriptor[i].order_phf.signal,0) + "," +
                        "phf_state=" + IntegerToString(sbs_triangle_client_order_data.client_order_descriptor[i].order_phf.state,0)
         );
         
         SBS_Triangle_Client_OM_Close_Order(i,SBS_TRIANGLE_ORDER_OPEN_STAGE_3);                    // Close all orders
         
         if (
               (
                  (sbs_triangle_client_order_data.client_order_descriptor[i].client_order[0].order_synch.signal == NO_ORDER) &&
                  (sbs_triangle_client_order_data.client_order_descriptor[i].client_order[1].order_synch.signal == NO_ORDER) &&
                  (sbs_triangle_client_order_data.client_order_descriptor[i].client_order[2].order_synch.signal == NO_ORDER)
               ) &&
               
               (sbs_triangle_client_order_data.client_order_descriptor[i].order_phf.signal == SELL_ORDER)
            )
         {
            Print(">>> BUY_OPEN_REVERSE: " +
                         "descr_no=" + IntegerToString(i,0) + ", " +
                    "synch_signal=(" + IntegerToString(sbs_triangle_client_order_data.client_order_descriptor[i].client_order[0].order_synch.signal,0) + "," +
                                       IntegerToString(sbs_triangle_client_order_data.client_order_descriptor[i].client_order[1].order_synch.signal,0) + "," +
                                       IntegerToString(sbs_triangle_client_order_data.client_order_descriptor[i].client_order[2].order_synch.signal,0) + ")," +
                       "phf_signal=" + IntegerToString(sbs_triangle_client_order_data.client_order_descriptor[i].order_phf.signal,0) + "," +
                        "phf_state=" + IntegerToString(sbs_triangle_client_order_data.client_order_descriptor[i].order_phf.state,0)
            );
         
            SBS_Triangle_Client_OM_Open_Order(i);
         }
         
         continue;
      }

//--- SELL_ORDER vs (BUY_ORDER or (NO_ORDER and SBS_TRIANGLE_ORDER_NO_STATE)) ---/     REVERSE OPEN / CLOSE ALL
         
      if (
            (
               (sbs_triangle_client_order_data.client_order_descriptor[i].client_order[0].order_synch.signal == SELL_ORDER) ||
               (sbs_triangle_client_order_data.client_order_descriptor[i].client_order[1].order_synch.signal == SELL_ORDER) ||
               (sbs_triangle_client_order_data.client_order_descriptor[i].client_order[2].order_synch.signal == SELL_ORDER)
            ) &&
            
            (
               (sbs_triangle_client_order_data.client_order_descriptor[i].order_phf.signal == BUY_ORDER) ||
               
               (
                  (sbs_triangle_client_order_data.client_order_descriptor[i].order_phf.signal == NO_ORDER) &&                    // CLOSE ALL ORDERS
                  (sbs_triangle_client_order_data.client_order_descriptor[i].order_phf.state  == SBS_TRIANGLE_ORDER_NO_STATE)
               )
            )
         )
      {
         Print(">>> SELL_CLOSE_REVERSE: " +
                         "descr_no=" + IntegerToString(i,0) + ", " +
                    "synch_signal=(" + IntegerToString(sbs_triangle_client_order_data.client_order_descriptor[i].client_order[0].order_synch.signal,0) + "," +
                                       IntegerToString(sbs_triangle_client_order_data.client_order_descriptor[i].client_order[1].order_synch.signal,0) + "," +
                                       IntegerToString(sbs_triangle_client_order_data.client_order_descriptor[i].client_order[2].order_synch.signal,0) + ")," +
                       "phf_signal=" + IntegerToString(sbs_triangle_client_order_data.client_order_descriptor[i].order_phf.signal,0) + "," +
                        "phf_state=" + IntegerToString(sbs_triangle_client_order_data.client_order_descriptor[i].order_phf.state,0)
         );
         
         SBS_Triangle_Client_OM_Close_Order(i,SBS_TRIANGLE_ORDER_OPEN_STAGE_3);                    // Close all orders
         
         if (
               (
                  (sbs_triangle_client_order_data.client_order_descriptor[i].client_order[0].order_synch.signal == NO_ORDER) &&
                  (sbs_triangle_client_order_data.client_order_descriptor[i].client_order[1].order_synch.signal == NO_ORDER) &&
                  (sbs_triangle_client_order_data.client_order_descriptor[i].client_order[2].order_synch.signal == NO_ORDER)
               ) &&
               
               (sbs_triangle_client_order_data.client_order_descriptor[i].order_phf.signal == BUY_ORDER)
            )
         {
            Print(">>> SELL_OPEN_REVERSE: " +
                         "descr_no=" + IntegerToString(i,0) + ", " +
                    "synch_signal=(" + IntegerToString(sbs_triangle_client_order_data.client_order_descriptor[i].client_order[0].order_synch.signal,0) + "," +
                                       IntegerToString(sbs_triangle_client_order_data.client_order_descriptor[i].client_order[1].order_synch.signal,0) + "," +
                                       IntegerToString(sbs_triangle_client_order_data.client_order_descriptor[i].client_order[2].order_synch.signal,0) + ")," +
                       "phf_signal=" + IntegerToString(sbs_triangle_client_order_data.client_order_descriptor[i].order_phf.signal,0) + "," +
                        "phf_state=" + IntegerToString(sbs_triangle_client_order_data.client_order_descriptor[i].order_phf.state,0)
            );
            
            SBS_Triangle_Client_OM_Open_Order(i);
         }
         
         continue;
      }

//--- BUY_ORDER vs (BUY_ORDER and SBS_TRIANGLE_ORDER_OPEN_STAGE_3) ---/     RENEW ORDER
         
      if (
            (
               (sbs_triangle_client_order_data.client_order_descriptor[i].client_order[0].order_synch.signal == NO_ORDER) &&
               (sbs_triangle_client_order_data.client_order_descriptor[i].client_order[1].order_synch.signal == NO_ORDER) &&
               (sbs_triangle_client_order_data.client_order_descriptor[i].client_order[2].order_synch.signal == BUY_ORDER)
            ) &&
            
            (
               (
                  (sbs_triangle_client_order_data.client_order_descriptor[i].order_phf.signal == BUY_ORDER) &&
                  (sbs_triangle_client_order_data.client_order_descriptor[i].order_phf.state  == SBS_TRIANGLE_ORDER_OPEN_STAGE_1)
               )
            )
         )
      {
         Print(">>> BUY_OPEN_RENEW: " +
                         "descr_no=" + IntegerToString(i,0) + ", " +
                    "synch_signal=(" + IntegerToString(sbs_triangle_client_order_data.client_order_descriptor[i].client_order[0].order_synch.signal,0) + "," +
                                       IntegerToString(sbs_triangle_client_order_data.client_order_descriptor[i].client_order[1].order_synch.signal,0) + "," +
                                       IntegerToString(sbs_triangle_client_order_data.client_order_descriptor[i].client_order[2].order_synch.signal,0) + ")," +
                       "phf_signal=" + IntegerToString(sbs_triangle_client_order_data.client_order_descriptor[i].order_phf.signal,0) + "," +
                        "phf_state=" + IntegerToString(sbs_triangle_client_order_data.client_order_descriptor[i].order_phf.state,0)
         );
            
         SBS_Triangle_Client_OM_Open_Order(i);

         continue;
      }

//--- SELL_ORDER vs (SELL_ORDER and SBS_TRIANGLE_ORDER_OPEN_STAGE_3) ---/     RENEW ORDER
         
      if (
            (
               (sbs_triangle_client_order_data.client_order_descriptor[i].client_order[0].order_synch.signal == NO_ORDER) &&
               (sbs_triangle_client_order_data.client_order_descriptor[i].client_order[1].order_synch.signal == NO_ORDER) &&
               (sbs_triangle_client_order_data.client_order_descriptor[i].client_order[2].order_synch.signal == SELL_ORDER)
            ) &&
            
            (
               (
                  (sbs_triangle_client_order_data.client_order_descriptor[i].order_phf.signal == SELL_ORDER) &&
                  (sbs_triangle_client_order_data.client_order_descriptor[i].order_phf.state  == SBS_TRIANGLE_ORDER_OPEN_STAGE_1)
               )
            )
         )
      {
         Print(">>> SELL_OPEN_RENEW: " +
                         "descr_no=" + IntegerToString(i,0) + ", " +
                    "synch_signal=(" + IntegerToString(sbs_triangle_client_order_data.client_order_descriptor[i].client_order[0].order_synch.signal,0) + "," +
                                       IntegerToString(sbs_triangle_client_order_data.client_order_descriptor[i].client_order[1].order_synch.signal,0) + "," +
                                       IntegerToString(sbs_triangle_client_order_data.client_order_descriptor[i].client_order[2].order_synch.signal,0) + ")," +
                       "phf_signal=" + IntegerToString(sbs_triangle_client_order_data.client_order_descriptor[i].order_phf.signal,0) + "," +
                        "phf_state=" + IntegerToString(sbs_triangle_client_order_data.client_order_descriptor[i].order_phf.state,0)
         );
         
         SBS_Triangle_Client_OM_Open_Order(i);

         continue;
      }

//--- (BUY_ORDER or SELL_ORDER) vs (NO_ORDER and SBS_TRIANGLE_ORDER_OPEN_STAGE_2)) ---/     CLOSE ORDER #1
         
      if (
            (
               (sbs_triangle_client_order_data.client_order_descriptor[i].client_order[0].order_synch.signal == BUY_ORDER) ||
               (sbs_triangle_client_order_data.client_order_descriptor[i].client_order[0].order_synch.signal == SELL_ORDER)
            ) &&
            
            (
               (
//                  (sbs_triangle_client_order_data.client_order_descriptor[i].order_phf.signal == NO_ORDER) &&
                  (sbs_triangle_client_order_data.client_order_descriptor[i].order_phf.state  == SBS_TRIANGLE_ORDER_OPEN_STAGE_2)
               )
            )
         )
      {
         Print(">>> CLOSE_1 BY STAGE_2: " +
                         "descr_no=" + IntegerToString(i,0) + ", " +
                    "synch_signal=(" + IntegerToString(sbs_triangle_client_order_data.client_order_descriptor[i].client_order[0].order_synch.signal,0) + "," +
                                       IntegerToString(sbs_triangle_client_order_data.client_order_descriptor[i].client_order[1].order_synch.signal,0) + "," +
                                       IntegerToString(sbs_triangle_client_order_data.client_order_descriptor[i].client_order[2].order_synch.signal,0) + ")," +
                       "phf_signal=" + IntegerToString(sbs_triangle_client_order_data.client_order_descriptor[i].order_phf.signal,0) + "," +
                        "phf_state=" + IntegerToString(sbs_triangle_client_order_data.client_order_descriptor[i].order_phf.state,0)
         );
         
         SBS_Triangle_Client_OM_Close_Order(i,SBS_TRIANGLE_ORDER_OPEN_STAGE_1);
         
         continue;
      }

//--- (BUY_ORDER or SELL_ORDER) vs (NO_ORDER and SBS_TRIANGLE_ORDER_OPEN_STAGE_3)) ---/     CLOSE ORDER #1 and #2
         
      if (
            (
               (sbs_triangle_client_order_data.client_order_descriptor[i].client_order[1].order_synch.signal == BUY_ORDER) ||
               (sbs_triangle_client_order_data.client_order_descriptor[i].client_order[1].order_synch.signal == SELL_ORDER)
            ) &&
            
            (
               (
//                  (sbs_triangle_client_order_data.client_order_descriptor[i].order_phf.signal == NO_ORDER) &&
                  (sbs_triangle_client_order_data.client_order_descriptor[i].order_phf.state  == SBS_TRIANGLE_ORDER_OPEN_STAGE_3)
               )
            )
         )
      {
         Print(">>> CLOSE_2 BY STAGE_3: " +
                         "descr_no=" + IntegerToString(i,0) + ", " +
                    "synch_signal=(" + IntegerToString(sbs_triangle_client_order_data.client_order_descriptor[i].client_order[0].order_synch.signal,0) + "," +
                                       IntegerToString(sbs_triangle_client_order_data.client_order_descriptor[i].client_order[1].order_synch.signal,0) + "," +
                                       IntegerToString(sbs_triangle_client_order_data.client_order_descriptor[i].client_order[2].order_synch.signal,0) + ")," +
                       "phf_signal=" + IntegerToString(sbs_triangle_client_order_data.client_order_descriptor[i].order_phf.signal,0) + "," +
                        "phf_state=" + IntegerToString(sbs_triangle_client_order_data.client_order_descriptor[i].order_phf.state,0)
         );
         
         SBS_Triangle_Client_OM_Close_Order(i,SBS_TRIANGLE_ORDER_OPEN_STAGE_2);
         
         continue;
      }

//--- (BUY_ORDER or SELL_ORDER) vs (NO_ORDER and SBS_TRIANGLE_ORDER_OPEN_STAGE_3) ---/    SL TRAILING JUST FOR ORDER #3
         
      if (
            (
               (sbs_triangle_client_order_data.client_order_descriptor[i].client_order[2].order_synch.signal == BUY_ORDER) ||
               (sbs_triangle_client_order_data.client_order_descriptor[i].client_order[2].order_synch.signal == SELL_ORDER)
            ) &&
            
            (
//               (sbs_triangle_client_order_data.client_order_descriptor[i].order_phf.signal == NO_ORDER) &&
               (sbs_triangle_client_order_data.client_order_descriptor[i].order_phf.state  == SBS_TRIANGLE_ORDER_OPEN_STAGE_3)
            ) &&
            
            (sbs_triangle_client_order_data.client_order_descriptor[i].client_order[2].order_synch.stoploss != 
                                                   sbs_triangle_client_order_data.client_order_descriptor[i].order_phf.stoploss)
         )
      {
         SBS_Triangle_Client_OM_Change_SL_Order(i,2);
         
         continue;
      }

   }     // EOF for (i = 0; i < SBS_TRIANGLE_DESCRIPTOR_NUMBER; i++)

//----------------------------------------------------------------------/

   return;
}

//======================= SBS_Triangle_Client_Synch_ONLINE_Order ====/

void   SBS_Triangle_Client_Synch_ONLINE_Order(int descr_no, int order_no)
{
   Print("DFMC_ONLINE_SYNC: decr_no=" + IntegerToString(descr_no,0) + ", " +
                          "order_no=" + IntegerToString(order_no,0) + ", " +
                          "s_signal=" + IntegerToString(sbs_triangle_client_order_data.client_order_descriptor[descr_no].client_order[order_no].order_synch.signal,0) + " -> " +
                                        IntegerToString(sbs_triangle_client_order_data.client_order_descriptor[descr_no].client_order[order_no].order_online.signal,0) + ", " +
                          "s_oprice=" + IntegerToString(sbs_triangle_client_order_data.client_order_descriptor[descr_no].client_order[order_no].order_synch.order_price,0) + " -> " +
                                        IntegerToString(sbs_triangle_client_order_data.client_order_descriptor[descr_no].client_order[order_no].order_online.order_price,0) + ", " +
                          "s_sl="     + IntegerToString(sbs_triangle_client_order_data.client_order_descriptor[descr_no].client_order[order_no].order_synch.stoploss,0) + " -> " +
                                        IntegerToString(sbs_triangle_client_order_data.client_order_descriptor[descr_no].client_order[order_no].order_online.stoploss,0) + ", " +
                          "s_otime="  + SBS_DMF_Client_Get_Time_String(sbs_triangle_client_order_data.client_order_descriptor[descr_no].client_order[order_no].order_synch.order_time) + " -> " +
                                        SBS_DMF_Client_Get_Time_String(sbs_triangle_client_order_data.client_order_descriptor[descr_no].client_order[order_no].order_online.order_time)
        );

   sbs_triangle_client_order_data.client_order_descriptor[descr_no].client_order[order_no].order_synch.signal = 
               sbs_triangle_client_order_data.client_order_descriptor[descr_no].client_order[order_no].order_online.signal;
   sbs_triangle_client_order_data.client_order_descriptor[descr_no].client_order[order_no].order_synch.order_price = 
               sbs_triangle_client_order_data.client_order_descriptor[descr_no].client_order[order_no].order_online.order_price;
   sbs_triangle_client_order_data.client_order_descriptor[descr_no].client_order[order_no].order_synch.stoploss = 
               sbs_triangle_client_order_data.client_order_descriptor[descr_no].client_order[order_no].order_online.stoploss;
   sbs_triangle_client_order_data.client_order_descriptor[descr_no].client_order[order_no].order_synch.order_time = 
               sbs_triangle_client_order_data.client_order_descriptor[descr_no].client_order[order_no].order_online.order_time;
   
//   open_order.order_session_id = -1;

//----------------------------------------------------------------------/

   return;
}

//======================= SBS_Triangle_Client_OM_Open_Order ================/

void   SBS_Triangle_Client_OM_Open_Order(int descriptor_no)
{
int      j;

int      synch_phf_flag;

int      ticket;
int      signal_cmd;
int      slippage;
int      m_number;

double   lots;
double   price;
double   sl;
double   tp;

string   comment;

datetime expiration_dtime;

//----------------------- Check Open Order FLAGS ---------------------------/

   if (
         (sbs_client_order_state.sbs_global_operational_data.open_order_flag  == SBS_CLIENT_FLAG_NOT_SET_VALUE) ||
         (sbs_client_order_state.sbs_private_operational_data.open_order_flag == SBS_CLIENT_FLAG_NOT_SET_VALUE) ||
         
         (
            (sbs_client_order_state.sbs_private_operational_data.obs_order_val == BUY_ORDER) &&
            (sbs_triangle_client_order_data.client_order_descriptor[descriptor_no].order_phf.signal == SELL_ORDER)
         ) ||
         
         (
            (sbs_client_order_state.sbs_private_operational_data.obs_order_val == SELL_ORDER) &&
            (sbs_triangle_client_order_data.client_order_descriptor[descriptor_no].order_phf.signal == BUY_ORDER)
         )
      )
   {
      return;
   }

//----------------------- Check synch_phf_flag -----------------------------/

   synch_phf_flag = 1;           // NOT OK

   if (
         (
            (sbs_triangle_client_order_data.client_order_descriptor[descriptor_no].client_order[0].order_synch.signal == NO_ORDER) &&
            (sbs_triangle_client_order_data.client_order_descriptor[descriptor_no].client_order[1].order_synch.signal == NO_ORDER) &&
            (sbs_triangle_client_order_data.client_order_descriptor[descriptor_no].client_order[2].order_synch.signal == NO_ORDER)
         ) &&
            
         (
            (sbs_triangle_client_order_data.client_order_descriptor[descriptor_no].order_phf.signal == BUY_ORDER) ||
            (sbs_triangle_client_order_data.client_order_descriptor[descriptor_no].order_phf.signal == SELL_ORDER)
         ) &&

         (sbs_triangle_client_order_data.client_order_descriptor[descriptor_no].order_phf.state == SBS_TRIANGLE_ORDER_OPEN_STAGE_1)
      )
   {
      synch_phf_flag = 0;
   }
   
   if (
         (synch_phf_flag != 0) &&
         
         (
            (sbs_triangle_client_order_data.client_order_descriptor[descriptor_no].client_order[0].order_synch.signal == NO_ORDER) &&
            (sbs_triangle_client_order_data.client_order_descriptor[descriptor_no].client_order[1].order_synch.signal == NO_ORDER) &&
            (sbs_triangle_client_order_data.client_order_descriptor[descriptor_no].client_order[2].order_synch.signal == SELL_ORDER)
         ) &&

         (sbs_triangle_client_order_data.client_order_descriptor[descriptor_no].order_phf.signal == SELL_ORDER) &&
         
         (sbs_triangle_client_order_data.client_order_descriptor[descriptor_no].order_phf.state == SBS_TRIANGLE_ORDER_OPEN_STAGE_1)
      )
   {
      synch_phf_flag = 0;
   }
   
   if (
         (synch_phf_flag != 0) &&
         
         (
            (sbs_triangle_client_order_data.client_order_descriptor[descriptor_no].client_order[0].order_synch.signal == NO_ORDER) &&
            (sbs_triangle_client_order_data.client_order_descriptor[descriptor_no].client_order[1].order_synch.signal == NO_ORDER) &&
            (sbs_triangle_client_order_data.client_order_descriptor[descriptor_no].client_order[2].order_synch.signal == BUY_ORDER)
         ) &&

         (sbs_triangle_client_order_data.client_order_descriptor[descriptor_no].order_phf.signal == BUY_ORDER) &&
         
         (sbs_triangle_client_order_data.client_order_descriptor[descriptor_no].order_phf.state == SBS_TRIANGLE_ORDER_OPEN_STAGE_1)
      )
   {
      synch_phf_flag = 0;
   }
   
   if (synch_phf_flag != 0)
   {
      return;
   }

//----------------------- Check SYNCH & PHF synch_time ---------------------/

   if (
         (sbs_triangle_client_order_data.client_order_descriptor[descriptor_no].client_order[0].order_synch.synch_time == 
                                             sbs_triangle_client_order_data.client_order_descriptor[descriptor_no].order_phf.synch_time) ||
         (sbs_triangle_client_order_data.client_order_descriptor[descriptor_no].client_order[1].order_synch.synch_time == 
                                             sbs_triangle_client_order_data.client_order_descriptor[descriptor_no].order_phf.synch_time) ||
         (sbs_triangle_client_order_data.client_order_descriptor[descriptor_no].client_order[2].order_synch.synch_time == 
                                             sbs_triangle_client_order_data.client_order_descriptor[descriptor_no].order_phf.synch_time)
      )
   {
      return;
   }

//----------------------- Check Target 1 Level -----------------------------/
   
   if (
         (sbs_triangle_client_order_data.client_order_descriptor[descriptor_no].order_phf.signal == SELL_ORDER) &&
         
         (Close[0] < (sbs_triangle_client_order_data.client_order_descriptor[descriptor_no].order_phf.target + (Point * sbs_client_order_state.spread)))
      )
   {
      return;
   }
   
   if (
         (sbs_triangle_client_order_data.client_order_descriptor[descriptor_no].order_phf.signal == BUY_ORDER) &&
         
         (Close[0] > (sbs_triangle_client_order_data.client_order_descriptor[descriptor_no].order_phf.target - (Point * sbs_client_order_state.spread)))
      )
   {
      return;
   }

//----------------------- Set Order Parameters (PHF Data based) ------------/

   for (j = 0; j < SBS_TRIANGLE_DESCRIPTOR_ASSOCIATE_ORDER_NUMBER; j++)
   {
//--- Check for CONTINUE Order ---/

      if (sbs_triangle_client_order_data.client_order_descriptor[descriptor_no].client_order[j].order_synch.signal != NO_ORDER)
      {
         continue;
      }

//--- BUY_ORDER ---/

      if (sbs_triangle_client_order_data.client_order_descriptor[descriptor_no].order_phf.signal == BUY_ORDER)
      {
         RefreshRates();
      
         signal_cmd       = OP_BUY;
         price            = Ask;
         slippage         = 5 * (sbs_client_order_state.n_Point/Point);                                           // points
      
         sl               = NormalizeDouble(SBS_Triangle_Client_OM_Get_Order_SL(price, descriptor_no),Digits);
         tp               = 0;                                                                                    // NO TakeProfit
         lots             = SBS_Triangle_Client_OM_Get_Order_Lots(descriptor_no,j,(MathAbs(price - sl)/Point),1);            // after SL calculation
      
         comment          = "BUY(" + IntegerToString((descriptor_no + 1),0) + "-" + IntegerToString((j + 1),0) + ")";
         m_number         = (SBS_CLIENT_BUY_ORDER_MAGIC_NUMBER + (100 * descriptor_no) + j);

         expiration_dtime = 0;                                                                                    // not expired
      }

//--- SELL_ORDER ---/

      if (sbs_triangle_client_order_data.client_order_descriptor[descriptor_no].order_phf.signal == SELL_ORDER)
      {
         RefreshRates();
      
         signal_cmd       = OP_SELL;
         price            = Bid;
         slippage         = 5 * (sbs_client_order_state.n_Point/Point);                                           // points
      
         sl               = NormalizeDouble(SBS_Triangle_Client_OM_Get_Order_SL(price, descriptor_no),Digits);
         tp               = 0;                                                                                    // NO TakeProfit
         lots             = SBS_Triangle_Client_OM_Get_Order_Lots(descriptor_no,j,(MathAbs(price - sl)/Point),1);            // after SL calculation
      
         comment          = "SELL(" + IntegerToString((descriptor_no + 1),0) + "-" + IntegerToString((j + 1),0) + ")";
         m_number         = (SBS_CLIENT_SELL_ORDER_MAGIC_NUMBER + (100 * descriptor_no) + j);
         
         expiration_dtime = 0;                                                                                    // not expired
      }

//----------------------- Check Parameters Consistancy -----------------/

//--- lots ---/

      if (lots == 0)
      {
         Print ("DFMC_TRNGL_OPEN_ERROR: NO LOTS");
            
         return;
      }

//----------------------- Open (Send) Order --------------------------------/      

      ticket = OrderSendReliable(Symbol(),signal_cmd,lots,price,slippage,sl,tp,comment,m_number,expiration_dtime,Green);

//----------------------- Check Open Order Result --------------------------/

//--- Negative Result ---/

      if (ticket == -1)
      {
         Print ("DFMC_TRNGL_OPEN_ERROR: descr_no=" + IntegerToString(descriptor_no,0) + ", " +
                                       "order_no=" + IntegerToString(j,0) +
                                 ", tckt=" + IntegerToString(ticket,0) +
                                ", s_cmd=" + IntegerToString(signal_cmd,0) +
                                ", price=" + DoubleToString(price,Digits) +
                                 ", slpg=" + IntegerToString(slippage,0) +
                                   ", sl=" + DoubleToString(sl,Digits) +
                                   ", tp=" + DoubleToString(tp,Digits) +
                                 ", lots=" + DoubleToString(lots,Digits) +
                                   ", cm=" + comment +
                                   ", mn=" + IntegerToString(m_number,0)
               );
      
         Print ("DFMC_TRNGL_OPEN_ERROR_2: free_mrg=" + DoubleToString(sbs_client_order_state.free_margin,Digits) +
                                 ", lvrg=" + IntegerToString(sbs_client_order_state.leverage,0) +
                                 ", olt_cost=" + DoubleToString(sbs_client_order_state.one_lot_tick_cost,Digits) +
                                 ", min_lot=" + DoubleToString(sbs_client_order_state.min_lot,Digits) +
                                 ", max_lot=" + DoubleToString(sbs_client_order_state.max_lot,Digits) +
                                 ", lot_stp=" + DoubleToString(sbs_client_order_state.lot_step,Digits)
               );

         return;
      }

//--- Positive Result (continue the process) ---/

      Print("DFMC_TRNGL_OPEN: descr_no=" + IntegerToString(descriptor_no,0) + ", " +
                             "order_no=" + IntegerToString(j,0) +
                       ", tckt=" + IntegerToString(ticket,0) +
                      ", s_cmd=" + IntegerToString(signal_cmd,0) +
                      ", price=" + DoubleToString(price,Digits) +
                       ", slpg=" + IntegerToString(slippage,0) +
                         ", sl=" + DoubleToString(sl,Digits) +
                         ", tp=" + DoubleToString(tp,Digits) +
                       ", lots=" + DoubleToString(lots,Digits) +
                         ", cm=" + comment +
                         ", mn=" + IntegerToString(m_number,0)
           );

//--- Update Open Order Data (from PHF and "ticket" data) ---/

      SBS_Triangle_Client_OM_Update_OOrder(descriptor_no, j, ticket);
   
      sbs_play_sound_data.open_order_play_flag = SBS_PLAY_SOUND_SET_FLAG;
   
   }     // EOF for (j = 0; j < SBS_TRIANGLE_DESCRIPTOR_ASSOCIATE_ORDER_NUMBER; j++)
   
//----------------------------------------------------------------------/

   return;
}

//======================= SBS_Triangle_Client_OM_Get_Order_SL ==============/

double   SBS_Triangle_Client_OM_Get_Order_SL(double o_price, int descriptor_no)
{
double   server_stoplevel;
double   sl_recommended;

//--- server_stoplevel ---/

   server_stoplevel = MarketInfo(Symbol(),MODE_STOPLEVEL);

//--- sl_recommended ---/

   sl_recommended = sbs_triangle_client_order_data.client_order_descriptor[descriptor_no].order_phf.stoploss;

   if (sbs_triangle_client_order_data.client_order_descriptor[descriptor_no].order_phf.signal == BUY_ORDER)
   {
//      sl_recommended = sl_recommended - sbs_client_order_state.spread - (SBS_CLIENT_SL_INCREMENT * sbs_client_order_state.n_Point);
   
      if ((o_price - sl_recommended) < server_stoplevel)
      {
         sl_recommended = o_price - server_stoplevel - sbs_client_order_state.spread;  // - (SBS_CLIENT_SL_INCREMENT * sbs_client_order_state.n_Point);
      }
   }
   
   if (sbs_triangle_client_order_data.client_order_descriptor[descriptor_no].order_phf.signal == SELL_ORDER)
   {
//      sl_recommended = sl_recommended + sbs_client_order_state.spread + (SBS_CLIENT_SL_INCREMENT * sbs_client_order_state.n_Point);
      
      if ((sl_recommended - o_price) < server_stoplevel)
      {
         sl_recommended = o_price - server_stoplevel + sbs_client_order_state.spread;  // + (SBS_CLIENT_SL_INCREMENT * sbs_client_order_state.n_Point);
      }
   }

//--------------------------------------------------------------------------/

   return(sl_recommended);
}

//======================= SBS_Triangle_Client_OM_Update_OOrder =============/

void   SBS_Triangle_Client_OM_Update_OOrder(int descriptor_no, int order_no, int o_ticket)
{
int      order_type;

//----------------------- Open Order Update SYNCH Data ---------------------/

   Print("DFMC_TRNGL_OM_SYNCH_UPD: descr_no=" + IntegerToString(descriptor_no,0) + ", " +
                                  "order_no=" + IntegerToString(order_no,0) +
   

                    ", signal=(" + IntegerToString(sbs_triangle_client_order_data.client_order_descriptor[descriptor_no].client_order[order_no].order_synch.signal,0) + " -> " + 
                                   IntegerToString(sbs_triangle_client_order_data.client_order_descriptor[descriptor_no].order_phf.signal,0) + ")" +
                                   
                     ", price=(" + DoubleToString(sbs_triangle_client_order_data.client_order_descriptor[descriptor_no].client_order[order_no].order_synch.order_price,Digits) + " -> " + 
                                   DoubleToString(sbs_triangle_client_order_data.client_order_descriptor[descriptor_no].order_phf.price,Digits) + ")" +
                                   
                        ", sl=(" + DoubleToString(sbs_triangle_client_order_data.client_order_descriptor[descriptor_no].client_order[order_no].order_synch.stoploss,Digits) + " -> " + 
                                   DoubleToString(sbs_triangle_client_order_data.client_order_descriptor[descriptor_no].order_phf.stoploss,Digits) + ")" +
                                   
                  ", synch_tm=(" + SBS_DMF_Client_Get_Time_String(sbs_triangle_client_order_data.client_order_descriptor[descriptor_no].client_order[order_no].order_synch.synch_time) + " -> " + 
                                   SBS_DMF_Client_Get_Time_String(sbs_triangle_client_order_data.client_order_descriptor[descriptor_no].order_phf.synch_time) + ")"
        );

   sbs_triangle_client_order_data.client_order_descriptor[descriptor_no].client_order[order_no].order_synch.signal = 
                                                sbs_triangle_client_order_data.client_order_descriptor[descriptor_no].order_phf.signal;
               
   sbs_triangle_client_order_data.client_order_descriptor[descriptor_no].client_order[order_no].order_synch.order_price = 
                                                sbs_triangle_client_order_data.client_order_descriptor[descriptor_no].order_phf.price;
               
   sbs_triangle_client_order_data.client_order_descriptor[descriptor_no].client_order[order_no].order_synch.stoploss = 
                                                sbs_triangle_client_order_data.client_order_descriptor[descriptor_no].order_phf.stoploss;
               
   sbs_triangle_client_order_data.client_order_descriptor[descriptor_no].client_order[order_no].order_synch.synch_time = 
                                                sbs_triangle_client_order_data.client_order_descriptor[descriptor_no].order_phf.synch_time;

//----------------------- Open Order Update Server Data --------------------/

   if (OrderSelect(o_ticket, SELECT_BY_TICKET, MODE_TRADES) == true)
   {
      order_type = OrderType();
      
      if (order_type == OP_BUY)
      {
         sbs_triangle_client_order_data.client_order_descriptor[descriptor_no].client_order[order_no].order_online.signal = BUY_ORDER;
      }
      
      if (order_type == OP_SELL)
      {
         sbs_triangle_client_order_data.client_order_descriptor[descriptor_no].client_order[order_no].order_online.signal = SELL_ORDER;
      }
      
      sbs_triangle_client_order_data.client_order_descriptor[descriptor_no].client_order[order_no].order_online.ticket      = OrderTicket();
      sbs_triangle_client_order_data.client_order_descriptor[descriptor_no].client_order[order_no].order_online.order_price = OrderOpenPrice();
      sbs_triangle_client_order_data.client_order_descriptor[descriptor_no].client_order[order_no].order_online.stoploss    = OrderStopLoss();
      sbs_triangle_client_order_data.client_order_descriptor[descriptor_no].client_order[order_no].order_online.order_time  = OrderOpenTime();

      sbs_triangle_client_order_data.client_order_descriptor[descriptor_no].client_order[order_no].order_online.stoploss_change_time = TimeLocal();
      
      OrderPrint();
   }
   else        // OrderSelect error
   {
      sbs_triangle_client_order_data.client_order_descriptor[descriptor_no].client_order[order_no].order_online.ticket = (-1);
      
      Print("DFMC_TRNGL_ONLINE_DATA: SBS_Triangle_Client_OM_Update_OOrder() ERROR error=" + IntegerToString(GetLastError(),0) + ", " +
                                  "descr_no=" + IntegerToString(descriptor_no,0) + ", " +
                                  "order_no=" + IntegerToString(order_no,0) +
                                ", o_ticket=" + IntegerToString(o_ticket,0) +
                                ", r_ticket=" + IntegerToString(sbs_triangle_client_order_data.client_order_descriptor[descriptor_no].client_order[order_no].order_online.ticket,0));
      return;
   }
   
   Print("DFMC_TRNGL_INLINE_DATA: descr_no=" + IntegerToString(descriptor_no,0) + ", " +
                                 "order_no=" + IntegerToString(order_no,0) +
                       ", ticket=" + IntegerToString(sbs_triangle_client_order_data.client_order_descriptor[descriptor_no].client_order[order_no].order_online.ticket,0) +
                       ", signal=" + IntegerToString(sbs_triangle_client_order_data.client_order_descriptor[descriptor_no].client_order[order_no].order_online.signal,0) +
                        ", price=" + DoubleToString(sbs_triangle_client_order_data.client_order_descriptor[descriptor_no].client_order[order_no].order_online.order_price,Digits) +
                           ", sl=" + DoubleToString(sbs_triangle_client_order_data.client_order_descriptor[descriptor_no].client_order[order_no].order_online.stoploss,Digits) +
                         ", time=" + SBS_DMF_Client_Get_Time_String(sbs_triangle_client_order_data.client_order_descriptor[descriptor_no].client_order[order_no].order_online.order_time)
        );

//--- Update operation_label_data ---/
/*   
   sbs_client_order_state.operation_label_data = sbs_client_order_state.operation_label_data + 
                                                 "(" + IntegerToString(o_type,0) + "," +
                                                 IntegerToString(sbs_client_order_state.sbs_open_order[o_type].order_session_id,0) + "," +
                                                 IntegerToString(sbs_client_order_state.sbs_open_order[o_type].sbs_phf_order_data.signal,0) + "," +
                                                 IntegerToString(sbs_client_order_state.sbs_open_order[o_type].ticket,0) + ")";
*/
//--------------------------------------------------------------------------/

   return;
}

//======================= SBS_Triangle_Client_OM_Close_Order ===============/

void   SBS_Triangle_Client_OM_Close_Order(int descriptor_no, int order_state_no)
{
int      i;
int      j;

int      order_type;
int      slippage;
int      close_attempts;
int      last_err;

double   close_price;
double   o_lots;

//----------------------- Check Close Order FLAGS --------------------------/

   if (
         (sbs_client_order_state.sbs_global_operational_data.close_order_flag  == SBS_CLIENT_FLAG_NOT_SET_VALUE) ||
         (sbs_client_order_state.sbs_private_operational_data.close_order_flag == SBS_CLIENT_FLAG_NOT_SET_VALUE)
      )
   {
      return;
   }
   
   sbs_play_sound_data.close_order_play_flag = SBS_PLAY_SOUND_SET_FLAG;

//----------------------- Close Order Update Server Data ---------------/

   for (j = 0; j < SBS_TRIANGLE_DESCRIPTOR_ASSOCIATE_ORDER_NUMBER; j++)
   {
//--- check if SYNCH signal is SELL_ORDER or BUY_ORDER ---/

      if (
            (sbs_triangle_client_order_data.client_order_descriptor[descriptor_no].client_order[j].order_synch.signal != SELL_ORDER) &&
            (sbs_triangle_client_order_data.client_order_descriptor[descriptor_no].client_order[j].order_synch.signal != BUY_ORDER)
         )
      {
         continue;
      }

//--- check order_state_no ---/

      if (
            (
               (j == 0) &&                      // check close order 1 
               
               (
                  (order_state_no != SBS_TRIANGLE_ORDER_OPEN_STAGE_1) &&
                  (order_state_no != SBS_TRIANGLE_ORDER_OPEN_STAGE_2) &&
                  (order_state_no != SBS_TRIANGLE_ORDER_OPEN_STAGE_3)
               )
            ) ||
            
            (
               (j == 1) &&                      // check close order 2
               
               (
                  (order_state_no != SBS_TRIANGLE_ORDER_OPEN_STAGE_2) &&
                  (order_state_no != SBS_TRIANGLE_ORDER_OPEN_STAGE_3)
               )
            ) ||
            
            (
               (j == 2) &&                      // check close order 3
               
               (
                  (order_state_no != SBS_TRIANGLE_ORDER_OPEN_STAGE_3)
               )
            )
         )
      {
         continue;
      }

//--- OrderSelect ---/

      if (OrderSelect(sbs_triangle_client_order_data.client_order_descriptor[descriptor_no].client_order[j].order_online.ticket, 
                      SELECT_BY_TICKET, MODE_TRADES) == true)
      {
         RefreshRates();
      
         order_type     = OrderType();
         o_lots         = OrderLots();
         slippage       = 20 * (sbs_client_order_state.n_Point/Point);
         close_attempts = 3;
      
         if (order_type == OP_BUY)
         {
            close_price = Bid;
         }
      
         if (order_type == OP_SELL)
         {
            close_price = Ask;
         }
      }
      else        // OrderSelect error
      {
         Print("DFMC_TRNGL_CLOSE: OrderSelect() ERROR error=" + IntegerToString(GetLastError(),0) + 
                                            "descr_no=" + IntegerToString(descriptor_no,0) + ", " +
                                            "order_no=" + IntegerToString(j,0) +
                                            ", ticket=" + IntegerToString(sbs_triangle_client_order_data.client_order_descriptor[descriptor_no].client_order[j].order_online.ticket,0));
         return;
      }

//--- OrderClose() Attempts ---/

   for (i = 0; i < close_attempts; i++)
   {
      if (OrderClose(sbs_triangle_client_order_data.client_order_descriptor[descriptor_no].client_order[j].order_online.ticket, 
                        o_lots, close_price, slippage, Violet) != true)
      {
         last_err = GetLastError();
         
         Print("DFMC_TRNGL_CMDC: ERROR error=" + IntegerToString(GetLastError(),0) + 
                              "descr_no=" + IntegerToString(descriptor_no,0) + ", " +
                              "order_no=" + IntegerToString(j,0) +
                              ", ticket=" + IntegerToString(sbs_triangle_client_order_data.client_order_descriptor[descriptor_no].client_order[j].order_online.ticket,0) +
                             ", attempt=" + IntegerToString(i,0));
            
         if ((last_err==4) || (last_err==137) || (last_err==146) || (last_err==136))       //Busy errors
         {
            if (!IsTesting()) 
            {
               Sleep(2500);
            }
            
            continue;
         }
      }
      else  // SUCCESS CLOSE
      {
//--- Update Order State Data ---/

         SBS_Triangle_Client_OM_Update_COrder(descriptor_no,j);

         break;
      }
   }
   
   }     // EOF for (j = 0; j < SBS_TRIANGLE_DESCRIPTOR_ASSOCIATE_ORDER_NUMBER; j++)

//--------------------------------------------------------------------------/

   return;
}

//======================= SBS_Triangle_Client_OM_Update_COrder =============/

void   SBS_Triangle_Client_OM_Update_COrder(int descriptor_no, int order_no)
{
int      updated_signal;

//--- updated_signal ---/
   
   updated_signal = NO_ORDER;
   
/*
   if (closed_order_type == OP_BUY)
   {
      updated_signal = CLOSE_BUY_ORDER;
   }
      
   if (closed_order_type == OP_SELL)
   {
      updated_signal = CLOSE_SELL_ORDER;
   }
*/

//----------------------- Close Order Update SYNCH Data --------------------/

   Print("DFMC_TRNGL_SYNCH_CUPD: descr_no=" + IntegerToString(descriptor_no,0) + ", " +
                                  "order_no=" + IntegerToString(order_no,0) +
   

                    ", signal=(" + IntegerToString(sbs_triangle_client_order_data.client_order_descriptor[descriptor_no].client_order[order_no].order_synch.signal,0) + " -> " + 
                                   IntegerToString(updated_signal,0) + ")" +
                                   
                     ", price=(" + DoubleToString(sbs_triangle_client_order_data.client_order_descriptor[descriptor_no].client_order[order_no].order_synch.order_price,Digits) + " -> " + 
                                   DoubleToString(0,Digits) + ")" +
                                   
                        ", sl=(" + DoubleToString(sbs_triangle_client_order_data.client_order_descriptor[descriptor_no].client_order[order_no].order_synch.stoploss,Digits) + " -> " + 
                                   DoubleToString(0,Digits) + ")" +
                                   
                  ", order_tm=(" + SBS_DMF_Client_Get_Time_String(sbs_triangle_client_order_data.client_order_descriptor[descriptor_no].client_order[order_no].order_synch.order_time) + " -> " + 
                                   SBS_DMF_Client_Get_Time_String(0) + ")"
        );

   sbs_triangle_client_order_data.client_order_descriptor[descriptor_no].client_order[order_no].order_synch.signal      = updated_signal;
   sbs_triangle_client_order_data.client_order_descriptor[descriptor_no].client_order[order_no].order_synch.order_price = 0;
   sbs_triangle_client_order_data.client_order_descriptor[descriptor_no].client_order[order_no].order_synch.stoploss    = 0;
   sbs_triangle_client_order_data.client_order_descriptor[descriptor_no].client_order[order_no].order_synch.order_time  = 0;

//----------------------- Close Order Update ONLINE Data -------------------/

   sbs_triangle_client_order_data.client_order_descriptor[descriptor_no].client_order[order_no].order_online.ticket      = -1;
   sbs_triangle_client_order_data.client_order_descriptor[descriptor_no].client_order[order_no].order_online.signal      = NO_ORDER;
   sbs_triangle_client_order_data.client_order_descriptor[descriptor_no].client_order[order_no].order_online.order_price = 0;
   sbs_triangle_client_order_data.client_order_descriptor[descriptor_no].client_order[order_no].order_online.stoploss    = 0;
   sbs_triangle_client_order_data.client_order_descriptor[descriptor_no].client_order[order_no].order_online.order_time  = 0;
         
   sbs_triangle_client_order_data.client_order_descriptor[descriptor_no].client_order[order_no].order_online.stoploss_change_time = 0;
   
   Print("DFMC_TRNGL_ONLINE_DATA: descr_no=" + IntegerToString(descriptor_no,0) + ", " +
                                 "order_no=" + IntegerToString(order_no,0) +
                       ", ticket=" + IntegerToString(sbs_triangle_client_order_data.client_order_descriptor[descriptor_no].client_order[order_no].order_online.ticket,0) +
                       ", signal=" + IntegerToString(sbs_triangle_client_order_data.client_order_descriptor[descriptor_no].client_order[order_no].order_online.signal,0)
        );

//--- Update operation_label_data ---/
/*
   sbs_client_order_state.operation_label_data = sbs_client_order_state.operation_label_data + 
                                                 "(" + IntegerToString(o_type,0) + "," +
                                                 IntegerToString(sbs_client_order_state.sbs_open_order[o_type].order_session_id,0) + "," +
                                                 IntegerToString(sbs_client_order_state.sbs_open_order[o_type].sbs_phf_order_data.signal,0) + "," +
                                                 IntegerToString(sbs_client_order_state.sbs_open_order[o_type].ticket,0) + ")";
*/
//--------------------------------------------------------------------------/

   return;
}

//========================= SBS_Triangle_Client_OM_Change_SL_Order =========/

void   SBS_Triangle_Client_OM_Change_SL_Order(int descriptor_no, int order_no)
{
double   order_open_price;
double   order_sl;
double   order_tp;

double   sl_new;

//----------------------- Check SL Trail Order FLAGS ----------------------/

   if (
         (sbs_client_order_state.sbs_global_operational_data.sl_trail_order_flag  == SBS_CLIENT_FLAG_NOT_SET_VALUE) ||
         (sbs_client_order_state.sbs_private_operational_data.sl_trail_order_flag == SBS_CLIENT_FLAG_NOT_SET_VALUE)
      )
   {
      return;
   }

//------------------------- Get Order Server Data ----------------------------/

   if (OrderSelect(sbs_triangle_client_order_data.client_order_descriptor[descriptor_no].client_order[order_no].order_online.ticket, 
                   SELECT_BY_TICKET, MODE_TRADES) == true)
   {
      order_open_price = OrderOpenPrice();
      order_sl         = OrderStopLoss();
      order_tp         = OrderTakeProfit();
      
      sl_new           = NormalizeDouble(SBS_Triangle_Client_OM_Get_Order_SL(order_open_price,descriptor_no),Digits);
   }
   else        // OrderSelect error
   {

      Print("DFMC_SL_TRAIL: OrderSelect() ERROR error=" + IntegerToString(GetLastError(),0) + 
                                            ", descr_no=" + IntegerToString(descriptor_no,0) +
                                            ", order_no=" + IntegerToString(order_no,0) +
                                            ", ticket=" + IntegerToString(sbs_triangle_client_order_data.client_order_descriptor[descriptor_no].client_order[order_no].order_online.ticket,0));

      return;
   }

//------------------------- Check SL Modification Conditions ---------------/

   if (SBS_Triangle_Client_OM_Check_SL_Mdf_Condition(descriptor_no,order_no,order_sl,sl_new) == False)
   {
      return;
   }

//------------------------- Modify Server Order ----------------------------/

   if (OrderModifyReliable(sbs_triangle_client_order_data.client_order_descriptor[descriptor_no].client_order[order_no].order_online.ticket, 
                           order_open_price, sl_new, order_tp, 0, Green) != true)
   {
      Print("DFMC_TRNGL_CMDM: ERROR descr_no=" + IntegerToString(descriptor_no,0) + ", " +
                                   "order_no=" + IntegerToString(order_no,0) +
                              ", ticket=" + IntegerToString(sbs_triangle_client_order_data.client_order_descriptor[descriptor_no].client_order[order_no].order_online.ticket,0) +
                            ", order_op=" + DoubleToString(order_open_price,Digits) +
                            ", order_sl=" + DoubleToString(order_sl,Digits) +
                              ", sl_new=" + DoubleToString(sl_new,Digits) +
                            ", order_tp=" + DoubleToString(order_tp,Digits));
      
      return;
   }

//------------------------- Update Terminal Order State Data ---------------/

   order_sl = OrderStopLoss();

   SBS_Triangle_Client_OM_Update_SLOrder(descriptor_no,order_no,order_sl);
   
   sbs_play_sound_data.change_sl_order_play_flag = SBS_PLAY_SOUND_SET_FLAG;

//--------------------------------------------------------------------------/

   return;
}

//========================= SBS_Client_OM_Check_SL_Mdf_Condition ===========/

bool   SBS_Triangle_Client_OM_Check_SL_Mdf_Condition(int descriptor_no, int order_no, double sl_current, double sl_new)
{
bool     sl_modification_flag;
datetime current_local_time;

   sl_modification_flag = False;
   current_local_time   = TimeLocal();

//--- 10 points ---/

   if (
         (sl_modification_flag == False) &&
         
         (
            (
               (sbs_triangle_client_order_data.client_order_descriptor[descriptor_no].client_order[order_no].order_online.signal == SELL_ORDER) &&
               (sl_new < sl_current) &&
               (MathAbs(sl_new - sl_current) > (10 * sbs_client_order_state.n_Point))
            ) ||
            
            (
               (sbs_triangle_client_order_data.client_order_descriptor[descriptor_no].client_order[order_no].order_online.signal == BUY_ORDER) &&
               (sl_new > sl_current) &&
               (MathAbs(sl_new - sl_current) > (10 * sbs_client_order_state.n_Point))
            )
         )
      )
   {
      sl_modification_flag = True;
      return(sl_modification_flag);
   }

//--- 5 points ---/

   if (
         (sl_modification_flag == False) &&
         
         (
            (
               (sbs_triangle_client_order_data.client_order_descriptor[descriptor_no].client_order[order_no].order_online.signal == SELL_ORDER) &&
               (sl_new < sl_current) &&
               (MathAbs(sl_new - sl_current) > (5 * sbs_client_order_state.n_Point)) &&
               (
                  (
                     (!IsTesting()) &&
                     (TimeLocal() - sbs_triangle_client_order_data.client_order_descriptor[descriptor_no].client_order[order_no].order_online.stoploss_change_time) > (1 * 60)      // 1 min
                  ) ||
                  (IsTesting())
               )
            ) ||
            
            (
               (sbs_triangle_client_order_data.client_order_descriptor[descriptor_no].client_order[order_no].order_online.signal == BUY_ORDER) &&
               (sl_new > sl_current) &&
               (MathAbs(sl_new - sl_current) > (5 * sbs_client_order_state.n_Point)) &&
               (
                  (
                     (!IsTesting()) &&
                     (TimeLocal() - sbs_triangle_client_order_data.client_order_descriptor[descriptor_no].client_order[order_no].order_online.stoploss_change_time) > (1 * 60)      // 1 min
                  ) ||
                  (IsTesting())
               )
            )
         )
      )
   {
      sl_modification_flag = True;
      return(sl_modification_flag);
   }

//--- 2 points ---/

   if (
         (sl_modification_flag == False) &&
         
         (
            (
               (sbs_triangle_client_order_data.client_order_descriptor[descriptor_no].client_order[order_no].order_online.signal == SELL_ORDER) &&
               (sl_new < sl_current) &&
               (MathAbs(sl_new - sl_current) > (2 * sbs_client_order_state.n_Point)) &&
               (
                  (
                     (!IsTesting()) &&
                     (TimeLocal() - sbs_triangle_client_order_data.client_order_descriptor[descriptor_no].client_order[order_no].order_online.stoploss_change_time) > (5 * 60)      // 5 min
                  ) ||
                  (IsTesting())
               )
            ) ||
            
            (
               (sbs_triangle_client_order_data.client_order_descriptor[descriptor_no].client_order[order_no].order_online.signal == BUY_ORDER) &&
               (sl_new > sl_current) &&
               (MathAbs(sl_new - sl_current) > (2 * sbs_client_order_state.n_Point)) &&
               (
                  (
                     (!IsTesting()) &&
                     (TimeLocal() - sbs_triangle_client_order_data.client_order_descriptor[descriptor_no].client_order[order_no].order_online.stoploss_change_time) > (5 * 60)      // 5 min
                  ) ||
                  (IsTesting())
               )
            )
         )
      )
   {
      sl_modification_flag = True;
      return(sl_modification_flag);
   }

//--------------------------------------------------------------------------/

   return(sl_modification_flag);
}

//======================= SBS_Triangle_Client_OM_Update_SLOrder ============/

void   SBS_Triangle_Client_OM_Update_SLOrder(int descriptor_no, int order_no, int o_sl)
{
//----------------------- Order Update ONLINE SL Data ----------------------/

   sbs_triangle_client_order_data.client_order_descriptor[descriptor_no].client_order[order_no].order_online.stoploss             = o_sl;
   sbs_triangle_client_order_data.client_order_descriptor[descriptor_no].client_order[order_no].order_online.stoploss_change_time = TimeLocal();

   Print("DFMC_ONLINE_SL_UPD: descr_no=" + IntegerToString(descriptor_no,0) + ", " +
                         "order_no=" + IntegerToString(order_no,0) +
               ", ticket=" + IntegerToString(sbs_triangle_client_order_data.client_order_descriptor[descriptor_no].client_order[order_no].order_online.ticket,0) +
                   ", sl=" + IntegerToString(sbs_triangle_client_order_data.client_order_descriptor[descriptor_no].client_order[order_no].order_online.stoploss,0)
        );
        
//----------------------- Order Update SYNCH SL Data -----------------------/

   sbs_triangle_client_order_data.client_order_descriptor[descriptor_no].client_order[order_no].order_synch.stoploss = 
                                                sbs_triangle_client_order_data.client_order_descriptor[descriptor_no].order_phf.stoploss;

   Print("DFMC_SYNCH_SL_UPD: descr_no=" + IntegerToString(descriptor_no,0) + ", " +
                            "order_no=" + IntegerToString(order_no,0) +
              ", sl=(" + DoubleToString(sbs_triangle_client_order_data.client_order_descriptor[descriptor_no].client_order[order_no].order_synch.stoploss,Digits)
        );

//--------------------------------------------------------------------------/

   return;
}

//========================= DFM_Triangle_Client_Update_PHF_Order_Data ======/

void     DFM_Triangle_Client_Update_PHF_Order_Data(sbs_triangle_client_order_PHF_structure &resp_pfh_data[])
{
int      i;

   for (i = 0; i < SBS_TRIANGLE_DESCRIPTOR_NUMBER; i++)
   {
//--- order_phf ---/

         sbs_triangle_client_order_data.client_order_descriptor[i].order_phf.signal     = resp_pfh_data[i].signal;
         sbs_triangle_client_order_data.client_order_descriptor[i].order_phf.state      = resp_pfh_data[i].state;
         sbs_triangle_client_order_data.client_order_descriptor[i].order_phf.synch_time = resp_pfh_data[i].synch_time;
         sbs_triangle_client_order_data.client_order_descriptor[i].order_phf.price      = resp_pfh_data[i].price;
         sbs_triangle_client_order_data.client_order_descriptor[i].order_phf.stoploss   = resp_pfh_data[i].stoploss;
         sbs_triangle_client_order_data.client_order_descriptor[i].order_phf.target     = resp_pfh_data[i].target;
   }

//------------------------------------------------------------------------/

   return;
}

//======================= SBS_Client_OM_Get_Order_Lots =================/

double   SBS_Triangle_Client_OM_Get_Order_Lots(int descriptor_no, int order_no, double order_risk_points, int orders_number)
{
double      lots_recommended;
double      lots_calculated;

//----------------------- Get calculation values -----------------------/

   lots_recommended = MathFloor(
                        (sbs_client_order_state.free_margin * sbs_client_order_state.order_risk_value) / 
                           (order_risk_points * sbs_client_order_state.one_lot_tick_cost) / 
                              sbs_client_order_state.lot_step
                               ) * sbs_client_order_state.lot_step;
   
   lots_calculated =  (sbs_client_order_state.free_margin * sbs_client_order_state.order_risk_value) / 
                           (order_risk_points * sbs_client_order_state.one_lot_tick_cost);

//--- order_service_data.last_calculated_lots_no ---/

   sbs_triangle_client_order_data.client_order_descriptor[descriptor_no].order_service_data.last_calculated_lots_no = lots_calculated;

//--- check 0.5 min_lot ---/

   if (lots_calculated < ((sbs_client_order_state.min_lot * orders_number) * 0.5))
   {
      lots_recommended = 0;
      return(lots_recommended);
   }

//--- check min_lot ---/

   if (lots_recommended < (sbs_client_order_state.min_lot * orders_number))
   {
      lots_recommended = sbs_client_order_state.min_lot;
      return(lots_recommended);
   }

//--- check max_lot ---/
   
   if (lots_recommended > (sbs_client_order_state.max_lot * orders_number))
   {
      lots_recommended = sbs_client_order_state.max_lot;
      return(lots_recommended);
   }

//   lots_recommended = 0.1;      // JUST FOR TESTS !!!!!

//----------------------------------------------------------------------/

   return(lots_recommended);
}

//================== eof sbs_trngl_client_om_lbr.mqh =======================/
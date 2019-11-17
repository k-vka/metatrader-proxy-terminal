//=== mbs_dfm_service_library.mqh ========================================/

//================================== Load_MSB_Buffer =====================/

int      Load_MSB_Buffer(string msb_msg, uchar &msb_buff[], int max_buff_size, uchar snd_counter)
{
int      r_code;
int      src_str_len;

int      i;
uchar    i_c_sum;

//------------------------- Reset r_code ---------------------------------/

   r_code = 0;

//------------------------- Check Src String Len -------------------------/

   src_str_len = StringLen(msb_msg);
   
   if (src_str_len > (max_buff_size - 2))       // counter, control summ
   {
      r_code = 1;
      return(r_code);
   }

//------------------------- Transfer Src String to msb_buff --------------/
   
   if (StringToCharArray(msb_msg, msb_buff, 0, src_str_len, CP_ACP) != src_str_len)
   {
      r_code = 2;
      return(r_code);
   }

//------------------------- Set message counter --------------------------/
   
   msb_buff[src_str_len] = snd_counter;

//------------------------- Set control summ -----------------------------/
   
   i_c_sum = 0;
   
   for (i = 0; i <= src_str_len; i++)
   {
      i_c_sum = i_c_sum + msb_buff[i];
   }
   
   msb_buff[src_str_len + 1] = i_c_sum;

//------------------------------------------------------------------------/

   return(r_code);
}

//========================= Unload_MSB_Buffer ============================/

int      Unload_MSB_Buffer(string &msb_msg, uchar &msb_buff[], int buff_size, int max_buff_size, uchar &rcv_counter)
{
int   r_code;

int   i;
uchar i_c_sum;

//------------------------- Reset r_code ---------------------------------/

   r_code = 0;

//------------------------- Check Rcv Data Truncation --------------------/
   
   if (buff_size > max_buff_size)
   {
      r_code = 1;
      return(r_code);
   }

//------------------------- Check Rcv Data Control Summ ------------------/

   i_c_sum = 0;
   
   for (i = 0; i < (buff_size - 1); i++)
   {
      i_c_sum = i_c_sum + msb_buff[i];
   }
   
   if (i_c_sum != msb_buff[buff_size - 1])
   {
      r_code = 2;
      return(r_code);
   }

//------------------------- Get Rcv Data Counter -------------------------/

   rcv_counter = msb_buff[buff_size - 2];

//------------------------- Get Response String --------------------------/
   
   msb_msg = CharArrayToString(msb_buff, 0, (buff_size - 2), CP_ACP);
   
//   Print("--RCVD: " + msb_msg);
 
   if (StringLen(msb_msg) != (buff_size - 2))
   {
      r_code = 4;
      return(r_code);
   }

//------------------------------------------------------------------------/

   return(r_code);
}

//================================== DFM_Get_Rate_String =================/

string     DFM_Get_Rate_String(MqlRates &rate)
{
string   rate_str;
int      rate_spread_value;

//--- rate_spread_value ---/

   rate_spread_value = rate.spread;

   if (
//         (dfm_client_config.test_context != "Y") &&
         (rate_spread_value == 0)
      )
   {
      rate_spread_value = MarketInfo(Symbol(),MODE_SPREAD);
   }

//-------------------------- Get rates_str -------------------------------/

   rate_str  = TimeToStr(  rate.time,TIME_DATE|TIME_MINUTES) + DFM_FLD_DELIMETER +
               DoubleToStr(rate.open,Digits())               + DFM_FLD_DELIMETER +
               DoubleToStr(rate.high,Digits())               + DFM_FLD_DELIMETER +
               DoubleToStr(rate.low,Digits())                + DFM_FLD_DELIMETER +
               DoubleToStr(rate.close,Digits())              + DFM_FLD_DELIMETER +
           IntegerToString(rate.tick_volume,0,'0')           + DFM_FLD_DELIMETER +
           
//           IntegerToString(rate.spread,0,'0')                + DFM_FLD_DELIMETER +
           IntegerToString(rate_spread_value,0,'0')          + DFM_FLD_DELIMETER +
            
           IntegerToString(rate.real_volume,0,'0')
               ;

//------------------------------------------------------------------------/

   return(rate_str);
}

//================================== DFM_Set_Rate ========================/

int     DFM_Set_Rate(string str_rate, MqlRates &rate)
{
int      r_code;

ushort   field_sep;
string   message_field[];
int      field_number;

//------------------------- Reset r_code ---------------------------------/

   r_code = 0;

//------------------------- Split Source String --------------------------/

   field_sep = StringGetCharacter(DFM_FLD_DELIMETER,0);

   field_number = StringSplit(str_rate,field_sep,message_field);
   
   if (field_number != 8)
   {
      r_code = 1;
      
      Print("DFM DFM_Set_Rate() ERROR: " + IntegerToString(r_code,0,' '));
      return(r_code);
   }

//-------------------------- Set rate ------------------------------------/

   rate.time        = StrToTime      (message_field[0]);
   rate.open        = StringToDouble (message_field[1]);
   rate.high        = StringToDouble (message_field[2]);
   rate.low         = StringToDouble (message_field[3]);
   rate.close       = StringToDouble (message_field[4]);
   rate.tick_volume = StringToInteger(message_field[5]);
   rate.spread      = StringToInteger(message_field[6]);
   rate.real_volume = StringToInteger(message_field[7]);

//------------------------------------------------------------------------/

   return(r_code);
}

//================================== DFM_Copy_MqlRate ====================/

void     DFM_Copy_MqlRate(MqlRates &src_rate, MqlRates &dst_rate)
{

   dst_rate.time        = src_rate.time;
   dst_rate.open        = src_rate.open;
   dst_rate.high        = src_rate.high;
   dst_rate.low         = src_rate.low;
   dst_rate.close       = src_rate.close;
   dst_rate.tick_volume = src_rate.tick_volume;
   dst_rate.spread      = src_rate.spread;
   dst_rate.real_volume = src_rate.real_volume;

//------------------------------------------------------------------------/

   return;
}

//================================== DFM_Compare_Rate ====================/

int     DFM_Compare_Rate(MqlRates &rate1, MqlRates &rate2)
{
int      r_code;

//------------------------- Reset r_code ---------------------------------/

   r_code = 0;

//-------------------------- Compare rates -------------------------------/

   if (
         (rate1.time        != rate2.time) ||
         (rate1.open        != rate2.open) ||
         (rate1.high        != rate2.high) ||
         (rate1.low         != rate2.low) ||
         (rate1.close       != rate2.close) ||
         (rate1.tick_volume != rate2.tick_volume) ||
         
         (
            (rate1.spread != 0) &&
            (rate1.spread != rate2.spread)
         ) ||
         
         (rate1.real_volume != rate2.real_volume)
      )
   {
      r_code = 1;
   }

//------------------------------------------------------------------------/

   return(r_code);
}

//================================== DFM_Get_H_File_Statistics ===========/

h_file_statistics_struct     DFM_Get_H_File_Statistics(int f_handle)
{
h_file_statistics_struct      h_file_stat;
ulong    h_file_size;

//------------------------- Reset h_file_stat ----------------------------/

   h_file_stat.headers_no = 0;
   h_file_stat.records_no = 0;

//------------------------- Get history file size ------------------------/

   h_file_size = FileSize(f_handle);
   
//------------------------- Check file size ------------------------------/
   
   if (h_file_size >= DFM_SERVER_HISTORY_FILE_HEADER_SIZE)
   {
      h_file_stat.headers_no = 1;
      h_file_stat.records_no = (h_file_size - DFM_SERVER_HISTORY_FILE_HEADER_SIZE) / DFM_SERVER_HISTORY_FILE_RECORD_SIZE;
      
      return(h_file_stat);
   }

//------------------------------------------------------------------------/

   return(h_file_stat);
}

//========================= DFM_Get_Last_HFile_Records ===================/

int   DFM_Client_Get_HF_Synch_Rates_Available(string h_symbol,int h_period,datetime h_rates_start_time,int h_rates_count, 
                                              hf_synch_rates_descriptor_structure &hf_synch_rates_descr)
{
h_file_statistics_struct      h_file_statistics;

ulong       i_ulong;
MqlRates    hf_rate_record;
int         hf_records;

//------------------------ Open/Create history file ----------------------/

//   Print("DFM_Client_Get_HF_Synch_Rates_Available() h_rates_start_time  = " + TimeToString(h_rates_start_time,TIME_DATE|TIME_SECONDS));

   hf_synch_rates_descr.hf_handle = FileOpenHistory(h_symbol+IntegerToString(h_period,0,'0')+".hst",FILE_BIN|FILE_SHARE_READ|FILE_ANSI);
   
   if (hf_synch_rates_descr.hf_handle < 0)
   {
      hf_records = -1;
      
      Print("DFM_Client_Get_HF_Synch_Rates_Available() FileOpenHistory() ERROR: " + IntegerToString(hf_records,0,'0'));
      return(hf_records);
   }

//------------------------ Get History File Statistics -------------------/

   h_file_statistics = DFM_Get_H_File_Statistics(hf_synch_rates_descr.hf_handle);

//------------------------ Check headers/records number ------------------/
      
   if (h_file_statistics.headers_no == 0)
   {
      hf_records = -2;
      
      FileClose(hf_synch_rates_descr.hf_handle);
      
      Print("DFM_Client_Get_HF_Synch_Rates_Available() ERROR: no header " + IntegerToString(hf_records,0,'0'));
      return(hf_records);
   }
   
   if (h_file_statistics.records_no == 0)
   {
      hf_records = -3;
      
      FileClose(hf_synch_rates_descr.hf_handle);
      
      Print("DFM_Client_Get_HF_Synch_Rates_Available() ERROR: no records " + IntegerToString(hf_records,0,'0'));
      return(hf_records);
   }

//------------------------ Get history file Synch rate record(0) number -/

   hf_synch_rates_descr.hf_start_record = -1;

   FileSeek(hf_synch_rates_descr.hf_handle,DFM_SERVER_HISTORY_FILE_HEADER_SIZE,SEEK_SET);
         
   for (i_ulong = 0; i_ulong < h_file_statistics.records_no; i_ulong++)
   {
      FileReadStruct(hf_synch_rates_descr.hf_handle,hf_rate_record);
            
      if (hf_rate_record.time >= h_rates_start_time)
      {
         hf_synch_rates_descr.hf_start_record = i_ulong;
         break;
      }
   }
         
   if (hf_synch_rates_descr.hf_start_record == (-1))
   {
      hf_synch_rates_descr.hf_start_record = h_file_statistics.records_no - 1;
   }

//------------------------ Set hf_start_read_rec ------------------------/
      
   if ((hf_synch_rates_descr.hf_start_record - h_rates_count) < 0)
   {
      hf_synch_rates_descr.hf_start_read_rec = 0;
   }
   else
   {
      hf_synch_rates_descr.hf_start_read_rec = (hf_synch_rates_descr.hf_start_record - h_rates_count + 1);
   }
  
//------------------------ Set History File Pointer to Start Record -----/

   FileSeek(hf_synch_rates_descr.hf_handle,DFM_SERVER_HISTORY_FILE_HEADER_SIZE + (hf_synch_rates_descr.hf_start_read_rec * DFM_SERVER_HISTORY_FILE_RECORD_SIZE),SEEK_SET);
   
   hf_records = (hf_synch_rates_descr.hf_start_record - hf_synch_rates_descr.hf_start_read_rec + 1);

//------------------------------------------------------------------------/

   return(hf_records);
}

//========================= DFM_Get_Next_HFile_Record ====================/

int   DFM_Get_Next_HFile_Record(hf_synch_rates_descriptor_structure &hf_synch_rates_descr,MqlRates &dst_h_rates[])
{
//------------------------ Get History Rate Record ----------------------/
      
   FileReadStruct(hf_synch_rates_descr.hf_handle,dst_h_rates[0]);

//------------------------------------------------------------------------/

   return(1);
}

//=== eof mbs_dfm_service_library.mqh ====================================/


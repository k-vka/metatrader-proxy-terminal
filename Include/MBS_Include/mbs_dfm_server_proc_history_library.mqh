//=== mbs_dfm_server_proc_history_library.mqh ============================/

//========================== DFM_Server_Update_LBT_Processing_History ====/

int     DFM_Server_Update_LBT_Processing_History(DFM_Server_Processing_Item_struct    &dfm_s_proc_item[],
                                                 int                                  fh_descriptor_id,
                                                 DFM_Server_History_Descriptor_struct &fh_descriptor,
                                                 string                               tester_context)
{
int      r_code;
int      item_r_code;
int      i;

//------------------------- Reset r_code ---------------------------------/

   r_code = 0;

//------------------------- Check Feeding Descr proc_state ---------------/

   if (fh_descriptor.proc_state != DFM_SERVER_H_DESCRIPTOR_IS_ACTIVE)
   {
      r_code = 1;
      
//      Print("DFM_Server_Update_LBT_Processing_History() FD Descriptor is Not Active: " + IntegerToString(fh_descriptor_id,0,'0') + ", t_context=" + tester_context);
      return(r_code);
   }

//------------------------- Process All associated Proc Descriptors ------/

   for (i = 0; i < DFM_SERVER_MAX_PROC_ITEMS; i++)
   {
      if (
            (dfm_s_proc_item[i].activity_flag                 == DFM_SERVER_PROC_ITEM_ACTIVE) &&
            (dfm_s_proc_item[i].feeding_history_descriptor_id == fh_descriptor_id)
         )
      {
         if (tester_context == "Y")
         {
            item_r_code = DFM_Server_Update_LBT_Proc_History_Item(
                                             DFM_Server_Testing_History_Descriptor[dfm_s_proc_item[i].processing_history_descriptor_id],
                                             fh_descriptor_id,
                                             fh_descriptor,
                                             tester_context
                                                                 );
         }
         else
         {
            item_r_code = DFM_Server_Update_LBT_Proc_History_Item(
                                             DFM_Server_Processing_History_Descriptor[dfm_s_proc_item[i].processing_history_descriptor_id],
                                             fh_descriptor_id,
                                             fh_descriptor,
                                             tester_context
                                                                 );
         }
         
         if (item_r_code != 0)
         {
            Print("DFM_Server_Update_LBT_Processing_History() PH Descr Proc Error: item_r_code=" + IntegerToString(item_r_code,0,'0') + ", i=" + IntegerToString(i,0,'0'));
         }
      }
   }

//------------------------------------------------------------------------/

   return(r_code);
}

//========================== DFM_Server_Update_LBT_Proc_History_Item =====/

int     DFM_Server_Update_LBT_Proc_History_Item(DFM_Server_History_Descriptor_struct &proc_history_descriptor,
                                                int                                  fh_descriptor_id,
                                                DFM_Server_History_Descriptor_struct &fh_descriptor,
                                                string                               tester_context)
{
int      r_code;

h_file_statistics_struct      h_file_statistics;
h_file_header_struct          h_file_header;
h_file_header_struct          feeding_h_file_header;

int      proc_feeding_period_multiplier;
ulong    i_ulong;
ulong    start_record_no;

MqlRates feeding_rate_record;

h_file_statistics_struct   h_file_stat;

//------------------------- Reset r_code ---------------------------------/

   r_code = 0;

//------------------------ Get proc_feeding_period_multiplier ------------/

   proc_feeding_period_multiplier = proc_history_descriptor.period / fh_descriptor.period * 60;

//------------------------- Process Proc Descriptor ----------------------/

//-------------------- proc_state is DFM_SERVER_H_DESCRIPTOR_NOT_ACTIVE --/

   if (proc_history_descriptor.proc_state == DFM_SERVER_H_DESCRIPTOR_NOT_ACTIVE)
   {
//-------------------- Set processing h_file_name ------------------------/

      proc_history_descriptor.phf_symbol = //proc_history_descriptor.short_terminal_company + "_" +
                                           proc_history_descriptor.terminal_symbol
                                           ;
/*      
      if (tester_context == "Y")
      {
         proc_history_descriptor.phf_symbol = "PT" + proc_history_descriptor.phf_symbol;
      }
      else
      {
         proc_history_descriptor.phf_symbol = "P_" + proc_history_descriptor.phf_symbol;
      }
*/
      proc_history_descriptor.h_file_name = proc_history_descriptor.phf_symbol + IntegerToString(proc_history_descriptor.period,0,'0') + ".hst";

//------- Check Reactivation Flag and Truncate processing h_file_name ---/
      
      if (proc_history_descriptor.reactivation_flag == 1)
      {
         proc_history_descriptor.reactivation_flag      = 0;
         proc_history_descriptor.last_feeding_record_no = -1;
         
         Print("(Proc Descr) DFM_Server_Update_LBT_Proc_History_Item() Truncate/ReCreate History File START: filesize=" + 
                IntegerToString(FileSize(proc_history_descriptor.proc_fhandle),0,'0'));
            
//--- Close processing h_file_name ---/

         FileClose(proc_history_descriptor.proc_fhandle);

//--- ReCreate processing h_file_name ---/

         proc_history_descriptor.proc_fhandle = FileOpenHistory(proc_history_descriptor.h_file_name,FILE_BIN|FILE_WRITE|FILE_SHARE_WRITE|FILE_SHARE_READ|FILE_ANSI);
   
         if (proc_history_descriptor.proc_fhandle < 0)
         {
            r_code = 11;
      
            Print("(Proc Descr) FileOpenHistory() Truncate/ReCreate ERROR: " + IntegerToString(r_code,0,'0') + ", fname=" + proc_history_descriptor.h_file_name);
            return(r_code);
         }
            
         Print("(Proc Descr) DFM_Server_Update_LBT_Proc_History_Item() Truncate/ReCreate History File END: filesize=" + IntegerToString(FileSize(proc_history_descriptor.proc_fhandle),0,'0'));
            
         FileClose(proc_history_descriptor.proc_fhandle);
      }

//-------------------- Open processing h_file_name ----------------------/

      proc_history_descriptor.proc_fhandle = FileOpenHistory(proc_history_descriptor.h_file_name,FILE_BIN|FILE_READ|FILE_WRITE|FILE_SHARE_WRITE|FILE_SHARE_READ|FILE_ANSI);
   
      if (proc_history_descriptor.proc_fhandle < 0)
      {
         r_code = 1;
      
         Print("(Proc Descr) FileOpenHistory() ERROR: " + IntegerToString(r_code,0,'0') + ", fname=" + proc_history_descriptor.h_file_name);
         return(r_code);
      }

//-------------------- Open feeding h_file_name -------------------------/
/*
      proc_history_descriptor.handle = FileOpenHistory(fh_descriptor.h_file_name,FILE_BIN|FILE_SHARE_READ|FILE_ANSI);
   
      if (proc_history_descriptor.handle < 0)
      {
         FileClose(proc_history_descriptor.proc_fhandle);
         proc_history_descriptor.proc_fhandle = -1;
         
         r_code = 2;
      
         Print("(Proc Descr) FileOpenHistory() FHF ERROR: " + IntegerToString(r_code,0,'0') + ", fname=" + fh_descriptor.h_file_name);
         return(r_code);
      }
*/
      proc_history_descriptor.handle = fh_descriptor.handle;
      
      if (proc_history_descriptor.handle < 0)
      {
         FileClose(proc_history_descriptor.proc_fhandle);
         proc_history_descriptor.proc_fhandle = -1;
         
         r_code = 2;
      
         Print("(Proc Descr) Assign FHF Handle ERROR: " + IntegerToString(r_code,0,'0') + ", fname=" + fh_descriptor.h_file_name);
         return(r_code);
      }
      
//-------------------- Get Feeding History File Header ------------------/
      
      r_code = DFM_Get_History_File_Header(proc_history_descriptor.handle, feeding_h_file_header);
      
      if (r_code != 0)
      {
         r_code = 3;
      
         Print("(Proc Descr) DFM_Get_History_File_Header ERROR: " + IntegerToString(r_code,0,'0') + ", fname=" + fh_descriptor.h_file_name);
         return(r_code);
      }

//-------------------- Get PHF Statistics --------------------------------/

      h_file_statistics = DFM_Get_H_File_Statistics(proc_history_descriptor.proc_fhandle);
      
      proc_history_descriptor.headers_no = h_file_statistics.headers_no;
      proc_history_descriptor.records_no = h_file_statistics.records_no;
      
      Print("(Proc Descr) DFM_Get_H_File_Statistics() headers_no=" + IntegerToString(h_file_statistics.headers_no,0,'0') + 
                                        ", records_no=" + IntegerToString(h_file_statistics.records_no,0,'0') + 
                                        ", filesize=" + IntegerToString(FileSize(proc_history_descriptor.proc_fhandle),0,'0'));

//------------------------- Create History File Header -------------------/

      if (proc_history_descriptor.headers_no == 0)
      {
         FileSeek(proc_history_descriptor.proc_fhandle,0,SEEK_SET);
         
//--- Define History File Header ---/
         
         h_file_header.file_version = 401;
         h_file_header.c_copyright = "(C)opyright 2003, MetaQuotes Software Corp.";
         
         h_file_header.c_symbol = //proc_history_descriptor.short_terminal_company + "_" +
                                  proc_history_descriptor.terminal_symbol;
/*      
         if (tester_context == "Y")
         {
            h_file_header.c_symbol = "PT" + h_file_header.c_symbol;
         }
         else
         {
            h_file_header.c_symbol = "P_" + h_file_header.c_symbol;
         }
*/
         h_file_header.i_period = proc_history_descriptor.period;
         h_file_header.i_digits = feeding_h_file_header.i_digits;
         
         ArrayInitialize(h_file_header.i_unused,0);

//--- Write History File Header ---/

         FileWriteInteger(proc_history_descriptor.proc_fhandle,h_file_header.file_version,LONG_VALUE);
         FileWriteString (proc_history_descriptor.proc_fhandle,h_file_header.c_copyright,64);
         FileWriteString (proc_history_descriptor.proc_fhandle,h_file_header.c_symbol,12);
         FileWriteInteger(proc_history_descriptor.proc_fhandle,h_file_header.i_period,LONG_VALUE);
         FileWriteInteger(proc_history_descriptor.proc_fhandle,h_file_header.i_digits,LONG_VALUE);
         FileWriteInteger(proc_history_descriptor.proc_fhandle,0,LONG_VALUE);
         FileWriteInteger(proc_history_descriptor.proc_fhandle,0,LONG_VALUE);
         FileWriteArray  (proc_history_descriptor.proc_fhandle,h_file_header.i_unused,0,13);
         
         FileFlush(proc_history_descriptor.proc_fhandle);
         
         proc_history_descriptor.headers_no = 1;
      }

//------------------------- Get Two Last History Records -----------------/

      DFM_Server_Get_Last_HFile_Records(proc_history_descriptor, proc_history_descriptor.proc_fhandle);

//------------------------- Check for PHF ONLY record --------------------/

      if (proc_history_descriptor.records_no == 1)
      {
         r_code = 311;
      
         Print("(Proc Descr) DFM_Server_Update_LBT_Proc_History_Item() ONLY PHF record found ERROR: r_code=" + IntegerToString(r_code,0,'0') + 
               ", PHF records_no=" + IntegerToString(proc_history_descriptor.records_no,0,'0'));
                  
         proc_history_descriptor.reactivation_flag = 1;
            
         return(r_code);
      }
      
//------------------------- Update TWO LAST PHF record -------------------/
      
      if (proc_history_descriptor.records_no >= 2)
      {
//--- Set FHF pointer to ZERO feeding record ---/

         FileSeek(proc_history_descriptor.handle,DFM_SERVER_HISTORY_FILE_HEADER_SIZE,SEEK_SET);

//------------------------- Update SECOND LAST PHF record ----------------/

//--- Find first feeding record for SECOND PHF record ---/

         start_record_no = (ulong) (-1);

         for (i_ulong = 0; i_ulong < fh_descriptor.records_no; i_ulong++)
         {
            FileReadStruct(proc_history_descriptor.handle,feeding_rate_record);
         
            if (feeding_rate_record.time >= proc_history_descriptor.h_record[1].time)
            {
               start_record_no = i_ulong;
               break;
            }
         }
         
         if (start_record_no == (ulong) (-1))
         {
            r_code = 31;
      
            Print("(Proc Descr) DFM_Server_Update_LBT_Proc_History_Item() Update SECOND LAST PHF record ERROR: " + IntegerToString(r_code,0,'0') + 
                  ", FHF records_no=" + IntegerToString(fh_descriptor.records_no,0,'0'));
                  
            proc_history_descriptor.reactivation_flag = 1;
            
            return(r_code);
         }
      
         proc_history_descriptor.last_feeding_record_no = start_record_no;       // FHF start feeding record for SECOND PHF Last Record (already red)

//--- Update SECOND last PHF record ---/

         DFM_Copy_MqlRate(feeding_rate_record, proc_history_descriptor.h_record[1]);
      
         proc_history_descriptor.h_record[1].time = (proc_history_descriptor.h_record[1].time / 
                                                      (datetime)proc_feeding_period_multiplier) * (datetime)proc_feeding_period_multiplier;
                                                      
         if (proc_history_descriptor.last_feeding_record_no >= (fh_descriptor.records_no - 1))
         {
            r_code = 311;
      
            Print("(Proc Descr) DFM_Server_Update_LBT_Proc_History_Item() Update SECOND LAST PHF record ERROR: " + IntegerToString(r_code,0,'0') + 
                  ", FHF last_feeding_record_no=" + IntegerToString(proc_history_descriptor.last_feeding_record_no,0,'0'));
                  
            proc_history_descriptor.reactivation_flag = 1;
            
            return(r_code);
         }

         for (i_ulong = (proc_history_descriptor.last_feeding_record_no + 1); i_ulong < fh_descriptor.records_no; i_ulong++)
         {
            FileReadStruct(proc_history_descriptor.handle,feeding_rate_record);
         
            if (feeding_rate_record.time >= (proc_history_descriptor.h_record[1].time + (datetime)proc_feeding_period_multiplier))
            {
               break;
            }
         
            DFM_Server_Modify_Proc_Record(proc_history_descriptor.h_record[1],feeding_rate_record);
         }
      
         proc_history_descriptor.last_feeding_record_no = i_ulong;         // First feeding record number for FIRTS (0) last PHF record
      
         if (proc_history_descriptor.last_feeding_record_no >= fh_descriptor.records_no)
         {
            r_code = 32;
      
            Print("DFM_Server_Update_LBT_Proc_History_Item() ERROR: getting second last PHF record, r_code=" + IntegerToString(r_code,0,'0') + 
                  ", PHF last feeding records_no=" + IntegerToString(proc_history_descriptor.last_feeding_record_no,0,'0'));
               
            proc_history_descriptor.reactivation_flag = 1;
               
            return(r_code);
         }

//--- Update FIRST last PHF record ---/

         DFM_Copy_MqlRate(feeding_rate_record, proc_history_descriptor.h_record[0]);
      
         proc_history_descriptor.h_record[0].time = (proc_history_descriptor.h_record[0].time / 
                                                      (datetime)proc_feeding_period_multiplier) * (datetime)proc_feeding_period_multiplier;
                                                      
         if (proc_history_descriptor.last_feeding_record_no < (fh_descriptor.records_no - 1))
         {
            for (i_ulong = (proc_history_descriptor.last_feeding_record_no + 1); i_ulong < fh_descriptor.records_no; i_ulong++)
            {
               FileReadStruct(proc_history_descriptor.handle,feeding_rate_record);
         
               if (feeding_rate_record.time >= (proc_history_descriptor.h_record[0].time + (datetime)proc_feeding_period_multiplier))
               {
                  break;
               }
         
               DFM_Server_Modify_Proc_Record(proc_history_descriptor.h_record[0],feeding_rate_record);
            }
      
            if (i_ulong >= fh_descriptor.records_no)
            {
               proc_history_descriptor.last_feeding_record_no = i_ulong - 1;
            }
            else
            {
               proc_history_descriptor.last_feeding_record_no = i_ulong;
            }
         }

//--- ReWrite Two last PHF records ---/

         FileSeek(proc_history_descriptor.proc_fhandle,DFM_SERVER_HISTORY_FILE_HEADER_SIZE + 
                                                       ((proc_history_descriptor.records_no - 2) * DFM_SERVER_HISTORY_FILE_RECORD_SIZE),SEEK_SET);
      
         FileWriteStruct(proc_history_descriptor.proc_fhandle,proc_history_descriptor.h_record[1]);
         FileWriteStruct(proc_history_descriptor.proc_fhandle,proc_history_descriptor.h_record[0]);
      
         FileFlush(proc_history_descriptor.proc_fhandle);
      
//--- Update PHF records_no ---/
         
         h_file_stat = DFM_Get_H_File_Statistics(proc_history_descriptor.proc_fhandle);

         proc_history_descriptor.records_no = h_file_stat.records_no;

//--- Store last feeding rate record ---/
      
         DFM_Copy_MqlRate(feeding_rate_record, proc_history_descriptor.last_feeding_rate_record);
      
      }  //if (proc_history_descriptor.records_no >= 2)

//------------------------- Set feeding_history_descriptor.proc_state ----/
      
      proc_history_descriptor.proc_state = DFM_SERVER_H_DESCRIPTOR_PROC_IS_ACTIVE;

   } // EOF DFM_SERVER_H_DESCRIPTOR_NOT_ACTIVE

//------------------------- DFM_SERVER_H_DESCRIPTOR_PROC_IS_ACTIVE -------/

   if (proc_history_descriptor.proc_state == DFM_SERVER_H_DESCRIPTOR_PROC_IS_ACTIVE)
   {
      r_code = DFM_Server_Update_LBT_Proc_History_Descriptor(proc_history_descriptor,fh_descriptor_id,fh_descriptor,tester_context);
      
      if (r_code != 0)
      {
         r_code = 4;
      
         Print("(Proc Descr) DFM_Server_Update_LBT_Proc_History_Descriptor ERROR: " + IntegerToString(r_code,0,'0'));
         return(r_code);
      }
      
      return(r_code);

   }  // EOF DFM_SERVER_H_DESCRIPTOR_PROC_IS_ACTIVE

//------------------------- ANY OTHER Descriptor State -------------------/

   r_code = 5;
      
   Print("(Proc Descr) DFM_Server_Update_LBT_Proc_History_Item() ERROR: incorrect descriptor state" + IntegerToString(r_code,0,'0') + 
         ", state=" + IntegerToString(proc_history_descriptor.proc_state,0,'0'));
   
   proc_history_descriptor.proc_state = DFM_SERVER_H_DESCRIPTOR_PROC_IS_ACTIVE;
   
   return(r_code);

//------------------------------------------------------------------------/

   return(r_code);
}

//==================== DFM_Server_Update_LBT_Proc_History_Descriptor =====/

int     DFM_Server_Update_LBT_Proc_History_Descriptor
                                                (DFM_Server_History_Descriptor_struct &proc_history_descriptor,
                                                 int                                  fh_descriptor_id,
                                                 DFM_Server_History_Descriptor_struct &fh_descriptor,
                                                 string                               tester_context)
{
int      r_code;

int      proc_feeding_period_multiplier;

MqlRates feeding_rate_record;

ulong    i_ulong;
ulong    start_record_no;

h_file_statistics_struct   h_file_stat;

//------------------------- Reset r_code ---------------------------------/

   r_code = 0;

//------------------------ Check descriptor proc_state -------------------/
   
   if (proc_history_descriptor.proc_state != DFM_SERVER_H_DESCRIPTOR_PROC_IS_ACTIVE)
   {
      r_code = 1;
      
      Print("(Proc Descr) DFM_Server_Update_LBT_Proc_History_Descriptor() ERROR: descriptor state is NOT ACTIVE, r_code=" + IntegerToString(r_code,0,'0') + 
            ", state=" + IntegerToString(proc_history_descriptor.proc_state,0,'0'));
      return(r_code);
   }

//------------------------ Get proc_feeding_period_multiplier ------------/

   proc_feeding_period_multiplier = proc_history_descriptor.period / fh_descriptor.period * 60;

//------------------------ Check FHF records_no --------------------------/
      
   if (fh_descriptor.records_no < (ulong) (3 * proc_feeding_period_multiplier / 60))
   {
      r_code = 2;
      
      Print("(Proc Descr) DFM_Server_Update_LBT_Proc_History_Descriptor() ERROR: feeding hfile if TOO SHORT, r_code=" + IntegerToString(r_code,0,'0') + 
            ", FHF records_no=" + IntegerToString(fh_descriptor.records_no,0,'0'));
      return(r_code);
   }

//------------------------ Set Proc FHF Handle ---------------------------/
   
   proc_history_descriptor.handle = fh_descriptor.handle;
      
   if (proc_history_descriptor.handle < 0)
   {
      FileClose(proc_history_descriptor.proc_fhandle);
      proc_history_descriptor.proc_fhandle = -1;
      
      proc_history_descriptor.proc_state = DFM_SERVER_H_DESCRIPTOR_NOT_ACTIVE;
         
      r_code = 21;
      
      Print("(Proc Descr) DFM_Server_Update_LBT_Proc_History_Descriptor() Assign FHF Handle ERROR: " + IntegerToString(r_code,0,'0') + ", fname=" + fh_descriptor.h_file_name);
      return(r_code);
   }

//------------------------ PHF ZERO records_no process -------------------/
   
   if (proc_history_descriptor.records_no == 0)
   {
//--- init last_feeding_record_no --/

      proc_history_descriptor.last_feeding_record_no = 0;

      if (fh_descriptor.records_no > DFM_CLIENT_MIN_HISTORY)
      {
         proc_history_descriptor.last_feeding_record_no = (ulong) (fh_descriptor.records_no - DFM_CLIENT_MIN_HISTORY);
      }
      
//      Print("(Proc Descr) DFM_Server_Update_LBT_Proc_History_Descriptor(): LastFeedrecNo=" + IntegerToString(proc_history_descriptor.last_feeding_record_no,0,'0') + 
//               ", PHF FHF multiplier=" + IntegerToString(proc_feeding_period_multiplier,0,'0'));

//--- find first last_feeding_record_no for FULL PHF record ---/

/*
      FileSeek(proc_history_descriptor.handle,
               DFM_SERVER_HISTORY_FILE_HEADER_SIZE + (proc_history_descriptor.last_feeding_record_no * DFM_SERVER_HISTORY_FILE_RECORD_SIZE),
               SEEK_SET);


      start_record_no = (ulong) (-1);
      
      for (i_ulong = proc_history_descriptor.last_feeding_record_no; i_ulong < fh_descriptor.records_no; i_ulong++)
      {
         FileReadStruct(proc_history_descriptor.handle,feeding_rate_record);
            
         if (DFM_Feed_Record_IsStartOf_Proc_Record(feeding_rate_record,proc_feeding_period_multiplier))
         {
            start_record_no = i_ulong;
            break;
         }
      }
*/

      start_record_no = DFM_Server_Get_First_Feeding_Record(proc_history_descriptor.handle,
                                                            proc_history_descriptor.last_feeding_record_no,
                                                            fh_descriptor.records_no,
                                                            proc_feeding_period_multiplier);
      
      Print("(Proc Descr) DFM_Server_Update_LBT_Proc_History_Descriptor(): start_record_no=" + IntegerToString(start_record_no,0,'0'));
      
      if (start_record_no == (ulong) 0)
      {
         r_code = 3;
      
         Print("(Proc Descr) DFM_Server_Update_LBT_Proc_History_Descriptor() ERROR: feeding hfile first period rec NOT Fount, r_code=" + IntegerToString(r_code,0,'0') + 
               ", FHF start records_no=" + IntegerToString(proc_history_descriptor.last_feeding_record_no,0,'0'));
         return(r_code);
      }
      
      proc_history_descriptor.last_feeding_record_no = start_record_no;

//--- Read last_feeding_record_no to feeding_rate_record ---/
      
      FileSeek(proc_history_descriptor.handle,
               DFM_SERVER_HISTORY_FILE_HEADER_SIZE + (proc_history_descriptor.last_feeding_record_no * DFM_SERVER_HISTORY_FILE_RECORD_SIZE),
               SEEK_SET);
      
      FileReadStruct(proc_history_descriptor.handle,feeding_rate_record);

//--- Get SECOND initial PHF record ---/

      DFM_Copy_MqlRate(feeding_rate_record, proc_history_descriptor.h_record[1]);
      
      proc_history_descriptor.h_record[1].time = (proc_history_descriptor.h_record[1].time / 
                                                   (datetime)proc_feeding_period_multiplier) * (datetime)proc_feeding_period_multiplier;
      
      if (proc_history_descriptor.last_feeding_record_no >= (fh_descriptor.records_no - 1))
      {
         r_code = 31;
      
         Print("(Proc Descr) DFM_Server_Update_LBT_Proc_History_Descriptor() ERROR: getting second initial PHF record, last_feeding_record_no=" + IntegerToString(proc_history_descriptor.last_feeding_record_no,0,'0') + 
               ", FHF records_no=" + IntegerToString(fh_descriptor.records_no,0,'0'));
               
         return(r_code);
      }

      for (i_ulong = (proc_history_descriptor.last_feeding_record_no + 1); i_ulong < fh_descriptor.records_no; i_ulong++)
      {
         FileReadStruct(proc_history_descriptor.handle,feeding_rate_record);
         
         if (feeding_rate_record.time >= (proc_history_descriptor.h_record[1].time + (datetime)proc_feeding_period_multiplier))
         {
            break;
         }
         
         DFM_Server_Modify_Proc_Record(proc_history_descriptor.h_record[1],feeding_rate_record);
      }
      
      proc_history_descriptor.last_feeding_record_no = i_ulong;   // NEXT feeding record number (for the FIRST initial PHP record)

      Print("(Proc Descr) DFM_Server_Update_LBT_Proc_History_Descriptor(): start of h_record[0] feeding no=" + IntegerToString(proc_history_descriptor.last_feeding_record_no,0,'0'));
      
      if (proc_history_descriptor.last_feeding_record_no >= fh_descriptor.records_no)
      {
         r_code = 4;
      
         Print("(Proc Descr) DFM_Server_Update_LBT_Proc_History_Descriptor() ERROR: getting second initial PHF record, r_code=" + IntegerToString(r_code,0,'0') + 
               ", PHF last feeding records_no=" + IntegerToString(proc_history_descriptor.last_feeding_record_no,0,'0'));
               
         return(r_code);
      }

//--- Get FIRST initial PHF record ---/

      DFM_Copy_MqlRate(feeding_rate_record, proc_history_descriptor.h_record[0]);
      
      proc_history_descriptor.h_record[0].time = (proc_history_descriptor.h_record[0].time / 
                                                   (datetime)proc_feeding_period_multiplier) * (datetime)proc_feeding_period_multiplier;

      if (proc_history_descriptor.last_feeding_record_no < (fh_descriptor.records_no - 1))
      {
         for (i_ulong = (proc_history_descriptor.last_feeding_record_no + 1); i_ulong < fh_descriptor.records_no; i_ulong++)
         {
            FileReadStruct(proc_history_descriptor.handle,feeding_rate_record);
         
            if (feeding_rate_record.time >= (proc_history_descriptor.h_record[0].time + (datetime)proc_feeding_period_multiplier))
            {
               break;
            }
         
            DFM_Server_Modify_Proc_Record(proc_history_descriptor.h_record[0],feeding_rate_record);
         }
         
         if (i_ulong == fh_descriptor.records_no)              // NEXT Feeding Record to Read by REGULAR Process
         {
            proc_history_descriptor.last_feeding_record_no = i_ulong - 1;
         }
         else
         {
            proc_history_descriptor.last_feeding_record_no = i_ulong;
         }
      }
      
      Print("(Proc Descr) DFM_Server_Update_LBT_Proc_History_Descriptor(): REGULAR start feeding rec no=" + IntegerToString(proc_history_descriptor.last_feeding_record_no,0,'0'));

//--- Write Two initial PHF records ---/

      FileSeek(proc_history_descriptor.proc_fhandle,DFM_SERVER_HISTORY_FILE_HEADER_SIZE,SEEK_SET);
      
      FileWriteStruct(proc_history_descriptor.proc_fhandle,proc_history_descriptor.h_record[1]);
      FileWriteStruct(proc_history_descriptor.proc_fhandle,proc_history_descriptor.h_record[0]);
      
      FileFlush(proc_history_descriptor.proc_fhandle);
      
//--- Update PHF records_no ---/
         
      h_file_stat = DFM_Get_H_File_Statistics(proc_history_descriptor.proc_fhandle);

      proc_history_descriptor.records_no = h_file_stat.records_no;

//--- Store last feeding rate record ---/
      
      DFM_Copy_MqlRate(feeding_rate_record, proc_history_descriptor.last_feeding_rate_record);
      
   }  // if (proc_history_descriptor.records_no == 0)

//------------------------ Check if PHF NO TWO records_no ----------------/

   if (proc_history_descriptor.records_no == 1)
   {
      proc_history_descriptor.reactivation_flag = 1;
      
      proc_history_descriptor.proc_state = DFM_SERVER_H_DESCRIPTOR_NOT_ACTIVE;
      
      r_code = 5;
      
      Print("(Proc Descr) DFM_Server_Update_LBT_Proc_History_Descriptor() ERROR: ONLY PHF record detected, r_code=" + IntegerToString(r_code,0,'0') + 
            ", PHF records_no=" + IntegerToString(proc_history_descriptor.records_no,0,'0'));
               
      return(r_code);
      
   } // if (proc_history_descriptor.records_no == 1)

//------------------------ REGULAR PHF PROCESS ---------------------------/
// proc_history_descriptor.last_feeding_rate_record - LAST (previous) read feeding rate record associated with last PHF record
// proc_history_descriptor.last_feeding_record_no   - NEXT read feeding rate record number
//------------------------------------------------------------------------/

//------------------------ Process last FHF last_feeding_record_no -------/

   FileSeek(proc_history_descriptor.handle,
            DFM_SERVER_HISTORY_FILE_HEADER_SIZE + (proc_history_descriptor.last_feeding_record_no * DFM_SERVER_HISTORY_FILE_RECORD_SIZE),
            SEEK_SET);
   
   FileReadStruct(proc_history_descriptor.handle,feeding_rate_record);

   DFM_Server_AddFeedTo_Proc_Record(proc_history_descriptor,proc_feeding_period_multiplier,feeding_rate_record);
   
   FileFlush(proc_history_descriptor.proc_fhandle);
   
   DFM_Server_Proc_Chart_Refresh(proc_history_descriptor,tester_context);
   
//   if (tester_context == "Y")
//   {
//      Sleep(3);
//   }

//------------------------ Process ALL others FHF feeding records --------/

   if (proc_history_descriptor.last_feeding_record_no < (fh_descriptor.records_no - 1))
   {
      for (i_ulong = (proc_history_descriptor.last_feeding_record_no + 1); i_ulong < fh_descriptor.records_no; i_ulong++)
      {
         FileReadStruct(proc_history_descriptor.handle,feeding_rate_record);
         
         DFM_Server_AddFeedTo_Proc_Record(proc_history_descriptor,proc_feeding_period_multiplier,feeding_rate_record);
         
         FileFlush(proc_history_descriptor.proc_fhandle);
   
         DFM_Server_Proc_Chart_Refresh(proc_history_descriptor,tester_context);
         
//         if (tester_context == "Y")
//         {
//            Sleep(3);
//         }
      }
      
      proc_history_descriptor.last_feeding_record_no = fh_descriptor.records_no - 1;
   }

//------------------------ Final Flush -----------------------------------/
   
//   FileFlush(proc_history_descriptor.proc_fhandle);

//------------------------------------------------------------------------/

   return(r_code);
}

//==================== DFM_Server_AddFeedTo_Proc_Record ==================/

void     DFM_Server_AddFeedTo_Proc_Record(DFM_Server_History_Descriptor_struct &proc_history_descriptor,
                                          int                                   proc_feeding_period_multiplier,
                                          MqlRates                             &feeding_record)
{
//------------------------ Existing PHF Record Modification --------------/

   if (feeding_record.time < proc_history_descriptor.h_record[0].time + (datetime)proc_feeding_period_multiplier)
   {
      DFM_Server_Modify_Proc_Record(proc_history_descriptor.h_record[0], feeding_record);
      
      FileSeek(proc_history_descriptor.proc_fhandle,DFM_SERVER_HISTORY_FILE_HEADER_SIZE + 
                                                       ((proc_history_descriptor.records_no - 1) * DFM_SERVER_HISTORY_FILE_RECORD_SIZE),SEEK_SET);
      
      FileWriteStruct(proc_history_descriptor.proc_fhandle,proc_history_descriptor.h_record[0]);
      
      return;
   }

//------------------------ Adding next Proc Record -----------------------/

   else
   {
      DFM_Copy_MqlRate(proc_history_descriptor.h_record[0], proc_history_descriptor.h_record[1]);
      DFM_Copy_MqlRate(feeding_record, proc_history_descriptor.h_record[0]);
      
      proc_history_descriptor.h_record[0].time = (proc_history_descriptor.h_record[0].time / 
                                                   (datetime)proc_feeding_period_multiplier) * (datetime)proc_feeding_period_multiplier;
      
      FileSeek(proc_history_descriptor.proc_fhandle,DFM_SERVER_HISTORY_FILE_HEADER_SIZE + 
                                                       (proc_history_descriptor.records_no * DFM_SERVER_HISTORY_FILE_RECORD_SIZE),SEEK_SET);
      
      FileWriteStruct(proc_history_descriptor.proc_fhandle,proc_history_descriptor.h_record[0]);
      
      proc_history_descriptor.records_no = proc_history_descriptor.records_no + 1;
      
      return;
   }

//------------------------------------------------------------------------/

   return;
}

//==================== DFM_Feed_Record_IsStartOf_Proc_Record =============/

bool     DFM_Feed_Record_IsStartOf_Proc_Record(MqlRates &f_rate_record, int period_multiplier)
{
datetime    rec_time;

   rec_time = f_rate_record.time;
   
   rec_time = rec_time / (datetime) period_multiplier;
   rec_time = rec_time * (datetime) period_multiplier;

   if (rec_time == (datetime) f_rate_record.time)
   {
      return(true);
   }

//------------------------------------------------------------------------/

   return(false);
}

//==================== DFM_Server_Get_First_Feeding_Record ===============/

ulong     DFM_Server_Get_First_Feeding_Record(int     fh_handle,
                                              ulong   feeding_record_no,
                                              ulong   total_records_no,
                                              int     pfp_multiplier)
{
ulong    first_feeding_rec;
ulong    i_ulong;

MqlRates feeding_rate_0;
MqlRates feeding_rate_1;

//------------------------ Reset first_feeding_rec -----------------------/

   first_feeding_rec = 0;

//------------------------ Check feeding_record_no -----------------------/

   if (feeding_record_no >= (total_records_no - 1))
   {
      Print("DFM_Server_Get_First_Feeding_Record() ERROR: feeding_record_no TOO BIG, feeding_record_no=" + IntegerToString(feeding_record_no,0,'0') + 
            ", total_records_no=" + IntegerToString(total_records_no,0,'0'));
      
      return(first_feeding_rec);
   }

//------------------------ Search for Processing TF Change ---------------/

   FileSeek(fh_handle,DFM_SERVER_HISTORY_FILE_HEADER_SIZE + (feeding_record_no * DFM_SERVER_HISTORY_FILE_RECORD_SIZE),SEEK_SET);
   
   FileReadStruct(fh_handle,feeding_rate_0);
      
   for (i_ulong = (feeding_record_no + 1); i_ulong < total_records_no; i_ulong++)
   {
      DFM_Copy_MqlRate(feeding_rate_0, feeding_rate_1);
      
      FileReadStruct(fh_handle,feeding_rate_0);
            
      if ((feeding_rate_0.time / (datetime) pfp_multiplier) > (feeding_rate_1.time / (datetime) pfp_multiplier))
      {
         first_feeding_rec = i_ulong;
         return(first_feeding_rec);
      }
   }

//------------------------------------------------------------------------/

   return(first_feeding_rec);
}

//==================== DFM_Server_Modify_Proc_Record =====================/

void     DFM_Server_Modify_Proc_Record(MqlRates &proc_rate_record, MqlRates &feed_rate_record)
{
   if (feed_rate_record.high > proc_rate_record.high)
   {
      proc_rate_record.high = feed_rate_record.high;
   }
   
   if (feed_rate_record.low < proc_rate_record.low)
   {
      proc_rate_record.low = feed_rate_record.low;
   }
   
   proc_rate_record.close       = feed_rate_record.close;
   
   proc_rate_record.tick_volume = proc_rate_record.tick_volume + feed_rate_record.tick_volume;
   
   if (proc_rate_record.tick_volume > 300)
   {
      proc_rate_record.tick_volume = 300;
   }
//   proc_rate_record.real_volume = proc_rate_record.real_volume + feed_rate_record.real_volume;

//   proc_rate_record.tick_volume = 0;
   proc_rate_record.real_volume = 0;

//------------------------------------------------------------------------/

   return;
}

//==================== DFM_Server_Reactivate_Associate_Proc_Descr ========/

void     DFM_Server_Reactivate_Associate_Proc_Descr(DFM_Server_Processing_Item_struct &dfm_s_proc_item,string tester_context)
{
int      fh_descriptor_id;
int      i;

//------------------------ Set fh_descriptor_id --------------------------/

   fh_descriptor_id = dfm_s_proc_item.feeding_history_descriptor_id;
   
   if (tester_context == "Y")
   {
      for (i = 0; i < DFM_SERVER_MAX_PROC_ITEMS; i++)
      {
         if (
               (DFM_Server_Testing_Item[i].activity_flag                 == DFM_SERVER_PROC_ITEM_ACTIVE) &&
               (DFM_Server_Testing_Item[i].feeding_history_descriptor_id == fh_descriptor_id)
            )
         {
            DFM_Server_Testing_History_Descriptor[DFM_Server_Testing_Item[i].processing_history_descriptor_id].reactivation_flag = 1;
            
            Print("DFM_Server_Reactivate_Associate_Proc_Descr() Test_Descr ReActivation: Testing_Item i=" + IntegerToString(i,0,'0') + 
                  ", PHF descriptor_id=" + IntegerToString(DFM_Server_Testing_Item[i].processing_history_descriptor_id,0,'0'));
         }
      }
   }
   else
   {
      for (i = 0; i < DFM_SERVER_MAX_PROC_ITEMS; i++)
      {
         if (
               (DFM_Server_Processing_Item[i].activity_flag                 == DFM_SERVER_PROC_ITEM_ACTIVE) &&
               (DFM_Server_Processing_Item[i].feeding_history_descriptor_id == fh_descriptor_id)
            )
         {
            DFM_Server_Processing_History_Descriptor[DFM_Server_Processing_Item[i].processing_history_descriptor_id].reactivation_flag = 1;
            
            Print("DFM_Server_Reactivate_Associate_Proc_Descr() Proc_Descr ReActivation: Processing_Item i=" + IntegerToString(i,0,'0') + 
                  ", PHF descriptor_id=" + IntegerToString(DFM_Server_Processing_Item[i].processing_history_descriptor_id,0,'0'));
         }
      }
   }

//------------------------------------------------------------------------/

   return;
}

//=== eof mbs_dfm_server_proc_history_library.mqh ========================/



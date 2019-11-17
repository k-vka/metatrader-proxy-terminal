//====================== vka_message_broker_server_library.mqh =======/

//====================== DFM_Server_Reset_Comm_Stat ==================/

void     DFM_Server_Reset_Comm_Stat()
{

   DFM_Server_Comm_Stat.rcv_message_no  = 0;
   DFM_Server_Comm_Stat.rcv_error_no    = 0;
   DFM_Server_Comm_Stat.reactivation_no = 0;
   DFM_Server_Comm_Stat.last_message_datetime = TimeLocal();

//--------------------------------------------------------------------/

   return;
}

//====================== Init_DFM_Message_Server =====================/

int     Init_DFM_Message_Server()
{
int   r_code;

   r_code = 0;
   
//------------------------- Get ZMQ Library Version ------------------/

   zmq_version(dfm_zmq_ver_major, dfm_zmq_ver_minor, dfm_zmq_ver_patch);

//------------------------- Create ZMQ Context -----------------------/

   dfm_server_ctx = zmq_ctx_new();
   
   if (dfm_server_ctx == NULL)
   {
      r_code = 1;
      return(r_code);
   }
   
//------------------------- Create ZMQ Socket ------------------------/
   
   dfm_server_socket = zmq_socket (dfm_server_ctx, ZMQ_REP);
   
   if (dfm_server_socket == NULL)
   {
      r_code = 2;
      
      dfm_zmq_errno = zmq_errno();
      Print("(Init) zmq_socket() ERROR: "+IntegerToString(dfm_zmq_errno,0,' ')+" - "+zmq_strerror(dfm_zmq_errno));
      
      return(r_code);
   }
   
   if (zmq_setsockopt(dfm_server_socket, ZMQ_LINGER, zmq_linger_val, sizeof(zmq_linger_val)) != 0)
   {
      r_code = 3;
      
      dfm_zmq_errno = zmq_errno();
      Print("(Init) zmq_setsockopt() ERROR: "+IntegerToString(dfm_zmq_errno,0,' ')+" - "+zmq_strerror(dfm_zmq_errno));
      
      return(r_code);
   }

//------------------------- Bind ZMQ Socket --------------------------/

   StringToCharArray(dfm_server_endpoint,dfm_msg_temp_array,0,-1,CP_ACP);

   if (zmq_bind(dfm_server_socket, dfm_msg_temp_array) != 0)
   {
      r_code = 4;
      
      dfm_zmq_errno = zmq_errno();
      Print("(Init) zmq_bind() ERROR: "+IntegerToString(dfm_zmq_errno,0,' ')+" - ", zmq_strerror(dfm_zmq_errno));
      
      return(r_code);
   }

//------------------------- Set dfm_server_state ---------------------/

   dfm_server_state = MSB_PROCESS_STATE_ACTIVE;
   
//--------------------------------------------------------------------/

   return(r_code);
}

//====================== Deinit DFM Message Server =====================/

int     Deinit_DFM_Message_Server()
{
int   r_code;

   r_code = 0;
   
//------------------------- UnBind ZMQ Socket --------------------------/

   StringToCharArray(dfm_server_endpoint,dfm_msg_temp_array,0,-1,CP_ACP);

   if (zmq_unbind(dfm_server_socket, dfm_msg_temp_array) != 0)
   {
      r_code = 11;
      
      dfm_zmq_errno = zmq_errno();
      Print("(Deinit) zmq_unbind() ERROR: "+IntegerToString(dfm_zmq_errno,0,' ')+" - "+zmq_strerror(dfm_zmq_errno));
      
      return(r_code);
   }

//------------------------- Close ZMQ Socket ---------------------------/
   
   if (zmq_close(dfm_server_socket) != 0)
   {
      r_code = 12;
      
      dfm_zmq_errno = zmq_errno();
      Print("(Deinit) zmq_close() ERROR: "+IntegerToString(dfm_zmq_errno,0,' ')+" - "+zmq_strerror(dfm_zmq_errno));
      
      return(r_code);
   }
   
//------------------------- Destroy ZMQ Context -----------------------/

   if (zmq_ctx_term(dfm_server_ctx) != 0)
   {
      r_code = 13;
      
      dfm_zmq_errno = zmq_errno();
      Print("(Deinit) zmq_ctx_term() ERROR: "+IntegerToString(dfm_zmq_errno,0,' ')+" - "+zmq_strerror(dfm_zmq_errno));
      
      return(r_code);
   }

//------------------------- Reset dfm_server_state --------------------/
   
   dfm_server_state = MSB_PROCESS_STATE_NOT_ACTIVE;

   return(r_code);
}

//====================== Rcv_DFM_Request from Client =================/

int     Rcv_DFM_Request()
{
int   r_code;

//------------------------- Reset r_code -----------------------------/

   r_code = 0;

//---------------------- Try to Receive Client Request ---------------/

   r_code = zmq_recv(dfm_server_socket, dfm_rcv_buffer, MSB_MAX_MESSAGE_SIZE, ZMQ_DONTWAIT);

//---------------------- Check if Rcv Error --------------------------/

   if (r_code == -1)
   {
      dfm_zmq_errno = zmq_errno();
   
      if (dfm_zmq_errno == EAGAIN)     // Rcv message is not detected
      {
         r_code = 21;
         return(r_code);
      }

      r_code = 22;                     // // Rcv Error is detected

      Print("(Rcv_Req) zmq_recv() ERROR: "+IntegerToString(dfm_zmq_errno,0,' ')+" - "+zmq_strerror(dfm_zmq_errno));
      return(r_code);
   }

//---------------------- Rcv Operation Success -----------------------/

   else                                      
   {
//--- Check if Rcv Buffer is Truncated ---/

      if (r_code > MSB_MAX_MESSAGE_SIZE)
      {
         r_code = 4;

         Print("(Rcv_Req) zmq_recv() ERROR: Msg Truncated - "+IntegerToString(r_code,0,' '));
         return(r_code);
      }

//--- Rcv Buffer is OK ---/

      else
      {
         dfm_rcv_buffer_len = r_code;
         
         r_code = 0;
         return(r_code);
      }
   }
   
//--------------------------------------------------------------------/

   return(r_code);
}

//====================== Send_DFM_Response to Client ======================/

int     Send_DFM_Response()
{
int   r_code;

//------------------------- Reset r_code ----------------------------------/

   r_code = 0;
   
//   Print("(Send) zmq_send() dfm_send_buffer_len: "+IntegerToString(dfm_send_buffer_len,0,' '));
   
//------------------------- Send Request to Server ------------------------/

   r_code = zmq_send(dfm_server_socket, dfm_send_buffer, dfm_send_buffer_len, 0);
   
   if (r_code == -1)
   {
      r_code = 1;
      
      dfm_zmq_errno = zmq_errno();
      
      Print("(Send) zmq_send() ERROR: "+IntegerToString(dfm_zmq_errno,0,' ')+" - "+zmq_strerror(dfm_zmq_errno));
      return(r_code);
   }
   
   if (r_code != dfm_send_buffer_len)
   {
      r_code = 2;

      Print("(Send) zmq_send() ERROR: "+IntegerToString(r_code,0,' '));
      return(r_code);
   }

//-------------------------------------------------------------------------/

   return(0);
}

//====================== eof vka_message_broker_server_library.mqh ===/


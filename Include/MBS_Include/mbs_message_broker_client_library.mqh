//====================== vka_message_broker_client_library.mqh =======/

//====================== Init_DFM_Message_Client =====================/

int     Init_DFM_Message_Client()
{
int   r_code;

//------------------------- Reset r_code -----------------------------/

   r_code = 0;

//------------------------- Reset dfm_msg_counter --------------------/
   
   dfm_msg_counter = 0;

//------------------------- Get ZMQ Library Version ------------------/

   zmq_version(dfm_zmq_ver_major, dfm_zmq_ver_minor, dfm_zmq_ver_patch);
   
//------------------------- Create ZMQ Context -----------------------/

   dfm_client_ctx = zmq_ctx_new();
   
   if (dfm_client_ctx == NULL)
   {
      r_code = 1;
      return(r_code);
   }
   
//------------------------- Create ZMQ Socket ------------------------/
   
   dfm_client_socket = zmq_socket (dfm_client_ctx, ZMQ_REQ);
   
   if (dfm_client_socket == NULL)
   {
      r_code = 2;
      
      dfm_zmq_errno = zmq_errno();
      Print("(Init) zmq_socket() ERROR: "+IntegerToString(dfm_zmq_errno,0,' ')+" - "+zmq_strerror(dfm_zmq_errno));
      
      return(r_code);
   }
   
   if (zmq_setsockopt(dfm_client_socket, ZMQ_LINGER, zmq_linger_val, sizeof(zmq_linger_val)) != 0)
   {
      r_code = 3;
      
      dfm_zmq_errno = zmq_errno();
      Print("(Init) zmq_setsockopt() ERROR: "+IntegerToString(dfm_zmq_errno,0,' ')+" - "+zmq_strerror(dfm_zmq_errno));
      
      return(r_code);
   }

//------------------------- Connect ZMQ Socket --------------------------/

   StringToCharArray(dfm_server_endpoint,dfm_msg_temp_array,0,-1,CP_ACP);

   if (zmq_connect(dfm_client_socket, dfm_msg_temp_array) != 0)
   {
      r_code = 4;
      
      dfm_zmq_errno = zmq_errno();
      Print("(Init) zmq_connect() ERROR: "+IntegerToString(dfm_zmq_errno,0,' ')+" - "+zmq_strerror(dfm_zmq_errno));
      
      return(r_code);
   }
   
   dfm_client_state = MSB_PROCESS_STATE_ACTIVE;

   return(r_code);
}

//====================== Deinit_DFM_Message_Client =====================/

int     Deinit_DFM_Message_Client()
{
int   r_code;

   r_code = 0;

//------------------------- Close ZMQ Socket ------------------------/
   
   if (zmq_close(dfm_client_socket) != 0)
   {
      r_code = 12;
      
      dfm_zmq_errno = zmq_errno();
      Print("Deinit zmq_close() ERROR: "+IntegerToString(dfm_zmq_errno,0,' ')+" - "+zmq_strerror(dfm_zmq_errno));
      
      return(r_code);
   }
   
//------------------------- Destroy ZMQ Context -----------------------/

   if (zmq_ctx_term(dfm_client_ctx) != 0)
   {
      r_code = 13;
      
      dfm_zmq_errno = zmq_errno();
      Print("Deinit zmq_ctx_term() ERROR: "+IntegerToString(dfm_zmq_errno,0,' ')+" - "+zmq_strerror(dfm_zmq_errno));
      
      return(r_code);
   }
   
   dfm_client_state = MSB_PROCESS_STATE_NOT_ACTIVE;

   return(r_code);
}

//====================== Reinit DFM Message Client =====================/

int     Reinit_DFM_Message_Client()
{
int   r_code;

   r_code = 0;
   
   r_code = Deinit_DFM_Message_Client();
   
   if (r_code != 0)
   {
      r_code = 1;

      Print("(Reinit) Deinit_DFM_Message_Client() ERROR: "+IntegerToString(r_code,0,' '));
      return(r_code);
   }
   
   r_code = Init_DFM_Message_Client();
   
   if (r_code != 0)
   {
      r_code = 2;

      Print("(Reinit) Init_DFM_Message_Client() ERROR: "+IntegerToString(r_code,0,' '));
      return(r_code);
   }
   
   return(r_code);
}

//====================== Send_DFM_Request to Server =======================/

int     Send_DFM_Request()
{
int   r_code;

//------------------------- Reset r_code ----------------------------------/

   r_code = 0;
   
//   Print("(Send) zmq_send() dfm_send_buffer_len: "+IntegerToString(dfm_send_buffer_len,0,' '));
   
//------------------------- Send Request to Server ------------------------/

   r_code = zmq_send(dfm_client_socket, dfm_send_buffer, dfm_send_buffer_len, 0);
   
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

//====================== Rcv_DFM_Response from Server =====================/

int     Rcv_DFM_Response()
{
int   r_code;

//------------------------- Reset r_code ----------------------------------/

   r_code = 0;
   
//------------------------- Waiting for Response from Server --------------/

   dfm_client_poll_item[0].socket  = dfm_client_socket;
   dfm_client_poll_item[0].fd      = 0;
   dfm_client_poll_item[0].events  = ZMQ_POLLIN;
   dfm_client_poll_item[0].revents = 0;

   r_code = zmq_poll (dfm_client_poll_item, 1, MSB_REQUEST_TIMEOUT);

//------------------------- Check Polling Error ---------------------------/
   
   if (r_code == -1)
   {
      r_code = 1;
      
      dfm_zmq_errno = zmq_errno();
      Print("(Rcv_Resp) zmq_poll() ERROR: "+IntegerToString(dfm_zmq_errno,0,' ')+" - "+zmq_strerror(dfm_zmq_errno));
      return(r_code);
   }

//------------------------- Check Polling Timeout -------------------------/
   
   if (r_code != 1)        // if Polling Timeout
   {
      r_code = 2;

      Print("(Rcv_Resp) zmq_poll() ERROR (timeout?): "+IntegerToString(r_code,0,' '));
      
      Deinit_DFM_Message_Client();
      
      return(r_code);
   }

//------------------------- Get Response buffer ---------------------------/

   else
   {
      if ((dfm_client_poll_item[0].revents & ZMQ_POLLIN) == true)
      {
//--- No Polling Item Error detected, Get Rcv Data ---/

         r_code = zmq_recv(dfm_client_socket, dfm_rcv_buffer, MSB_MAX_MESSAGE_SIZE, ZMQ_DONTWAIT);

//--- Check Rcv Error ---/

         if (r_code == -1)
         {
            r_code = 3;
      
            dfm_zmq_errno = zmq_errno();
            Print("(Rcv_Resp) zmq_recv() ERROR: "+IntegerToString(dfm_zmq_errno,0,' ')+" - "+zmq_strerror(dfm_zmq_errno));
            return(r_code);
         }

//--- Process success Rcv ---/

         else
         {
            if (r_code > MSB_MAX_MESSAGE_SIZE)     // if Rcv Buffer Truncated
            {
               r_code = 4;

               Print("(Rcv_Resp) zmq_recv() ERROR: Msg Truncated - "+IntegerToString(r_code,0,' '));
               return(r_code);
            }
            else                                   // if Rcv Message is OK
            {
               dfm_rcv_buffer_len = r_code;
               r_code = 0;
               return(r_code);
            }
         }
      }

//--- Rcv Polling Item Error detected ---/

      else
      {
         r_code = 5;

         Print("(Rcv_Resp) zmq_poll() ERROR: "+IntegerToString(r_code,0,' '));
      
         Deinit_DFM_Message_Client();
         
         return(r_code);
      }
   }

//-------------------------------------------------------------------------/

   return(r_code);
}

//====================== eof vka_message_broker_client_library.mqh ===/


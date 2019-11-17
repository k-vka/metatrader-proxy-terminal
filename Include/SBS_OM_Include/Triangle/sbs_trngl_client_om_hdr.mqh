//================== sbs_trngl_client_om_hdr.mqh ===========================/

#define  SBS_TRIANGLE_DESCRIPTOR_NUMBER                     2
#define  SBS_TRIANGLE_DESCRIPTOR_ASSOCIATE_ORDER_NUMBER     3

#define  SBS_TRIANGLE_ORDER_NO_STATE         0
#define  SBS_TRIANGLE_ORDER_OPEN_STAGE_1     1           // wait for target 1
#define  SBS_TRIANGLE_ORDER_OPEN_STAGE_2     2           // wait for target 2
#define  SBS_TRIANGLE_ORDER_OPEN_STAGE_3     3           // wait for "long close"

//------------------------- sbs_triangle_client_order_data -----------------/

struct   sbs_triangle_client_order_ONLINE_structure
{
//--- order server data ---/

   int         ticket;
   int         signal;
   double      order_price;
   double      stoploss;
   datetime    order_time;
   
   datetime stoploss_change_time;
};

struct   sbs_triangle_client_order_SYNCH_structure
{
   int         signal;
   double      order_price;
   double      stoploss;
   datetime    order_time;
   datetime    synch_time;
};

struct   sbs_triangle_client_order_PHF_structure
{
   int         signal;
   int         state;
   datetime    synch_time;
   double      price;
   double      stoploss;
   double      target;
};

struct   sbs_triangle_client_order_structure
{
   sbs_triangle_client_order_ONLINE_structure   order_online;
   sbs_triangle_client_order_SYNCH_structure    order_synch;
};

struct   sbs_triangle_client_order_service_structure
{
   double      last_calculated_lots_no;
};

struct   sbs_triangle_client_order_descriptor_structure
{
   sbs_triangle_client_order_structure          client_order[SBS_TRIANGLE_DESCRIPTOR_ASSOCIATE_ORDER_NUMBER];
   sbs_triangle_client_order_PHF_structure      order_phf;
   sbs_triangle_client_order_service_structure  order_service_data;
};

struct   sbs_triangle_client_order_data_structure
{
   sbs_triangle_client_order_descriptor_structure   client_order_descriptor[SBS_TRIANGLE_DESCRIPTOR_NUMBER];
};

sbs_triangle_client_order_data_structure   sbs_triangle_client_order_data;

//================== eof sbs_trngl_client_om_hdr.mqh =======================/

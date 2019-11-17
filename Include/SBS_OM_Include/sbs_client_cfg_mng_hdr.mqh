//======================= sbs_client_cfg_mng_hdr.mqh =====================/

//--- risk_val parameters ---/
/*
#define  SBS_CLIENT_CFG_MNG_RISK_MIN_VAL        0.01
#define  SBS_CLIENT_CFG_MNG_RISK_MAX_VAL        0.50
#define  SBS_CLIENT_CFG_MNG_RISK_DEFAULT_VAL    0.05
#define  SBS_CLIENT_CFG_MNG_RISK_VAL_STEP       0.01
*/
//--- sbs_client_config_mng_data_struct ---/
/*
struct sbs_client_config_mng_data_struct
{
   double   risk_val;      // trade risk value (from SBS_CLIENT_CFG_MNG_RISK_MIN_VAL to SBS_CLIENT_CFG_MNG_RISK_MAX_VAL with step SBS_CLIENT_CFG_MNG_RISK_VAL_STEP)
   int      expert_open_order_confirm;
   int      expert_close_order_confirm;
};

sbs_client_config_mng_data_struct     sbs_client_config_mng_data;
*/
//------------------ Configuration Management Indication Data ------------/
/*
int      label_config_mng_number = 1;                 // number of config_mng indication labels (text lines)
string   label_config_mng_prefix = "l_config_mng_";   // prefix for config_mng label names

int      label_config_mng_x_distance = 50;
int      label_config_mng_y_distance = 20;
int      label_config_mng_y_step     = 14;

int      label_config_mng_font_size  = 10;
string   label_config_mng_font_name  = "Arial";
color    label_config_mng_font_color = Yellow;
*/
//======================= eof sbs_client_cfg_mng_hdr.mqh =================/

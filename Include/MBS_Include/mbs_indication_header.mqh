//================== mbs_indication_header.mqh ============================/

//------------------ Common Indication Data -------------------------------/

int      label_common_number = 5;           // number of common indication labels (text lines)
string   label_common_prefix = "l_common_";  // prefix for common label names

input   string    dfm_om_cind_header = "--> Common Data Indication Parameters (UPPER_LEFT Corner)";
input   int       label_common_font_size  = 10;
input   string    label_common_font_name  = "Arial";
input   color     label_common_font_color = Yellow;
input   int       common_x_distance = 5;
input   int       common_y_distance = 20;
input   int       common_y_step     = 14;

int      label_common_x_distance = common_x_distance;
int      label_common_y_distance = common_y_distance;
int      label_common_y_step     = common_y_step;

//================== DFM Server Indication Data ===========================/

int      dfm_server_one_time_indication_flag = 1;

//------------------ DFMS Processing Item Indication Data -----------------/

string   label_dfm_pi_prefix = "l_dfms_pi_";  // prefix for processing items label names

int      label_dfm_pi_x_distance = 5;
int      label_dfm_pi_y_distance = 20 + (14 * 6);
int      label_dfm_pi_y_step     = 14;

//------------------ DFMS Testing Item Indication Data --------------------/

string   label_dfm_ti_prefix = "l_dfms_ti_";  // prefix for testing items label names

int      label_dfm_ti_x_distance = 5;
int      label_dfm_ti_y_distance = 20 + (14 * 24);
int      label_dfm_ti_y_step     = 14;

//------------------ DFMS Processing Descriptor Indication Data -----------/

string   label_dfm_pdescr_prefix = "l_dfms_pdescr_";  // prefix for processing items label names

int      label_dfm_pdescr_x_distance = 220;
int      label_dfm_pdescr_y_distance = 20 + (14 * 6);
int      label_dfm_pdescr_y_step     = 14;

//------------------ DFMS Testing Descriptor Indication Data --------------/

string   label_dfm_tdescr_prefix = "l_dfms_tdescr_";  // prefix for processing items label names

int      label_dfm_tdescr_x_distance = 220;
int      label_dfm_tdescr_y_distance = 20 + (14 * 24);
int      label_dfm_tdescr_y_step     = 14;

//------------------ DFMS Processing Descriptor Indication Var Data -------/

string   label_dfm_pvdescr_prefix = "l_dfms_pvdescr_";  // prefix for processing items label names

int      label_dfm_pvdescr_x_distance = 550;

//------------------ DFMS Testing Descriptor Indication Var Data ----------/

string   label_dfm_tvdescr_prefix = "l_dfms_tvdescr_";  // prefix for processing items label names

int      label_dfm_tvdescr_x_distance = 550;

//------------------ DFMS Processing Descriptor Indication PHF_Resp -------/

int      label_dfm_phf_resp_x_distance = 875;

int      label_dfm_phf_resp_y_distance = 20 + (14 * 6);
int      label_dfm_thf_resp_y_distance = 20 + (14 * 24);

int      label_dfm_phf_resp_y_step     = 14;

//================== Play Sounds Data =====================================/

#define  SBS_PLAY_SOUND_NO_FLAG        0
#define  SBS_PLAY_SOUND_SET_FLAG       1

string   sbs_close_order_sound_file      = "close_order_alert";
string   sbs_open_order_sound_file       = "open_order_alert";
string   sbs_change_sl_order_sound_file  = "change_sl_order_alert";

struct   sbs_play_sound_data_struct
{
   int   open_order_play_flag;
   int   close_order_play_flag;
   int   change_sl_order_play_flag;
};

sbs_play_sound_data_struct    sbs_play_sound_data;

//================== Target Levels Indication Data =========================/

#define  SBS_PATTERNS_TARGET_LINE_NAME_0     "SBS_TRGNL_CLIENT_TRG_LINE_0"
#define  SBS_PATTERNS_TARGET_LINE_NAME_1     "SBS_TRGNL_CLIENT_TRG_LINE_1"

input    string            dfm_om_target_cind_header_0 = ">> Target Line 34-5-5 Indication Parameters";
input    color             dfm_om_target_cind_color_0  = MediumOrchid;
input    ENUM_LINE_STYLE   dfm_om_target_cind_lstyle_0 = STYLE_DASH;
input    int               dfm_om_target_cind_width_0  = 1;

input    string            dfm_om_target_cind_header_1 = ">> Target Line 34-12-12 Indication Parameters";
input    color             dfm_om_target_cind_color_1  = MediumOrchid;
input    ENUM_LINE_STYLE   dfm_om_target_cind_lstyle_1 = STYLE_DASHDOTDOT;
input    int               dfm_om_target_cind_width_1  = 1;

//================== eof mbs_indication_header.mqh ========================/
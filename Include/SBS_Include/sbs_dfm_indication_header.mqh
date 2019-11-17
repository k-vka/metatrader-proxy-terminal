//================== sbs_dfm_indication_header.mqh ========================/

//------------------ Common Indication Data -------------------------------/

int      label_common_number = 8;            // number of common indication labels (text lines)
string   label_common_prefix = "l_common_";  // prefix for common label names

int      label_common_x_distance = 5;
int      label_common_y_distance = 20;
int      label_common_y_step     = 14;

int      label_common_font_size  = 10;
string   label_common_font_name  = "Arial";
color    label_common_font_color = Yellow;

//------------------ Patterns Indication Data -----------------------------/

int      label_patterns_number = 13;             // (17) number of patterns indication labels (text lines)
string   label_patterns_prefix = "l_patterns_"; // prefix for patterns label names

int      label_patterns_x_distance = 5;
int      label_patterns_y_distance = 20;
int      label_patterns_y_step     = 14;

int      label_patterns_font_size  = 10;
string   label_patterns_font_name  = "Arial";
color    label_patterns_font_color = Yellow;

//------------------ Semafor Indication Data ------------------------------/

#define  SBS_DFM_SEMAFOR_HP_SHIFT_POINTS     4
#define  SBS_DFM_SEMAFOR_NP_SHIFT_POINTS     2

string   semafor_indicate_prefix = "sbs_dfm_smf_"; // prefix for semafor arrow names
string   semafor_HP_prefix = "HP_";                // prefix for semafor HP Type arrow names
string   semafor_NP_prefix = "NP_";                // prefix for semafor NP Type arrow names

//================== eof sbs_dfm_indication_header.mqh ====================/
//================== sbs_exp_labels_hdr.mqh ============================/

int      label_x_distance = 5;
int      label_y_distance = 20;
int      label_y_step     = 14;

int      label_font_size  = 10;
string   label_font_name  = "Arial";
color    label_font_color = Yellow;

string   l_symbol       = "sbs_symbol";
string   l_balance      = "sbs_balance";
string   l_equity       = "sbs_equity";
string   l_freemargin   = "sbs_freemargin";
string   l_leverage     = "sbs_leverage";
string   l_margin       = "sbs_margin";
string   l_server       = "sbs_server";
string   l_stopoutlevel = "sbs_stopoutlevel";

string   l_orderticket  = "sbs_orderticket";
string   l_ordertype    = "sbs_ordertype";
string   l_orderlots    = "sbs_orderlots";
string   l_orderprofit  = "sbs_orderprofit";

string   l_spread       = "sbs_spread";
string   l_points       = "sbs_points";

//string   l_sbs_indi01   = "sbs_indi_01";
//string   l_sbs_indi02   = "sbs_indi_02";

//string   l_zone_counters   = "sbs_shv_zone_cnt";
//string   l_zone_high_info  = "sbs_shv_zone_high_info";
//string   l_zone_low_info   = "sbs_shv_zone_low_info";

//string   l_dss_of_macd_01  = "sbs_dss_of_macd_01";

string   l_alx_ft_01    = "alx_ft_01";
string   l_alx_tdi_01   = "alx_tdi_01";

//------------------ SHV Lines data ------------------------------------/

#define  SBS_SHV_HI_ZONE_HI_LINE_NAME     "SBS_SHV_HIZN_HILN"
#define  SBS_SHV_HI_ZONE_LO_LINE_NAME     "SBS_SHV_HIZN_LOLN"
#define  SBS_SHV_LO_ZONE_HI_LINE_NAME     "SBS_SHV_LOZN_HILN"
#define  SBS_SHV_LO_ZONE_LO_LINE_NAME     "SBS_SHV_LOZN_LOLN"
#define  SBS_SHV_ZONE_MIDDLE_LINE_NAME    "SBS_SHV_MDLZN_LINE"

#define  SBS_SHV_HH_COLOR     ForestGreen
#define  SBS_SHV_HL_COLOR     SeaGreen
#define  SBS_SHV_LH_COLOR     Chocolate
#define  SBS_SHV_LL_COLOR     Goldenrod
#define  SBS_SHV_ZM_COLOR     LightCoral

//------------------ FT ZZL Lines Data ---------------------------------/

#define  SBS_DASH_ARROWCODE               4

#define  SBS_FT3_SIGNAL_BAR_LNAME         "SBS_FT3_SIGNAL_BAR_LN"
#define  SBS_FT3_BOUNCE_BAR_LNAME         "SBS_FT3_BOUNCE_BAR_LN"
#define  SBS_FT3_HI_LINE_LNAME            "SBS_FT3_HI_LINE_LN"
#define  SBS_FT3_LO_LINE_LNAME            "SBS_FT3_LO_LINE_LN"
#define  SBS_FT3_MD_LINE_LNAME            "SBS_FT3_MD_LINE_LN"

#define  SBS_FT3_SIGNAL_BAR_COLOR         Crimson
#define  SBS_FT3_BOUNCE_BAR_COLOR         SlateGray
#define  SBS_FT3_HI_LINE_COLOR            Coral
#define  SBS_FT3_LO_LINE_COLOR            Tan
#define  SBS_FT3_MD_LINE_COLOR            SteelBlue

#define  SBS_FT3_SIGNAL_BAR_STYLE         STYLE_SOLID
#define  SBS_FT3_BOUNCE_BAR_STYLE         STYLE_SOLID
#define  SBS_FT3_HI_LINE_STYLE            STYLE_SOLID
#define  SBS_FT3_LO_LINE_STYLE            STYLE_SOLID
#define  SBS_FT3_MD_LINE_STYLE            STYLE_SOLID

#define  SBS_FT3_SIGNAL_BAR_WIDTH         3
#define  SBS_FT3_BOUNCE_BAR_WIDTH         3
#define  SBS_FT3_HI_LINE_WIDTH            3
#define  SBS_FT3_LO_LINE_WIDTH            3
#define  SBS_FT3_MD_LINE_WIDTH            3

//================== eof sbs_exp_labels_hdr.mqh ========================/
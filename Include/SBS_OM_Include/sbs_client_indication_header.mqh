//================== sbs_client_indication_header.mqh ======================/

//------------------ Chart Order Markers Indication Data -------------------/

input   string    dfm_om_com_header = ">> Chart Order Markers Indication Parameters";
input   int       dfm_om_com_font_size = 12;
input   string    dfm_om_com_font_name = "Times New Roman";
input   color     dfm_om_com_font_color = Aqua;


//------------------ General Button Indication Data ------------------------/

input    string   dfm_om_gbtn_header = ">> General Buttons Indication Parameters";
input    color    dfm_om_gbtn_color = clrWhite;
input    color    dfm_om_gbtn_bg_color = clrGray;

//------------------ Control Indication Data -------------------------------/

int      label_control_number     = 17;               // number of control indication labels (text lines)
string   label_control_prefix     = "l_dfm_ctrl_";    // prefix for control label names

int      label_control_x_distance = 30;
int      label_control_y_distance = 20;
int      label_control_y_step     = 16;

//input    string    dfm_om_ctrlid_header = ">> Control Data Indication Parameters";
//input    int      label_control_font_size  = 10;
//input    string   label_control_font_name  = "Arial";
//input    color    label_control_font_color = Yellow;
//input    color    label_control_P_font_color = Gold;

//------------------ Control Button Indication Data ------------------------/

int      button_control_number     = 17;               // Total number of buttons including hided (not used)
string   button_control_prefix     = "button_dfm_";    // prefix for button names

int      button_control_x_distance = 25;

//input    string    dfm_om_ctrlidb_header = ">> Control Buttons Indication Parameters";
//input    int      button_control_font_size  = 7;
//input    string   button_control_font_name  = "Arial";
//input    color    button_control_font_color = Black;


#define  DFM_CONTROL_BUTTONS_START_Y_DISTANCE   140
#define  DFM_CONTROL_BUTTONS_START_Y_STEP       16
#define  DFM_CONTROL_BUTTONS_Y_SIZE             14
#define  DFM_CONTROL_BUTTONS_X_SIZE             60

//------------------------- Button 2 (free_margin_risk_value) --------------/

input    string            dfm_om_Button_2_header = "-->> Free Margin Risk Value Button";
input    ENUM_BASE_CORNER  dfm_free_margin_risk_button_corner = CORNER_LEFT_UPPER;
input    int               dfm_free_margin_risk_button_x_distance = 5;
input    int               dfm_free_margin_risk_button_y_distance = DFM_CONTROL_BUTTONS_START_Y_DISTANCE;

input    color             dfm_free_margin_risk_button_color = clrWhite;
input    color             dfm_free_margin_risk_button_bg_color = clrLightSlateGray;
input    int               dfm_free_margin_risk_button_x_size = DFM_CONTROL_BUTTONS_X_SIZE + 15;
input    int               dfm_free_margin_risk_button_y_size = DFM_CONTROL_BUTTONS_Y_SIZE;

input    int               dfm_free_margin_risk_button_font_size  = 7;
input    string            dfm_free_margin_risk_button_font_name  = "Arial";
input    color             dfm_free_margin_risk_button_font_color = Black;

//------------------------- Button 3 (order_risk_value) --------------------/

input    string            dfm_om_Button_3_header = "-->> Open Order Risk Value Button";
input    ENUM_BASE_CORNER  dfm_order_risk_button_corner = CORNER_LEFT_UPPER;
input    int               dfm_order_risk_button_x_distance = 5;
input    int               dfm_order_risk_button_y_distance = DFM_CONTROL_BUTTONS_START_Y_DISTANCE + (1 * DFM_CONTROL_BUTTONS_START_Y_STEP);

input    color             dfm_order_risk_button_color = clrWhite;
input    color             dfm_order_risk_button_bg_color = clrLightSlateGray;
input    int               dfm_order_risk_button_x_size = DFM_CONTROL_BUTTONS_X_SIZE + 15;
input    int               dfm_order_risk_button_y_size = DFM_CONTROL_BUTTONS_Y_SIZE;

input    int               dfm_order_risk_button_font_size  = 7;
input    string            dfm_order_risk_button_font_name  = "Arial";
input    color             dfm_order_risk_button_font_color = Black;

//------------------------- Button 4 (Global open_order_flag) --------------/

input    string            dfm_om_Button_4_header = "-->> Global Open Order Flag Button";
input    ENUM_BASE_CORNER  dfm_g_open_order_flag_button_corner = CORNER_LEFT_UPPER;
input    int               dfm_g_open_order_flag_button_x_distance = 5;
input    int               dfm_g_open_order_flag_button_y_distance = DFM_CONTROL_BUTTONS_START_Y_DISTANCE + (3 * DFM_CONTROL_BUTTONS_START_Y_STEP);

input    color             dfm_g_open_order_flag_button_color_ON = clrLightSlateGray;
input    color             dfm_g_open_order_flag_button_bg_color_ON = clrGreen;
input    color             dfm_g_open_order_flag_button_color_OFF = clrLightSlateGray;
input    color             dfm_g_open_order_flag_button_bg_color_OFF = clrRed;

input    int               dfm_g_open_order_flag_button_x_size = DFM_CONTROL_BUTTONS_X_SIZE;
input    int               dfm_g_open_order_flag_button_y_size = DFM_CONTROL_BUTTONS_Y_SIZE;

input    int               dfm_g_open_order_flag_button_font_size  = 7;
input    string            dfm_g_open_order_flag_button_font_name  = "Arial";
input    color             dfm_g_open_order_flag_button_font_color = Black;

//------------------------- Button 5 (Global close_order_flag) -------------/

input    string            dfm_om_Button_5_header = "-->> Global Close Order Flag Button";
input    ENUM_BASE_CORNER  dfm_g_close_order_flag_button_corner = CORNER_LEFT_UPPER;
input    int               dfm_g_close_order_flag_button_x_distance = 5;
input    int               dfm_g_close_order_flag_button_y_distance = DFM_CONTROL_BUTTONS_START_Y_DISTANCE + (4 * DFM_CONTROL_BUTTONS_START_Y_STEP);

input    color             dfm_g_close_order_flag_button_color_ON = clrGreen;
input    color             dfm_g_close_order_flag_button_bg_color_ON = clrGreenYellow;
input    color             dfm_g_close_order_flag_button_color_OFF = clrRed;
input    color             dfm_g_close_order_flag_button_bg_color_OFF = clrOrangeRed;

input    int               dfm_g_close_order_flag_button_x_size = DFM_CONTROL_BUTTONS_X_SIZE;
input    int               dfm_g_close_order_flag_button_y_size = DFM_CONTROL_BUTTONS_Y_SIZE;

input    int               dfm_g_close_order_flag_button_font_size  = 7;
input    string            dfm_g_close_order_flag_button_font_name  = "Arial";
input    color             dfm_g_close_order_flag_button_font_color = Black;

//------------------------- Button 6 (Global sl_trail_order_flag) ----------/

input    string            dfm_om_Button_6_header = "-->> Global Stoploss Trailing Order Flag Button";
input    ENUM_BASE_CORNER  dfm_g_sl_trail_order_flag_button_corner = CORNER_LEFT_UPPER;
input    int               dfm_g_sl_trail_order_flag_button_x_distance = 5;
input    int               dfm_g_sl_trail_order_flag_button_y_distance = DFM_CONTROL_BUTTONS_START_Y_DISTANCE + (5 * DFM_CONTROL_BUTTONS_START_Y_STEP);

input    color             dfm_g_sl_trail_order_flag_button_color_ON = clrGreen;
input    color             dfm_g_sl_trail_order_flag_button_bg_color_ON = clrGreenYellow;
input    color             dfm_g_sl_trail_order_flag_button_color_OFF = clrRed;
input    color             dfm_g_sl_trail_order_flag_button_bg_color_OFF = clrOrangeRed;

input    int               dfm_g_sl_trail_order_flag_button_x_size = DFM_CONTROL_BUTTONS_X_SIZE;
input    int               dfm_g_sl_trail_order_flag_button_y_size = DFM_CONTROL_BUTTONS_Y_SIZE;

input    int               dfm_g_sl_trail_order_flag_button_font_size  = 7;
input    string            dfm_g_sl_trail_order_flag_button_font_name  = "Arial";
input    color             dfm_g_sl_trail_order_flag_button_font_color = Black;

//------------------------- Button 8 (Private open_order_flag) -------------/

input    string            dfm_om_Button_8_header = "-->> Private Open Order Flag Button";
input    ENUM_BASE_CORNER  dfm_p_open_order_flag_button_corner = CORNER_LEFT_UPPER;
input    int               dfm_p_open_order_flag_button_x_distance = 5;
input    int               dfm_p_open_order_flag_button_y_distance = DFM_CONTROL_BUTTONS_START_Y_DISTANCE + (7 * DFM_CONTROL_BUTTONS_START_Y_STEP);

input    color             dfm_p_open_order_flag_button_color_ON = clrGreen;
input    color             dfm_p_open_order_flag_button_bg_color_ON = clrGreenYellow;
input    color             dfm_p_open_order_flag_button_color_OFF = clrRed;
input    color             dfm_p_open_order_flag_button_bg_color_OFF = clrOrangeRed;

input    int               dfm_p_open_order_flag_button_x_size = DFM_CONTROL_BUTTONS_X_SIZE;
input    int               dfm_p_open_order_flag_button_y_size = DFM_CONTROL_BUTTONS_Y_SIZE;

input    int               dfm_p_open_order_flag_button_font_size  = 7;
input    string            dfm_p_open_order_flag_button_font_name  = "Arial";
input    color             dfm_p_open_order_flag_button_font_color = Black;

//------------------------- Button 9 (Private close_order_flag) ------------/

input    string            dfm_om_Button_9_header = "-->> Private Close Order Flag Button";
input    ENUM_BASE_CORNER  dfm_p_close_order_flag_button_corner = CORNER_LEFT_UPPER;
input    int               dfm_p_close_order_flag_button_x_distance = 5;
input    int               dfm_p_close_order_flag_button_y_distance = DFM_CONTROL_BUTTONS_START_Y_DISTANCE + (8 * DFM_CONTROL_BUTTONS_START_Y_STEP);

input    color             dfm_p_close_order_flag_button_color_ON = clrGreen;
input    color             dfm_p_close_order_flag_button_bg_color_ON = clrGreenYellow;
input    color             dfm_p_close_order_flag_button_color_OFF = clrRed;
input    color             dfm_p_close_order_flag_button_bg_color_OFF = clrOrangeRed;

input    int               dfm_p_close_order_flag_button_x_size = DFM_CONTROL_BUTTONS_X_SIZE;
input    int               dfm_p_close_order_flag_button_y_size = DFM_CONTROL_BUTTONS_Y_SIZE;

input    int               dfm_p_close_order_flag_button_font_size  = 7;
input    string            dfm_p_close_order_flag_button_font_name  = "Arial";
input    color             dfm_p_close_order_flag_button_font_color = Black;

//------------------------- Button 10 (Private sl_trail_order_flag) --------/

input    string            dfm_om_Button_10_header = "-->> Private Stoploss Trailing Order Flag Button";
input    ENUM_BASE_CORNER  dfm_p_sl_trail_order_flag_button_corner = CORNER_LEFT_UPPER;
input    int               dfm_p_sl_trail_order_flag_button_x_distance = 5;
input    int               dfm_p_sl_trail_order_flag_button_y_distance = DFM_CONTROL_BUTTONS_START_Y_DISTANCE + (9 * DFM_CONTROL_BUTTONS_START_Y_STEP);

input    color             dfm_p_sl_trail_order_flag_button_color_ON = clrGreen;
input    color             dfm_p_sl_trail_order_flag_button_bg_color_ON = clrGreenYellow;
input    color             dfm_p_sl_trail_order_flag_button_color_OFF = clrRed;
input    color             dfm_p_sl_trail_order_flag_button_bg_color_OFF = clrOrangeRed;

input    int               dfm_p_sl_trail_order_flag_button_x_size = DFM_CONTROL_BUTTONS_X_SIZE;
input    int               dfm_p_sl_trail_order_flag_button_y_size = DFM_CONTROL_BUTTONS_Y_SIZE;

input    int               dfm_p_sl_trail_order_flag_button_font_size  = 7;
input    string            dfm_p_sl_trail_order_flag_button_font_name  = "Arial";
input    color             dfm_p_sl_trail_order_flag_button_font_color = Black;

//------------------------- Button 11 ("05:Close") -------------------------/

input    string            dfm_om_Button_11_header = "-->> Close 34-05-05 Orders Button";
input    ENUM_BASE_CORNER  dfm_05_close_button_corner = CORNER_RIGHT_LOWER;
input    int               dfm_05_close_button_x_distance = (5 + DFM_CONTROL_BUTTONS_X_SIZE);
input    int               dfm_05_close_button_y_distance = 10 + (3 * DFM_CONTROL_BUTTONS_START_Y_STEP);

input    color             dfm_05_close_button_color = clrWhite;
input    color             dfm_05_close_button_bg_color = clrGray;
input    int               dfm_05_close_button_x_size = DFM_CONTROL_BUTTONS_X_SIZE;
input    int               dfm_05_close_button_y_size = DFM_CONTROL_BUTTONS_Y_SIZE;

input    int               dfm_05_close_button_font_size  = 7;
input    string            dfm_05_close_button_font_name  = "Arial";
input    color             dfm_05_close_button_font_color = Black;

//------------------------- Button 12 ("12:Close") -------------------------/

input    string            dfm_om_Button_12_header = "-->> Close 34-12-12 Orders Button";
input    ENUM_BASE_CORNER  dfm_12_close_button_corner = CORNER_RIGHT_LOWER;
input    int               dfm_12_close_button_x_distance = (5 + DFM_CONTROL_BUTTONS_X_SIZE);
input    int               dfm_12_close_button_y_distance = 10 + (2 * DFM_CONTROL_BUTTONS_START_Y_STEP);

input    color             dfm_12_close_button_color = clrWhite;
input    color             dfm_12_close_button_bg_color = clrGray;
input    int               dfm_12_close_button_x_size = DFM_CONTROL_BUTTONS_X_SIZE;
input    int               dfm_12_close_button_y_size = DFM_CONTROL_BUTTONS_Y_SIZE;

input    int               dfm_12_close_button_font_size  = 7;
input    string            dfm_12_close_button_font_name  = "Arial";
input    color             dfm_12_close_button_font_color = Black;

//------------------------- Button 13 ("Close All") -------------------------/

input    string            dfm_om_Button_13_header = "-->> Close ALL Orders Button";
input    ENUM_BASE_CORNER  dfm_all_close_button_corner = CORNER_RIGHT_LOWER;
input    int               dfm_all_close_button_x_distance = (5 + DFM_CONTROL_BUTTONS_X_SIZE);
input    int               dfm_all_close_button_y_distance = 10 + (1 * DFM_CONTROL_BUTTONS_START_Y_STEP);

input    color             dfm_all_close_button_color = clrWhite;
input    color             dfm_all_close_button_bg_color = clrGray;
input    int               dfm_all_close_button_x_size = DFM_CONTROL_BUTTONS_X_SIZE;
input    int               dfm_all_close_button_y_size = DFM_CONTROL_BUTTONS_Y_SIZE;

input    int               dfm_all_close_button_font_size  = 7;
input    string            dfm_all_close_button_font_name  = "Arial";
input    color             dfm_all_close_button_font_color = Black;

//------------------------- Button 14 (Private obs_order_val "Only BUY") ---/

input    string            dfm_om_Button_14_header = "-->> Private obs_order_val (Only BUY) Button";
input    ENUM_BASE_CORNER  dfm_p_obs_buy_button_corner = CORNER_LEFT_UPPER;
input    int               dfm_p_obs_buy_button_x_distance = 5;
input    int               dfm_p_obs_buy_button_y_distance = DFM_CONTROL_BUTTONS_START_Y_DISTANCE + (11 * DFM_CONTROL_BUTTONS_START_Y_STEP);

input    color             dfm_p_obs_buy_button_color_ON = clrGreen;
input    color             dfm_p_obs_buy_button_bg_color_ON = clrGreenYellow;
input    color             dfm_p_obs_buy_button_color_OFF = clrWhite;
input    color             dfm_p_obs_buy_button_bg_color_OFF = clrGray;

input    int               dfm_p_obs_buy_button_x_size = DFM_CONTROL_BUTTONS_X_SIZE + 15;
input    int               dfm_p_obs_buy_button_y_size = DFM_CONTROL_BUTTONS_Y_SIZE;

input    int               dfm_p_obs_buy_button_font_size  = 7;
input    string            dfm_p_obs_buy_button_font_name  = "Arial";
input    color             dfm_p_obs_buy_button_font_color = Black;

//------------------------- Button 15 (Private obs_order_val "Only SELL") ---/

input    string            dfm_om_Button_15_header = "-->> Private obs_order_val (Only SELL) Button";
input    ENUM_BASE_CORNER  dfm_p_obs_sell_button_corner = CORNER_LEFT_UPPER;
input    int               dfm_p_obs_sell_button_x_distance = 5;
input    int               dfm_p_obs_sell_button_y_distance = DFM_CONTROL_BUTTONS_START_Y_DISTANCE + (12 * DFM_CONTROL_BUTTONS_START_Y_STEP);

input    color             dfm_p_obs_sell_button_color_ON = clrGreen;
input    color             dfm_p_obs_sell_button_bg_color_ON = clrGreenYellow;
input    color             dfm_p_obs_sell_button_color_OFF = clrWhite;
input    color             dfm_p_obs_sell_button_bg_color_OFF = clrGray;

input    int               dfm_p_obs_sell_button_x_size = DFM_CONTROL_BUTTONS_X_SIZE + 15;
input    int               dfm_p_obs_sell_button_y_size = DFM_CONTROL_BUTTONS_Y_SIZE;

input    int               dfm_p_obs_sell_button_font_size  = 7;
input    string            dfm_p_obs_sell_button_font_name  = "Arial";
input    color             dfm_p_obs_sell_button_font_color = Black;

//------------------------- Button 16 ("05:TRADE") -------------------------/

input    string            dfm_om_Button_16_header = "-->> (05:TRADE) Button";
input    ENUM_BASE_CORNER  dfm_05_trade_button_corner = CORNER_RIGHT_UPPER;
input    int               dfm_05_trade_button_x_distance = 20 + DFM_CONTROL_BUTTONS_X_SIZE;
input    int               dfm_05_trade_button_y_distance = 10 + (1 * DFM_CONTROL_BUTTONS_START_Y_STEP);

input    color             dfm_05_trade_button_color_ON = clrGreen;
input    color             dfm_05_trade_button_bg_color_ON = clrGreenYellow;
input    color             dfm_05_trade_button_color_OFF = clrWhite;
input    color             dfm_05_trade_button_bg_color_OFF = clrGray;

input    int               dfm_05_trade_button_x_size = DFM_CONTROL_BUTTONS_X_SIZE + 15;
input    int               dfm_05_trade_button_y_size = DFM_CONTROL_BUTTONS_Y_SIZE;

input    int               dfm_05_trade_button_font_size  = 7;
input    string            dfm_05_trade_button_font_name  = "Arial";
input    color             dfm_05_trade_button_font_color = Black;

//------------------------- Button 17 ("12:TRADE") -------------------------/

input    string            dfm_om_Button_17_header = "-->> (12:TRADE) Button";
input    ENUM_BASE_CORNER  dfm_12_trade_button_corner = CORNER_RIGHT_UPPER;
input    int               dfm_12_trade_button_x_distance = 20 + DFM_CONTROL_BUTTONS_X_SIZE;
input    int               dfm_12_trade_button_y_distance = 10 + (2 * DFM_CONTROL_BUTTONS_START_Y_STEP);

input    color             dfm_12_trade_button_color_ON = clrGreen;
input    color             dfm_12_trade_button_bg_color_ON = clrGreenYellow;
input    color             dfm_12_trade_button_color_OFF = clrWhite;
input    color             dfm_12_trade_button_bg_color_OFF = clrGray;

input    int               dfm_12_trade_button_x_size = DFM_CONTROL_BUTTONS_X_SIZE + 15;
input    int               dfm_12_trade_button_y_size = DFM_CONTROL_BUTTONS_Y_SIZE;

input    int               dfm_12_trade_button_font_size  = 7;
input    string            dfm_12_trade_button_font_name  = "Arial";
input    color             dfm_12_trade_button_font_color = Black;

//------------------ GFMR_Change Indication Data ---------------------------/

int      label_GFMR_Change_number     = 2;                     // number of indication labels (text lines)
string   label_GFMR_Change_prefix     = "l_dfm_gmfr_chng_";    // prefix for label names

int      label_GFMR_Change_x_distance = 55;
int      label_GFMR_Change_y_distance = 20 + (16 * 18);
int      label_GFMR_Change_y_step     = 16;

input    string   dfm_om_gfmr_chng_header = ">> GFMR Change Data Indication Parameters";
input    int      label_GFMR_Change_font_size  = 10;
input    string   label_GFMR_Change_font_name  = "Arial";
input    color    label_GFMR_Change_font_color = Yellow;

double   label_GFMR_new_value;

//------------------ GFMR_Change Button Indication Data --------------------/

int      button_GFMR_Change_number     = 4;
string   button_GFMR_Change_prefix     = "button_gmfr_chng_";  // prefix for button names

int      button_GFMR_Change_x_distance = 50;

input    string   dfm_om_gfmr_chngb_header = ">> GFMR Change Buttons Indication Parameters";
input    int      button_GFMR_Change_font_size  = 7;
input    string   button_GFMR_Change_font_name  = "Arial";
input    color    button_GFMR_Change_font_color = Black;

//------------------ GOR_Change Indication Data ----------------------------/

int      label_GOR_Change_number       = 2;                    // number of indication labels (text lines)
string   label_GOR_Change_prefix       = "l_dfm_gor_chng_";    // prefix for label names

int      label_GOR_Change_x_distance   = 55;
int      label_GOR_Change_y_distance   = 20 + (16 * 18);
int      label_GOR_Change_y_step       = 16;

input    string   dfm_om_gor_chng_header = ">> GOR Change Data Indication Parameters";
input    int      label_GOR_Change_font_size    = 10;
input    string   label_GOR_Change_font_name    = "Arial";
input    color    label_GOR_Change_font_color   = Yellow;

double   label_GOR_new_value;

//------------------ GOR_Change Button Indication Data ---------------------/

int      button_GOR_Change_number      = 4;
string   button_GOR_Change_prefix      = "button_gor_chng_";   // prefix for button names

int      button_GOR_Change_x_distance  = 50;

input    string   dfm_om_gor_chngb_header = ">> GOR Change Buttons Indication Parameters";
input    int      button_GOR_Change_font_size   = 7;
input    string   button_GOR_Change_font_name   = "Arial";
input    color    button_GOR_Change_font_color  = Black;

//================== eof sbs_client_indication_header.mqh ==================/
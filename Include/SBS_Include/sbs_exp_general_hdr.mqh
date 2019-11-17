//================== sbs_exp_history_log_hdr.mqh =======================/

string   ExpertComment = "SBS_EXP_04";

string   MO[] = {"jan","feb","mar","apr","may","jun","jul","aug","sep","oct","nov","dec"};

int      zd_code = 0;         // zero divide code

double   norm_pr = 1.0;       // Pair normalization coefficient (norm_pr = 1 for AUDUSD, Point = 0.0001)
double   n_Point;             // Normalized Point (see norm_pr)

datetime last_bar_time = 0;   // new bar first tick indicator

//------------------ Global Expert Profile -----------------------------/

#define     SBS_GLOBAL_EXPERT_NO_PROFILE           0
#define     SBS_GLOBAL_EXPERT_15M_60M_PROFILE      1

#define     SBS_GLOBAL_EXPERT_15M_60M_4H_PROFILE   2
#define     SBS_GLOBAL_EXPERT_GMTS_PROFILE         3

#define     SBS_GLOBAL_EXPERT_M1_SCLP_PROFILE      4
#define     SBS_GLOBAL_EXPERT_M1_RGLR_PROFILE      5

#define     SBS_GLOBAL_EXPERT_M1_ILND_PROFILE      6

#define     SBS_GLOBAL_EXPERT_PATTERNS_PROFILE     7

int      sbs_global_expert_profile = SBS_GLOBAL_EXPERT_PATTERNS_PROFILE;    // CURRENT PROFILE

string   sbs_local_indi_name;

//================== eof ssbs_exp_history_log_hdr.mqh ==================/
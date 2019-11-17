//================== sbs_shv_zone_cases_hdr.mqh ==========================/

#define  CASE_ZONE_POS_NOT_DEFINED                    0     // no zones 
#define  CASE_ZONE_POS_LOW_ONLY                       1     // no high, low zone only
#define  CASE_ZONE_POS_INSIDE_ZONE                    2     // inside zone (high & low are the same)
#define  CASE_ZONE_POS_BETWEEN_HIGH_AND_LOW_NOVLPD    3     // between not overlapped zones
#define  CASE_ZONE_POS_BETWEEN_HIGH_AND_LOW_OVLPD     4     // between overlapped zones
#define  CASE_ZONE_POS_HIGH_ONLY                      5     // no low, high zone only

struct shv_level_case_struct
{
   int      number;              // case number
   int      subnumber;           // subcase number
   int      order_req;           // order type request
};

shv_level_case_struct   shv_level_case;

struct shv_zone_case_struct
{
   int      zone_position;       // somewere between high & low zones
   int      number;              // case number
   int      subnumber;           // subcase number
   int      order_req;           // order type request
   double   local_high_max_val;  // chart local high maximum value
   double   local_min_after_max; // chart local low minimum value after max (second extremum)
   double   local_low_min_val;   // chart local low minimum value
   double   local_max_after_min; // chart local high maximum value after min (second extremum)
};

shv_zone_case_struct    shv_zone_case;

//================== eof sbs_shv_zone_cases_hdr.mqh ======================/
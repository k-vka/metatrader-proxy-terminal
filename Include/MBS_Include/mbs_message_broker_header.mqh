//======================= vka_message_broker_header (ZeroMQ) ==================================/

//----------------------- POSIX Definitions -----------------------------------/

#define     EAGAIN           11

/******************************************************************************/
/*  ZMQ socket definition.                                                    */
/******************************************************************************/

/*  Socket types.                                                             */
#define ZMQ_PAIR     0
#define ZMQ_PUB      1
#define ZMQ_SUB      2
#define ZMQ_REQ      3 
#define ZMQ_REP      4
#define ZMQ_DEALER   5
#define ZMQ_ROUTER   6
#define ZMQ_PULL     7
#define ZMQ_PUSH     8
#define ZMQ_XPUB     9
#define ZMQ_XSUB     10
#define ZMQ_STREAM   11

/*  Deprecated aliases                                                        */
#define ZMQ_XREQ     ZMQ_DEALER
#define ZMQ_XREP     ZMQ_ROUTER

/*  Socket options.                                                           */
#define ZMQ_AFFINITY             4
#define ZMQ_IDENTITY             5
#define ZMQ_SUBSCRIBE            6
#define ZMQ_UNSUBSCRIBE          7
#define ZMQ_RATE                 8
#define ZMQ_RECOVERY_IVL         9
#define ZMQ_SNDBUF               11
#define ZMQ_RCVBUF               12
#define ZMQ_RCVMORE              13
#define ZMQ_FD                   14
#define ZMQ_EVENTS               15
#define ZMQ_TYPE                 16
#define ZMQ_LINGER               17
#define ZMQ_RECONNECT_IVL        18
#define ZMQ_BACKLOG              19
#define ZMQ_RECONNECT_IVL_MAX    21
#define ZMQ_MAXMSGSIZE           22
#define ZMQ_SNDHWM               23
#define ZMQ_RCVHWM               24
#define ZMQ_MULTICAST_HOPS       25
#define ZMQ_RCVTIMEO             27
#define ZMQ_SNDTIMEO             28
#define ZMQ_LAST_ENDPOINT        32
#define ZMQ_ROUTER_MANDATORY     33
#define ZMQ_TCP_KEEPALIVE        34
#define ZMQ_TCP_KEEPALIVE_CNT    35
#define ZMQ_TCP_KEEPALIVE_IDLE   36
#define ZMQ_TCP_KEEPALIVE_INTVL  37
#define ZMQ_TCP_ACCEPT_FILTER    38
#define ZMQ_IMMEDIATE            39
#define ZMQ_XPUB_VERBOSE         40
#define ZMQ_ROUTER_RAW           41
#define ZMQ_IPV6                 42
#define ZMQ_MECHANISM            43
#define ZMQ_PLAIN_SERVER         44
#define ZMQ_PLAIN_USERNAME       45
#define ZMQ_PLAIN_PASSWORD       46
#define ZMQ_CURVE_SERVER         47
#define ZMQ_CURVE_PUBLICKEY      48
#define ZMQ_CURVE_SECRETKEY      49
#define ZMQ_CURVE_SERVERKEY      50
#define ZMQ_PROBE_ROUTER         51
#define ZMQ_REQ_CORRELATE        52
#define ZMQ_REQ_RELAXED          53
#define ZMQ_CONFLATE             54
#define ZMQ_ZAP_DOMAIN           55

/*  Message options                                                           */
#define ZMQ_MORE        1

/*  Send/recv options.                                                        */
#define ZMQ_DONTWAIT    1
#define ZMQ_SNDMORE     2

/*  Security mechanisms                                                       */
#define ZMQ_NULL        0
#define ZMQ_PLAIN       1
#define ZMQ_CURVE       2

/*  Deprecated options and aliases                                            */
#define ZMQ_IPV4ONLY                31
#define ZMQ_DELAY_ATTACH_ON_CONNECT ZMQ_IMMEDIATE
#define ZMQ_NOBLOCK                 ZMQ_DONTWAIT
#define ZMQ_FAIL_UNROUTABLE         ZMQ_ROUTER_MANDATORY
#define ZMQ_ROUTER_BEHAVIOR         ZMQ_ROUTER_MANDATORY

/******************************************************************************/
/*  0MQ socket events and monitoring                                          */
/******************************************************************************/

/*  Socket transport events (tcp and ipc only)                                */
#define ZMQ_EVENT_CONNECTED         1
#define ZMQ_EVENT_CONNECT_DELAYED   2
#define ZMQ_EVENT_CONNECT_RETRIED   4

#define ZMQ_EVENT_LISTENING         8
#define ZMQ_EVENT_BIND_FAILED       16

#define ZMQ_EVENT_ACCEPTED          32
#define ZMQ_EVENT_ACCEPT_FAILED     64

#define ZMQ_EVENT_CLOSED            128
#define ZMQ_EVENT_CLOSE_FAILED      256
#define ZMQ_EVENT_DISCONNECTED      512
#define ZMQ_EVENT_MONITOR_STOPPED   1024

#define ZMQ_EVENT_ALL ( ZMQ_EVENT_CONNECTED | ZMQ_EVENT_CONNECT_DELAYED | \
                        ZMQ_EVENT_CONNECT_RETRIED | ZMQ_EVENT_LISTENING | \
                        ZMQ_EVENT_BIND_FAILED | ZMQ_EVENT_ACCEPTED | \
                        ZMQ_EVENT_ACCEPT_FAILED | ZMQ_EVENT_CLOSED | \
                        ZMQ_EVENT_CLOSE_FAILED | ZMQ_EVENT_DISCONNECTED | \
                        ZMQ_EVENT_MONITOR_STOPPED)

#define ZMQ_POLLIN         1
#define ZMQ_POLLOUT        2
#define ZMQ_POLLERR        4

#define ZMQ_POLLITEMS_DFLT 16

struct   zmq_pollitem_t
{
    int socket;
    int fd;
    short events;
    short revents;
};

#import "libzmq-v120-mt-4_0_4.dll"

void     zmq_version (int &major, int &minor, int &patch);  //void zmq_version (int *major, int *minor, int *patch);
int      zmq_errno ();     // int zmq_errno (void);
string   zmq_strerror (int errnum);    // const char *zmq_strerror (int errnum);

int      zmq_ctx_new (void);     // void *zmq_ctx_new (void);
int      zmq_ctx_term (int context);      // int zmq_ctx_term (void *context);
int      zmq_ctx_shutdown (int ctx_);     // int zmq_ctx_shutdown (void *ctx_);
int      zmq_ctx_set (int context, int option, int optval);    // int zmq_ctx_set (void *context, int option, int optval);
int      zmq_ctx_get (int context, int option);    // int zmq_ctx_get (void *context, int option);

int      zmq_socket (int context, int type);      // void *zmq_socket (void *, int type);
int      zmq_close (int socket);      // int zmq_close (void *s);
int      zmq_setsockopt (int socket, int option, int &optval, int optvallen);     // int zmq_setsockopt (void *s, int option, const void *optval, size_t optvallen);
int      zmq_getsockopt (int socket, int option, uchar &optval[], int &optvallen);    // int zmq_getsockopt (void *s, int option, void *optval, size_t *optvallen);
int      zmq_bind (int socket, uchar &addr[]);    // int zmq_bind (void *s, const char *addr);
int      zmq_connect (int socket, uchar &addr[]);    // int zmq_connect (void *s, const char *addr);
int      zmq_unbind (int socket, uchar &addr[]);     // int zmq_unbind (void *s, const char *addr);
int      zmq_disconnect (int socket, uchar &addr[]);    // int zmq_disconnect (void *s, const char *addr);

int      zmq_send (int socket, uchar &buf[], int len, int flags);// int zmq_send (void *s, const void *buf, size_t len, int flags);
int      zmq_send_const (int socket, uchar &buf[], int len, int flags);      // int zmq_send_const (void *s, const void *buf, size_t len, int flags);
int      zmq_recv (int socket, uchar &buf[], int len, int flags);      // int zmq_recv (void *s, void *buf, size_t len, int flags);
int      zmq_socket_monitor (int socket, string addr, int events);      // int zmq_socket_monitor (void *s, const char *addr, int events);

int      zmq_poll (zmq_pollitem_t &items[], int nitems, long timeout);      // int zmq_poll (zmq_pollitem_t *items, int nitems, long timeout);

#import

//------------------------ MSB Definitions ------------------------------------/

#define  MSB_MAX_MESSAGE_SIZE 1024
#define  MSB_REQUEST_TIMEOUT  3000            // msec

#define  MSB_PROCESS_STATE_NOT_ACTIVE  0
#define  MSB_PROCESS_STATE_ACTIVE      1

//------------------------ MSB General Data -----------------------------------/

int      dfm_zmq_ver_major;   // dfm zmq version major number
int      dfm_zmq_ver_minor;   // dfm zmq version minor number
int      dfm_zmq_ver_patch;   // dfm zmq version patch number

int      dfm_zmq_errno;       // dfm zmq error code

//------------------------ MSB Server Data ------------------------------------/

int      dfm_server_state = MSB_PROCESS_STATE_NOT_ACTIVE;

int      dfm_server_ctx;      // pointer to dfm server context
int      dfm_server_socket;   // pointer to dfm server socket

//------------------------ MSB Client Data ------------------------------------/

int      dfm_client_state = MSB_PROCESS_STATE_NOT_ACTIVE; 

int      dfm_client_ctx;      // pointer to dfm client context
int      dfm_client_socket;   // pointer to dfm client socket

int      zmq_linger_val = 0;  // linger socket value

zmq_pollitem_t    dfm_client_poll_item[1];

//------------------------ MSB Buffers Data ----------------------------------/

uchar    dfm_send_buffer[MSB_MAX_MESSAGE_SIZE];
uchar    dfm_rcv_buffer[MSB_MAX_MESSAGE_SIZE];

int      dfm_send_buffer_len;
int      dfm_rcv_buffer_len;

//======================= EOF vka_message_broker_header (ZeroMQ) ==============================/
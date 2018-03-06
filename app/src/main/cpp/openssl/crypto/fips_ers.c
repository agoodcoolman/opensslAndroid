#include "../openssl/opensslconf.h"

#ifdef OPENSSL_FIPS
# include "../openssl/fips_err.h"
#else
static void *dummy = &dummy;
#endif

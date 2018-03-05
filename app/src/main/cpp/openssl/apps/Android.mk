LOCAL_PATH := $(call my-dir)
include $(CLEAR_VARS)



LOCAL_SRC_FILES := cms.c\
                   rand.c\
                   rsautl.c\
                   s_time.c\
                   speed.c\
                   ts.c\
                   x509.c\
                   vms_decc_init.c\
                   vms_term_sock.c\
                   s_cb.c\
                   s_client.c\
                   s_socket.c\
                   sess_id.c\
                   spkac.c\
                   version.c\
                   app_rand.c\
                   apps.c\
                   asn1pars.c\
                   ca.c\
                   ciphers.c\
                   crl.c\
                   crl2p7.c\
                   dgst.c\
                   dh.c\
                   dhparam.c\
                   dsa.c\
                   dsaparam.c\
                   ec.c\
                   ecparam.c\
                   enc.c\
                   engine.c\
                   errstr.c\
                   gendh.c\
                   gendsa.c\
                   genpkey.c\
                   genrsa.c\
                   nseq.c\
                   ocsp.c\
                   openssl.c\
                   passwd.c\
                   pkcs12.c\
                   pkcs7.c\
                   pkcs8.c\
                   pkey.c\
                   pkeyparam.c\
                   pkeyutl.c\
                   prime.c\
                   req.c\
                   rsa.c\
                   s_server.c\
                   smime.c\
                   srp.c\
                   verify.c\



LOCAL_SHARED_LIBRARY := libssl \
                        libcrypto

LOCAL_C_INCLUDES += $(NDK_PATH)/openssl/openssl \
                    $(NDK_PATH)/openssl/apps \


LOCAL_CFLAGS := -DMONOLITH
LOCAL_CFLAGS += -DOPENSSL_NO_DTLS1 -DLPDIR_H
include $(NDK_PATH)/android-config.mk
LOCAL_MODULE := openssl
#include $(BUILD_SHARED_LIBRARY)
LOCAL_MODULE_TAGS := tests
include $(BUILD_EXECUTABLE)
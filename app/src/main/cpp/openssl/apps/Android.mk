LOCAL_PATH := $(call my-dir)
include $(CLEAR_VARS)

LOCAL_MODULE := openssl

LOCAL_SRC_FILES := apps.c app_rand.c asn1pars.c ca.c ciphers.c cms.c crl.c crl2p7.c dgst.c dh.c \
                   dhparam.c dsa.c dsaparam.c ec.c ecparam.c enc.c engine.c errstr.c gendh.c gendsa.c \
                   genpkey.c genrsa.c nseq.c ocsp.c openssl.c passwd.c pkcs12.c pkcs7.c pkcs8.c pkey.c \
                   pkeyparam.c pkeyutl.c prime.c rand.c req.c rsa.c rsautl.c sess_id.c smime.c speed.c \
                   spkac.c srp.c s_cb.c s_client.c s_server.c s_socket.c s_time.c ts.c verify.c version.c \
                   vms_decc_init.c vms_term_sock.c winrand.c x509.c
LOCAL_C_INCLUDES := $(NDK_PROJECT_PATH) \
                    $(NDK_PROJECT_PATH)/openssl/internal \
                    $(NDK_PROJECT_PATH)/openssl/openssl


include $(BUILD_SHARED_LIBRARY)

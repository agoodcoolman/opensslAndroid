LOCAL_PATH := $(call my-dir)
include $(CLEAR_VARS)



LOCAL_SRC_FILES := openssl/apps/apps.c\
                   openssl/apps/app_rand.c\
                   openssl/apps/asn1pars.c\
                   openssl/apps/ca.c\
                   openssl/apps/ciphers.c\
                   openssl/apps/cms.c\
                   openssl/apps/crl.c\
                   openssl/apps/crl2p7.c\
                   openssl/apps/dgst.c\
                   openssl/apps/dh.c\
                   openssl/apps/dhparam.c\
                   openssl/apps/dsa.c\
                   openssl/apps/dsaparam.c\
                   openssl/apps/ec.c\
                   openssl/apps/ecparam.c\
                   openssl/apps/enc.c\
                   openssl/apps/engine.c\
                   openssl/apps/errstr.c\
                   openssl/apps/gendh.c\
                   openssl/apps/gendsa.c\
                   openssl/apps/genpkey.c\
                   openssl/apps/genrsa.c\
                   openssl/apps/nseq.c\
                   openssl/apps/ocsp.c\
                   openssl/apps/openssl.c\
                   openssl/apps/passwd.c\
                   openssl/apps/pkcs12.c\
                   openssl/apps/pkcs7.c\
                   openssl/apps/pkcs8.c\
                   openssl/apps/pkey.c\
                   openssl/apps/pkeyparam.c\
                   openssl/apps/pkeyutl.c\
                   openssl/apps/prime.c\
                   openssl/apps/rand.c\
                   openssl/apps/req.c\
                   openssl/apps/rsa.c\
                   openssl/apps/rsautl.c\
                   openssl/apps/sess_id.c\
                   openssl/apps/smime.c\
                   openssl/apps/speed.c\
                   openssl/apps/spkac.c\
                   openssl/apps/srp.c\
                   openssl/apps/s_cb.c\
                   openssl/apps/s_client.c\
                   openssl/apps/s_server.c\
                   openssl/apps/s_socket.c\
                   openssl/apps/s_time.c\
                   openssl/apps/ts.c\
                   openssl/apps/verify.c\
                   openssl/apps/version.c\
                   openssl/apps/vms_decc_init.c\
                   openssl/apps/vms_term_sock.c\
                   openssl/apps/x509.c\


LOCAL_SHARED_LIBRARY := libssl \
                        libcrypto

LOCAL_C_INCLUDES := $(NDK_PATH) \
                    $(NDK_PATH)/openssl/crypto/rand \
                    $(NDK_PATH)/openssl/internal \
                    $(NDK_PATH)/openssl/openssl

LOCAL_CFLAGS := -DMONOLITH
LOCAL_CFLAGS += -DOPENSSL_NO_DTLS1 -DLPDIR_H
include $(NDK_PATH)/android-config.mk
LOCAL_MODULE := openssl
include $(BUILD_SHARED_LIBRARY)

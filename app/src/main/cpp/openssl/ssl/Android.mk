LOCAL_PATH := $(call my-dir)
include $(CLEAR_VARS)
LOCAL_MODULE := ssl

LOCAL_SRC_FILES := openssl/ssl/bad_dtls_test.c\
                   openssl/ssl/bio_ssl.c\
                   openssl/ssl/clienthellotest.c\
                   openssl/ssl/d1_both.c\
                   openssl/ssl/d1_clnt.c\
                   openssl/ssl/d1_lib.c\
                   openssl/ssl/d1_meth.c\
                   openssl/ssl/d1_pkt.c\
                   openssl/ssl/d1_srtp.c\
                   openssl/ssl/d1_srvr.c\
                   openssl/ssl/dtlstest.c\
                   openssl/ssl/fatalerrtest.c\
                   openssl/ssl/heartbeat_test.c\
                   openssl/ssl/kssl.c\
                   openssl/ssl/s23_clnt.c\
                   openssl/ssl/s23_lib.c\
                   openssl/ssl/s23_meth.c\
                   openssl/ssl/s23_pkt.c\
                   openssl/ssl/s23_srvr.c\
                   openssl/ssl/s2_clnt.c\
                   openssl/ssl/s2_enc.c\
                   openssl/ssl/s2_lib.c\
                   openssl/ssl/s2_meth.c\
                   openssl/ssl/s2_pkt.c\
                   openssl/ssl/s2_srvr.c\
                   openssl/ssl/s3_both.c\
                   openssl/ssl/s3_cbc.c\
                   openssl/ssl/s3_clnt.c\
                   openssl/ssl/s3_enc.c\
                   openssl/ssl/s3_lib.c\
                   openssl/ssl/s3_meth.c\
                   openssl/ssl/s3_pkt.c\
                   openssl/ssl/s3_srvr.c\
                   openssl/ssl/sslv2conftest.c\
                   openssl/ssl/ssl_algs.c\
                   openssl/ssl/ssl_asn1.c\
                   openssl/ssl/ssl_cert.c\
                   openssl/ssl/ssl_ciph.c\
                   openssl/ssl/ssl_conf.c\
                   openssl/ssl/ssl_err.c\
                   openssl/ssl/ssl_err2.c\
                   openssl/ssl/ssl_lib.c\
                   openssl/ssl/ssl_rsa.c\
                   openssl/ssl/ssl_sess.c\
                   openssl/ssl/ssl_stat.c\
                   openssl/ssl/ssl_task.c\
                   openssl/ssl/ssl_txt.c\
                   openssl/ssl/ssl_utst.c\
                   openssl/ssl/t1_clnt.c\
                   openssl/ssl/t1_enc.c\
                   openssl/ssl/t1_ext.c\
                   openssl/ssl/t1_lib.c\
                   openssl/ssl/t1_meth.c\
                   openssl/ssl/t1_reneg.c\
                   openssl/ssl/t1_srvr.c\
                   openssl/ssl/t1_trce.c\
                   openssl/ssl/tls_srp.c\


local_c_include := \
                    $(NDK_PATH) \
                    $(NDK_PATH)/openssl/openssl \
                    $(NDK_PATH)/openssl/internal \
                    $(NDK_PATH)/openssl/crypto/asn1 \
                    $(NDK_PATH)/openssl/crypto/evp \

include $(CLEAR_VARS)
include $(NDK_PATH)/android-config.mk
LOCAL_SRC_FILES += $(local_src_files)
LOCAL_C_INCLUDES += $(local_c_includes)
LOCAL_SHARED_LIBRARIES += libcrypto
LOCAL_MODULE_TAGS := optional
LOCAL_MODULE:= libssl
include $(BUILD_SHARED_LIBRARY)

ifeq ($(WITH_HOST_DALVIK),true)
    include $(CLEAR_VARS)
    include $(NDK_PATH)/android-config.mk
    LOCAL_SRC_FILES += $(local_src_files)
    LOCAL_C_INCLUDES += $(local_c_includes)
    LOCAL_SHARED_LIBRARIES += libcrypto
    LOCAL_MODULE_TAGS := optional
    LOCAL_MODULE:= libssl
    include $(BUILD_SHARED_LIBRARY)
endif

# ssltest
#include $(CLEAR_VARS)
#include $(NDK_PATH)/android-config.mk
#LOCAL_SRC_FILES:= ssltest.c
#LOCAL_C_INCLUDES += $(local_c_includes)
#LOCAL_SHARED_LIBRARIES := libssl libcrypto
#LOCAL_MODULE:= ssltest
#LOCAL_MODULE_TAGS := optional

#include $(BUILD_SHARED_LIBRARY)
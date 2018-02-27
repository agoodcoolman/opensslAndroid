#include <jni.h>
#include <string>
#include <android/log.h>

#define LOGD(...) ((void)__android_log_print(ANDROID_LOG_DEBUG, "libenc", __VA_ARGS__))
#define LIBENC_LOGI(...) ((void)__android_log_print(ANDROID_LOG_INFO , "libenc", __VA_ARGS__))
#define LIBENC_LOGW(...) ((void)__android_log_print(ANDROID_LOG_WARN , "libenc", __VA_ARGS__))
#define LIBENC_LOGE(...) ((void)__android_log_print(ANDROID_LOG_ERROR, "libenc", __VA_ARGS__))
#define LENGTH(a) (sizeof(a)/sizeof(a[0]))



static JavaVM *jvm;
static JNIEnv *jenv;
static jstring stringFromJNI(
        JNIEnv *env,
        jobject /* this */);
static void stringFromJNI2(
        JNIEnv *env,
        jobject /* this */);

static JNINativeMethod methods[] = {
        {"stringFromJNI",  "()Ljava/lang/String;",  (void *)stringFromJNI},
        {"stringFromJNI2",  "()V",  (void *)stringFromJNI2}
};

static void stringFromJNI2(
        JNIEnv *env,
        jobject /* this */jobject1) {
    std::string hello = "Hello from C++";
    env->NewStringUTF(hello.c_str());
}

static jstring stringFromJNI(
        JNIEnv *env,
        jobject /* this */) {
    std::string hello = "Hello from C++, the world in the";
    return env->NewStringUTF(hello.c_str());
}

jint JNI_OnLoad(JavaVM *vm, void* reserved) {
    jvm = vm;
    if (jvm->GetEnv((void **) &jenv, JNI_VERSION_1_6) != JNI_OK) {
        return JNI_ERR;
    }

    jclass clz = jenv->FindClass("rtmp/jin/com/rtmp/MainActivity");
    if (clz == NULL) {
        return JNI_ERR;
    }

    if (jenv->RegisterNatives(clz, methods, LENGTH(methods))) {
        LOGD("这里");
        return JNI_ERR;
    }
    return JNI_VERSION_1_6;
}


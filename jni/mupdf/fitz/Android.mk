LOCAL_PATH := $(call my-dir)

include $(CLEAR_VARS)

LOCAL_CFLAGS := -O3

ifeq ($(TARGET_ARCH_ABI),armeabi-v7a)
  LOCAL_CFLAGS += -DJDCT_FASTEST=JDCT_FLOAT -DARCH_ARM
  LOCAL_ARM_MODE := arm
endif

ifeq ($(TARGET_ARCH_ABI),armeabi)
  LOCAL_CFLAGS += -DARCH_ARM
  LOCAL_ARM_MODE := arm
endif


LOCAL_C_INCLUDES := $(LOCAL_PATH)/../mupdf $(LOCAL_PATH)/../../jpeg \
	$(LOCAL_PATH)/../../freetype-overlay/include $(LOCAL_PATH)/../../freetype/include \
	$(LOCAL_PATH)/../../jbig2dec $(LOCAL_PATH)/../../openjpeg
LOCAL_MODULE := fitz
LOCAL_SRC_FILES := \
	base_context.c \
	base_error.c \
	base_hash.c \
	base_memory.c \
	base_string.c \
	base_geometry.c \
	\
	crypt_aes.c \
	crypt_arc4.c \
	crypt_md5.c \
	crypt_sha2.c \
	\
	stm_buffer.c \
	stm_open.c \
	stm_read.c \
	stm_comp_buf.c \
	\
	filt_basic.c \
	filt_dctd.c \
	filt_faxd.c \
	filt_flate.c \
	filt_lzwd.c \
	filt_predict.c \
	filt_jbig2d.c \
	\
	res_colorspace.c \
	res_font.c \
	res_pixmap.c \
	res_shade.c \
	res_text.c \
	res_path.c \
	res_bitmap.c \
	res_store.c \
	\
	image_jpx.c \
	\
	dev_list.c \
	dev_text.c \
	dev_bbox.c \
	dev_null.c \
	\
	../../mupdf-apv/fitz/apv_doc_document.c \
	doc_link.c


include $(BUILD_STATIC_LIBRARY)

# vim: set sts=8 sw=8 ts=8 noet:


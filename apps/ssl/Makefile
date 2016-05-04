#
#   Makefile for MatrixSSL example apps
#   'make' builds debug (Default).
#   'make gold' builds optimized.
#
#	Copyright (c) 2013-2016 INSIDE Secure Corporation. All Rights Reserved.
#

MATRIXSSL_ROOT:=../..
SERVER_SRC:=server.c http.c
CLIENT_SRC:=client.c http.c
SRC=$(SERVER_SRC) $(CLIENT_SRC)

SERVER_EXE:=server$(E)
CLIENT_EXE:=client$(E)
EXE=$(SERVER_EXE) $(CLIENT_EXE)

#The Mac OS X Xcode project has a target name of 'server' or 'client'
ifneq (,$(TARGET_NAME))
 ifneq (,$(findstring server,$(TARGET_NAME)))
  CLIENT_EXE:=
  CLIENT_SRC:=
 else
  SERVER_EXE:=
  SERVER_SRC:=
 endif
endif

include $(MATRIXSSL_ROOT)/common.mk

# Linked files
STATIC:=\
	$(MATRIXSSL_ROOT)/matrixssl/libssl_s.a \
	$(MATRIXSSL_ROOT)/crypto/libcrypt_s.a \
	$(MATRIXSSL_ROOT)/core/libcore_s.a

CIPHER_OPTION=ID_RSA # The default cipher option
CFLAGS+=-D$(CIPHER_OPTION)

all: compile

compile: $(OBJS) $(EXE)

# Additional Dependencies
$(OBJS): $(MATRIXSSL_ROOT)/common.mk Makefile $(wildcard *.h)

$(SERVER_EXE): $(SERVER_SRC:.c=.o) $(STATIC)
	$(CC) -o $@ $^ $(LDFLAGS) $(CFLAGS)

$(CLIENT_EXE): $(CLIENT_SRC:.c=.o) $(STATIC)
	$(CC) -o $@ $^ $(LDFLAGS) $(CFLAGS)

clean:
	rm -f $(EXE) $(OBJS) TLS_*.tmp SSL_*.tmp


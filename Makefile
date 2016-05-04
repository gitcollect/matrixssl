#
# Recursively build the directories below
# @version $Format:%h%d$
#

ifneq (,$(findstring clean,$(MAKECMDGOALS)))
  SUBARGS:=clean
endif

default: all

.PHONY: all libs tests apps clean

all: libs tests apps

libs:
	$(MAKE) --directory=core
	$(MAKE) --directory=crypto
	$(MAKE) --directory=matrixssl

tests:
	$(MAKE) --directory=crypto/test
	$(MAKE) --directory=matrixssl/test

# Note apps is also a direct subdirectory
apps:
	$(MAKE) --directory=apps/ssl
	$(MAKE) --directory=apps/dtls

clean:
	$(MAKE) clean --directory=core
	$(MAKE) clean --directory=crypto
	$(MAKE) clean --directory=matrixssl
	$(MAKE) clean --directory=crypto/test
	$(MAKE) clean --directory=matrixssl/test
	$(MAKE) clean --directory=apps/ssl
	$(MAKE) clean --directory=apps/dtls


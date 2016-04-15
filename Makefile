# Recursively build the directories below, in one of modes
# fips, nonfips, combined
# $Format:%h%d$
all:
	$(MAKE) --directory=core
	$(MAKE) --directory=crypto
	$(MAKE) --directory=matrixssl

test:
	$(MAKE) --directory=crypto/test
	$(MAKE) --directory=matrixssl/test

clean:
	$(MAKE) clean --directory=core
	$(MAKE) clean --directory=crypto
	$(MAKE) clean --directory=crypto/test
	$(MAKE) clean --directory=matrixssl
	$(MAKE) clean --directory=matrixssl/test

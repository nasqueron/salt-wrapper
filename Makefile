#   -------------------------------------------------------------
#   Makefile for salt-wrapper
#   - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
#   Project:        salt-wrapper
#   Licence:        BSD-2-Clause
#   -------------------------------------------------------------

INSTALL=/usr/bin/install
RM=/bin/rm -f
PREFIX?=/usr/local

#   -------------------------------------------------------------
#   Installation main targets
#   - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

install:
	${INSTALL} salt-get-config-dir.py ${PREFIX}/bin/salt-get-config-dir
	${INSTALL} salt-wrapper.sh ${PREFIX}/bin/salt-wrapper

deinstall:
	${RM} ${PREFIX}/bin/salt-get-config-dir
	${RM} ${PREFIX}/bin/salt-wrapper

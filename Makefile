#   -------------------------------------------------------------
#   Makefile for salt-wrapper
#   - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
#   Project:        salt-wrapper
#   Licence:        BSD-2-Clause
#   -------------------------------------------------------------

INSTALL=/usr/bin/install
RM=/bin/rm -f
GZIP=/usr/bin/gzip
PREFIX?=/usr/local
MANDIR?=/usr/local/man

#   -------------------------------------------------------------
#   Installation main targets
#   - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

install: install-bin install-man

deinstall: deinstall-bin deinstall-man

#   -------------------------------------------------------------
#   Installation detailled targets
#   - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

install-bin:
	${INSTALL} salt-get-config-dir.py ${PREFIX}/bin/salt-get-config-dir
	${INSTALL} salt-wrapper.sh ${PREFIX}/bin/salt-wrapper

install-man:
	${INSTALL} -m 444 man/salt-wrapper.1 man/salt-get-config-dir.1 ${MANDIR}/man1
	${INSTALL} -m 444 man/salt-wrapper.conf.5 ${MANDIR}/man5
	${GZIP} ${MANDIR}/man1/salt-wrapper.1
	${GZIP} ${MANDIR}/man1/salt-get-config-dir.1
	${GZIP} ${MANDIR}/man5/salt-wrapper.conf.5

deinstall-bin:
	${RM} ${PREFIX}/bin/salt-get-config-dir
	${RM} ${PREFIX}/bin/salt-wrapper

deinstall-man:
	${RM} ${MANDIR}/man1/salt-wrapper.1.gz
	${RM} ${MANDIR}/man1/salt-get-config-dir.1.gz
	${RM} ${MANDIR}/man5/salt-wrapper.conf.5.gz

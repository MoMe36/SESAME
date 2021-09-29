# FIXME: before you push into master...
RUNTIMEDIR=/usr/bin/../include/omc/c/
#COPY_RUNTIMEFILES=$(FMI_ME_OBJS:%= && (OMCFILE=% && cp $(RUNTIMEDIR)/$$OMCFILE.c $$OMCFILE.c))

fmu:
	rm -f RLC_FMU_fab.fmutmp/sources/RLC_FMU_fab_init.xml
	cp -a "/usr/bin/../share/omc/runtime/c/fmi/buildproject/"* RLC_FMU_fab.fmutmp/sources
	cp -a RLC_FMU_fab_FMU.libs RLC_FMU_fab.fmutmp/sources/


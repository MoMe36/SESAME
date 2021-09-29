# FIXME: before you push into master...
RUNTIMEDIR=/usr/bin/../include/omc/c/
#COPY_RUNTIMEFILES=$(FMI_ME_OBJS:%= && (OMCFILE=% && cp $(RUNTIMEDIR)/$$OMCFILE.c $$OMCFILE.c))

fmu:
	rm -f simple_sine.fmutmp/sources/simple_sine_init.xml
	cp -a "/usr/bin/../share/omc/runtime/c/fmi/buildproject/"* simple_sine.fmutmp/sources
	cp -a simple_sine_FMU.libs simple_sine.fmutmp/sources/


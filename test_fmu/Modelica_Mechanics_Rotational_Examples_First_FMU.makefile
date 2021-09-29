# FIXME: before you push into master...
RUNTIMEDIR=/usr/bin/../include/omc/c/
#COPY_RUNTIMEFILES=$(FMI_ME_OBJS:%= && (OMCFILE=% && cp $(RUNTIMEDIR)/$$OMCFILE.c $$OMCFILE.c))

fmu:
	rm -f Modelica_Mechanics_Rotational_Examples_First.fmutmp/sources/Modelica_Mechanics_Rotational_Examples_First_init.xml
	cp -a "/usr/bin/../share/omc/runtime/c/fmi/buildproject/"* Modelica_Mechanics_Rotational_Examples_First.fmutmp/sources
	cp -a Modelica_Mechanics_Rotational_Examples_First_FMU.libs Modelica_Mechanics_Rotational_Examples_First.fmutmp/sources/


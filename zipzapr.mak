# zipzapr.mak
# Created by IBM WorkFrame/2 MakeMake at 4:34:56 on 29 July 1997
#
# The actions included in this make file are:
#  Compile::C++ Compiler
#  Link::Linker
#  Bind::Resource Bind
#  Compile::Resource Compiler

.SUFFIXES: .C .RC .obj .res 

.all: \
    .\zipzapr.dll

.C.obj:
    @echo " Compile::C++ Compiler "
    icc.exe /Ti /Ge- /C %s

{H:\ZIPZAP}.C.obj:
    @echo " Compile::C++ Compiler "
    icc.exe /Ti /Ge- /C %s

.RC.res:
    @echo " Compile::Resource Compiler "
    rc.exe -r %s %|dpfF.RES

{H:\ZIPZAP}.RC.res:
    @echo " Compile::Resource Compiler "
    rc.exe -r %s %|dpfF.RES

.\zipzapr.dll: \
    .\MYOBJRES.obj \
    .\MYOBJRES.res \
    {$(LIB)}zipzapr.def \
    zipzapr.mak
    @echo " Link::Linker "
    @echo " Bind::Resource Bind "
    icc.exe @<<
     /B" /de"
     /Fezipzapr.dll 
     zipzapr.def
     .\MYOBJRES.obj
<<
    rc.exe .\MYOBJRES.res zipzapr.dll

.\MYOBJRES.obj: \
    H:\ZIPZAP\MYOBJRES.C \
    zipzapr.mak

.\MYOBJRES.res: \
    H:\ZIPZAP\MYOBJRES.RC \
    {H:\ZIPZAP;$(INCLUDE)}myobjres.dlg \
    H:\ZIPZAP\myobjres.h \
    {H:\ZIPZAP;$(INCLUDE)}zipzap.ih \
    zipzapr.mak

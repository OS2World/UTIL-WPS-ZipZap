# zipzap.mak
# Created by IBM WorkFrame/2 MakeMake at 3:19:01 on 22 Sept 1997
#
# The actions included in this make file are:
#  Compile::SOM Compiler
#  Compile::C++ Compiler
#  Link::Linker

.SUFFIXES:

.SUFFIXES: \
    .IDL .c .obj 

.IDL.c:
    @echo " Compile::SOM Compiler "
    sc.exe -p -S65536 -C65536 -mnoint %s

{H:\ZIPZAP\WPSDLL}.IDL.c:
    @echo " Compile::SOM Compiler "
    sc.exe -p -S65536 -C65536 -mnoint %s

.c.obj:
    @echo " Compile::C++ Compiler "
    icc.exe /Ss /Ti /Gm /Ge- /C %s

{H:\ZIPZAP\WPSDLL}.c.obj:
    @echo " Compile::C++ Compiler "
    icc.exe /Ss /Ti /Gm /Ge- /C %s

all: \
    .\zipzap.dll

.\zipzap.dll: \
    .\ZIPZAP.obj \
    {$(LIB)}somtk.lib \
    {$(LIB)}zipzap.def \
    zipzap.mak
    @echo " Link::Linker "
    icc.exe @<<
     /B" /de /st:262144"
     /Fezipzap.dll 
     somtk.lib 
     zipzap.def
     .\ZIPZAP.obj
<<

.\ZIPZAP.c: \
    H:\ZIPZAP\WPSDLL\ZIPZAP.IDL \
    zipzap.mak

.\ZIPZAP.obj: \
    .\ZIPZAP.c \
    {H:\ZIPZAP\WPSDLL;$(INCLUDE);}zipzap.ih \
    zipzap.mak

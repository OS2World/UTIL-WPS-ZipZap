/* REXX */

/*

 * newzip. This file was created for Gary L. Robinson 

 * by Project Smarts on 17 Sep 1995. 

 */

/*  REXX - newzip install script                        */
/*  Installs newzip's DLL                               */

Parse source . . __rexx_name;
__rexx_dir = Filespec('D',__rexx_name)||Filespec('P',__rexx_name)

Call RxFuncAdd 'SysLoadFuncs', 'REXXUTIL', 'SysLoadFuncs';
Call SysLoadFuncs;           

     /* Get system DLL directory path */
     system_dll='H:\';

     rc = SysDestroyObject('<ZIPZAP_FIO>'); 
     rc=SysDeregisterObjectClass('zipzapfile');     /* Deregister newzipfile class */
     rc = SysDestroyObject('<ZIPZAP_FOO>'); 
     rc=SysDeregisterObjectClass('zipzapfolder');     /* Deregister newzipfolder class */

     Address CMD '@ERASE 'system_dll'zipzap.dll 2>NUL';    /* Erase old DLL */
     Address CMD '@ERASE 'system_dll'zipzapr.dll 2>NUL';    /* Erase old DLL */
     Address CMD '@ERASE 'system_dll'zipzapfi.ico 2>NUL';    /* Erase old DLL */
     Address CMD '@ERASE 'system_dll'zipzapfo.ico 2>NUL';    /* Erase old DLL */
Exit;

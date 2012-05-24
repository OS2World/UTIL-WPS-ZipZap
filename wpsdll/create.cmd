/* REXX */

/*

 * zipzap. This file was created for Gary L. Robinson 

 * by Project Smarts on 19 Jul 1997. 

 */

/*  REXX - zipzap install script                        */
/*  Installs zipzap's DLL                               */

Parse source . . __rexx_name;
__rexx_dir = Filespec('D',__rexx_name)||Filespec('P',__rexx_name)

Call RxFuncAdd 'SysLoadFuncs', 'REXXUTIL', 'SysLoadFuncs';
Call SysLoadFuncs;           

     /* Get system DLL directory path */
     /* system_dll=FileSpec('Drive',Value('SYSTEM_INI',,'OS2ENVIRONMENT'))||'\OS2\DLL';  */
     system_dll='H:\';  
     prog_resdll='H:\ZIPZAP\';  

     rc=SysDeregisterObjectClass('zipzap');     /* Deregister zipzap class */

     Address CMD '@ERASE 'system_dll'\ZIPZAP.DLL 2>NUL';    /* Erase old DLL */
     Address CMD '@ERASE 'system_dll'\ZIPZAPFI.ICO 2>NUL';    /* Erase old DLL */
     Address CMD '@ERASE 'system_dll'\ZIPZAPFO.ICO 2>NUL';    /* Erase old DLL */
     Address CMD '@ERASE 'system_dll'\ZIPZAPR.DLL 2>NUL';    /* Erase old DLL */

     Address CMD '@COPY '__rexx_dir'ZIPZAP.DLL 'system_dll; /* Copy new DLL to system DLL dir */
     Address CMD '@COPY 'prog_resdll'ZIPZAPFI.ICO 'system_dll; /* Copy new DLL to system DLL dir */
     Address CMD '@COPY 'prog_resdll'ZIPZAPFO.ICO 'system_dll; /* Copy new DLL to system DLL dir */
     Address CMD '@COPY 'prog_resdll'ZIPZAPR.DLL 'system_dll; /* Copy new DLL to system DLL dir */

     /* If rc <> 0       
        Then Do;
          Say  "zipzap: Could not replace the zipzap DLL, rc="rc".";
          Say  "zipzap: Delete the object and the DLL from \OS2\DLL directory.";
          Exit;
          End;  */

     /* Everything OK so far.  Register zipzap class */
     rc=SysRegisterObjectClass('zipzapfile',system_dll||'ZIPZAP.DLL');
     If rc <> 1                 /* If zipzap class did not register OK */
        Then Do;
          Say  "zipzap: could not register zipzapfile class, rc="rc".";
          Exit;
          End;    

     rc=SysRegisterObjectClass('zipzapfolder',system_dll||'ZIPZAP.DLL');
     If rc <> 1                 /* If zipzap class did not register OK */
        Then Do;
          Say  "zipzap: could not register zipzapfolder class, rc="rc".";
          Exit;
          End;    



     /* Now create object on Desktop */
     rc=SysCreateObject('zipzapfile', 'zipzapfi.zip', '<WP_DESKTOP>', ,
                        'ICONFILE='system_dll'ZIPZAPFI.ICO;OBJECTID=<ZIPZAP_FIO>;',,
                        'replace');
     If rc <> 1                 /* If there were create errors */
        Then Do;
          Say  "zipzapfile: could not create object on the Desktop, rc="rc".";
          End;
          
     rc=SysCreateObject('zipzapfolder', 'zipzapfo', '<WP_DESKTOP>', ,
                        'ICONFILE='system_dll'ZIPZAPFO.ICO;OBJECTID=<ZIPZAP_FOO>;',,
                        'replace');
     If rc <> 1                 /* If there were create errors */
        Then Do;
          Say  "zipzapfolder: could not create object on the Desktop, rc="rc".";
          End;
          
Exit;

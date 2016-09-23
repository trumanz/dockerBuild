
/var/lib/tftpboot/ESXi6.0.0b:
     mount.mounted:
        - device: /ESXi6.0.0b.iso
        - opts: loop
        - fstype: iso9660
        - mkmnt: True
        - require:
           - file: /ESXi6.0.0b.iso

/ESXi6.0.0b.iso:
    file.managed:
       - source: salt://largefile/ESXi6.0.0b-VMware-VMvisor-Installer-201507001-2809209.x86_64.iso


/var/lib/tftpboot/pxelinux.cfg:
    file.directory:
       - mkdirs: True

/var/lib/tftpboot/menu.c32:
    file.managed:
       - source: salt://largefile/menu.c32
       - mkdirs: True

/var/lib/tftpboot/pxelinux.cfg/default:
    file.managed:
       - require:
          - file: /var/lib/tftpboot/pxelinux.cfg
       - source: salt://pxecfg/default
       - mkdirs: True

/var/lib/tftpboot/pxelinux.cfg/esxi6.0.0b.boot.cfg:
    file.managed:
       - require:
          - file: /var/lib/tftpboot/pxelinux.cfg
       - source: salt://pxecfg/esxi6.0.0b.boot.cfg
       - mkdirs: True

/var/www/html/ESXi_install_script:
     file.managed:
       - source: salt://pxecfg/ESXi_install_script

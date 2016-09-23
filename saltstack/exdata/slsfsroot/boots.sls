isc-dhcp-server:
  pkg.installed:
    - pkgs:
      - isc-dhcp-server
  service.running:
     - watch:
        - file: /etc/dhcp/dhcpd.conf

tftpd-hpa:
  pkg.installed:
    - pkgs:
      - tftpd-hpa
  service.running:
    - watch:
      - file: /etc/default/tftpd-hpa


/var/lib/tftpboot/ESXi6.0.0b:
     mount.mounted:
        - device: /ESXi6.0.0b.iso
        - opts: loop
        - fstype: iso9660
        - mkmnt: True
        - require:
           - file: /ESXi6.0.0b.iso

/etc/dhcp/dhcpd.conf:
    file.managed:
       - source: salt://dhcpd/dhcpd.conf

/etc/default/tftpd-hpa:
    file.managed:
       - source: salt://tftpd-hpa/tftpd-hpa


/ESXi6.0.0b.iso:
    file.managed:
       - source: salt://largefile/ESXi6.0.0b-VMware-VMvisor-Installer-201507001-2809209.x86_64.iso


/var/lib/tftpboot/pxelinux.cfg:
    file.directory:
       - mkdirs: True


/var/lib/tftpboot/pxelinux.cfg/default:
    file.managed:
       - require:
          - file: /var/lib/tftpboot/pxelinux.cfg
       - source: salt://pxecfg/default
       - mkdirs: True

/var/lib/tftpboot/menu.c32:
    file.managed:
       - source: salt://largefile/menu.c32
       - mkdirs: True


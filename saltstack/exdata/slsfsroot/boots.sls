
# DHCP  service
isc-dhcp-server:
  pkg.installed:
    - pkgs:
      - isc-dhcp-server
  service.running:
     - watch:
        - file: /etc/dhcp/dhcpd.conf


/etc/dhcp/dhcpd.conf:
    file.managed:
       - source: salt://dhcpd/dhcpd.conf

# TFTP service
tftpd-hpa:
  pkg.installed:
    - pkgs:
      - tftpd-hpa
  service.running:
    - watch:
      - file: /etc/default/tftpd-hpa


/etc/default/tftpd-hpa:
    file.managed:
       - source: salt://tftpd-hpa/tftpd-hpa


# HTTP service
apache2:
  pkg.installed:
    - pkgs:
      - apache2


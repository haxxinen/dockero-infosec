FROM privoxy

COPY setup.sh /tmp/setup.sh
RUN sh /tmp/setup.sh && rm -r /tmp/setup.sh
COPY configs/vpn_certs /VPN
COPY configs/countries /VPN
WORKDIR /VPN
CMD ["/usr/bin/supervisord"]

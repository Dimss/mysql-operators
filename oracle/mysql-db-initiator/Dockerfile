FROM iad.ocir.io/oracle/mysql-agent:0.1.1
USER root
ADD oc /usr/local/bin
RUN chmod +x /usr/local/bin/oc
ADD dbc.sh /usr/local/bin
RUN chmod +x /usr/local/bin/dbc.sh
ENTRYPOINT "/usr/local/bin/dbc.sh"
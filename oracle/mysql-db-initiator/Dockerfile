FROM iad.ocir.io/oracle/mysql-agent:0.1.1
USER root
ADD dbc.sh /usr/local/bin
ADD oc /usr/local/bin
RUN chmod +x /usr/local/bin/dbc.sh
RUN chmod +x /usr/local/bin/oc
ENTRYPOINT "/usr/local/bin/dbc.sh"
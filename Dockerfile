FROM prom/prometheus

# copy the Prometheus configuration file
COPY prometheus.yml /etc/prometheus/prometheus.yml

# expose the Prometheus server port
EXPOSE 9090
RUN chown -R 1000:2000 /prometheus
# set the entrypoint command
ENTRYPOINT [ "/bin/prometheus" ]
CMD        [ "--config.file=/etc/prometheus/prometheus.yml", \
             "--storage.tsdb.path=/prometheus", \
             "--storage.tsdb.retention=365d", \
             "--web.console.libraries=/usr/share/prometheus/console_libraries", \
             "--web.console.templates=/usr/share/prometheus/consoles", \
             "--web.external-url=http://localhost:9090", \
             "--log.level=info"]
 

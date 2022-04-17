FROM kolyadin/live-video-broadcasting
COPY default.pa /etc/pulse/
RUN rm -rf /etc/entrypoint.sh
COPY entrypoint.sh /var/

RUN sudo chmod +x /var/entrypoint.sh
RUN sudo chmod -R 777 /var/entrypoint.sh
USER webmaster
WORKDIR /var

ENTRYPOINT /var/entrypoint.sh
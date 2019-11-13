FROM dontomage/archlinux-arm
RUN pacman -Sy --noconfirm gitea && pacman -Scc --noconfirm
COPY --chown=root:gitea app.ini /etc/gitea/app.ini
EXPOSE 3000
VOLUME ["/etc/gitea","/var/lib/gitea"]
USER gitea:gitea
ENV USER=gitea
ENV HOME=/var/lib/gitea 
ENV GITEA_WORK_DIR=/var/lib/gitea
CMD ["/usr/bin/gitea", "web", "-c", "/etc/gitea/app.ini"]


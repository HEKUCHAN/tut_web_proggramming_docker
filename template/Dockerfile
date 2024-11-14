FROM ubuntu:22.04


EXPOSE 80

RUN ln -sf /usr/share/zoneinfo/Asia/Tokyo /etc/localtime

RUN apt update \
&& apt install -y init systemd apache2 vim git \
&& apt-get install -y net-tools iputils-ping curl wget telnet less vim sudo lsb-release gnupg \
&& apt-get install -y tzdata locales && locale-gen ja_JP.UTF-8

ENV TZ Asia/Tokyo
ENV LANG ja_JP.UTF-8
ENV LANGUAGE ja_JP:ja

# Set the username
ARG USERNAME=tarou

# Create a user
RUN useradd -m $USERNAME && \
    echo "$USERNAME ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers

COPY ./html /var/www/html

RUN echo "ServerName localhost" >> /etc/apache2/apache2.conf

# ---- Config for CGI ----
COPY ./conf-available/ /etc/apache2/conf-available/

RUN chown www-data:www-data /var/www/html/cgi \
    && chmod 755 /var/www/html/cgi \
    && a2enconf cgi-enabled \
    && a2enmod cgi

RUN chmod 755 -R /var/www/html/cgi
RUN chown $USERNAME:$USERNAME -R /var/www/html/cgi
# ---- Config for CGI ----

USER $USERNAME

WORKDIR /home/$USERNAME

# Install SpaceVim
RUN curl -sLf https://spacevim.org/install.sh | bash

# Run Apache in the foreground
CMD ["sudo", "apache2ctl", "-D", "FOREGROUND"]

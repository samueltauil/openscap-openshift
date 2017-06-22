FROM centos6 
MAINTAINER Samuel Tauil stauil@redhat.com
#RUN rpm -Uvh http://dl.fedoraproject.org/pub/epel/7/x86_64/e/epel-release-7-9.noarch.rpm
RUN rpm -Uvh http://vault.centos.org/6.2/updates/x86_64/Packages/httpd-2.2.15-15.el6.centos.1.x86_64.rpm
USER 1001

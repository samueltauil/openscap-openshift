FROM registry.access.redhat.com/rhel7 
MAINTAINER Samuel Tauil stauil@redhat.com
RUN rpm -Uvh http://dl.fedoraproject.org/pub/epel/7/x86_64/e/epel-release-7-9.noarch.rpm
RUN yum install -y httpd-itk-2.4.7.04-1.el7.x86_64
USER 1001
EXPOSE 80

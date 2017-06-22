FROM registry.access.redhat.com/rhel7
MAINTAINER Samuel Tauil stauil@redhat.com
RUN rpm -Uvh http://dl.fedoraproject.org/pub/epel/7/x86_64/e/epel-release-7-9.noarch.rpm
RUN yum -y update; yum clean
USER 1001

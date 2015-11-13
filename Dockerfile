FROM centos:centos7

MAINTAINER "Daniel Yang" <yang@desheng.me>

# Required Repos
RUN rpm -Uvh http://dl.fedoraproject.org/pub/epel/7/x86_64/e/epel-release-7-5.noarch.rpm && \
    rpm -Uvh http://rpms.famillecollet.com/enterprise/remi-release-7.rpm

# Setup 163 Repo (Just for users in China)
# RUN yum -y install wget && \
#     mv /etc/yum.repos.d/CentOS-Base.repo /etc/yum.repos.d/CentOS-Base.repo.backup && \
#     wget -P /etc/yum.repos.d/ http://mirrors.163.com/.help/CentOS7-Base-163.repo && \
#     yum clean all && \
#     yum makecache

# OS Update
RUN yum update -y && yum install -y \
    vim \
    gearmand

# Ports
EXPOSE 4730

# Run on start
CMD ["gearmand"]
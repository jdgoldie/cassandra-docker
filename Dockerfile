FROM       ubuntu:raring
MAINTAINER Al Tobey <atobey@datastax.com>

VOLUME ["/var/lib/cassandra"]
ENTRYPOINT ["/bin/cassandra-runner.pl"]

ADD datastax-repo_key /root/
ADD datastax-community.sources.list /etc/apt/sources.list.d/
ADD cassandra-runner.pl /bin/
RUN apt-key add /root/datastax-repo_key
RUN rm -f /root/datastax-repo_key
RUN apt-get update
RUN apt-get dist-upgrade -y
RUN apt-get install -y libyaml-perl busybox dropbear net-tools openjdk-7-jre-headless libjna-java dsc20 opscenter sudo datastax-agent
RUN apt-get clean
RUN mkdir -p /root/.ssh
RUN echo 'root:docker' | chpasswd
RUN mkdir -p /etc/opscenter/clusters
ADD Cassandra_in_Docker.conf /etc/opscenter/clusters/

# storage port, JMX, Thrift, CQL Native, OpsCenter, Agents, SSH
EXPOSE 7000 7199 9160 9042 8888


FROM fabric8/fluentd:0.14.0.pre.1

MAINTAINER Jimmi Dyson <jimmidyson@gmail.com>

ENTRYPOINT ["/start-fluentd"]

ENV ELASTICSEARCH_HOST es-logging.default.svc

RUN yum install -y gcc-c++

RUN scl enable rh-ruby22 'gem install --no-document string-scrub -v 0.0.5' && \
    scl enable rh-ruby22 'gem install --no-document fluent-plugin-kubernetes_metadata_filter -v 0.18.0' && \
    scl enable rh-ruby22 'gem install --no-document fluent-plugin-elasticsearch -v 1.4.0' && \
    scl enable rh-ruby22 'gem cleanup fluentd'

ADD start-fluentd /start-fluentd

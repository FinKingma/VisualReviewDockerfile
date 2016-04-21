FROM alpine:3.2

MAINTAINER Fin Kingma

# retrieve required packages
RUN apk add --update \
    wget \
    unzip \
    openjdk7 \
	ca-certificates
	
# variables
ENV dir /usr/vr/

# create and use dir
RUN mkdir ${dir}
ENV PATH ${dir}:$PATH
WORKDIR ${dir}
RUN cd ${dir}

# retrieve file from server
RUN wget https://github.com/xebia/VisualReview/releases/download/0.1.3/visualreview-0.1.3.zip
RUN unzip visualreview-0.1.3.zip
RUN rm visualreview-0.1.3.zip

EXPOSE 7000

# GOGO Visual Review
CMD java -jar visualreview-0.1.3-standalone.jar
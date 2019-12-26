#!/bin/bash

################################################################################

hashi_download_dir=$1
hashi_base_url=$2
software=$3
version=$4
enterprise=$5
beta=$6

function usage() {
  echo "Usage: $0 <download director> <hashi base url> <software> <version> <ent> <beta>"
  echo " e.g.: $0 /data/src/hashicorp https://releases.hashicorp.com vault 1.3.1 ent"
  echo " e.g.: $0 /data/src/hashicorp https://releases.hashicorp.com consul 1.7.0 \"\" beta2"
  echo " e.g.: $0 /data/src/hashicorp https://releases.hashicorp.com nomad 0.10.2"
}

function show_inputs() {
  echo "hashi_download_dir is ${hashi_download_dir}"
  echo "hashi_base_url is ${hashi_base_url}"
  echo "software is ${software}"
  echo "version is ${version}"
  echo "enterprise is ${enterprise}"
  echo "beta is ${beta}"
}

error=0
if [ "${hashi_download_dir}" == "" ]
then
  error=1
elif [ "${hashi_base_url}" == "" ]
then
  error=1
elif [ "${software}" == "" ]
then
  error=1
elif [ "${version}" == "" ]
then
  error=1
fi

if [ "${error}" != "0" ]
then
  usage
  echo ""
  show_inputs
  exit ${error}
fi

if [ "${enterprise}" != "" ]
then
  enterprise="+${enterprise}"
fi

if [ "${beta}" != "" ]
then
  beta="-${beta}"
fi

url=${hashi_base_url}/${software}/${version}${enterprise}${beta}/${software}_${version}${enterprise}${beta}_linux_amd64.zip
mkdir -p ${hashi_download_dir} && \
  cd ${hashi_download_dir} && \
  wget --quiet -O ${software}.zip "${url}" && \
  unzip -q -d /usr/local/bin ${software}.zip && \
  cd -

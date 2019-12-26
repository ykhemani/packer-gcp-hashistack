#!/bin/bash

################################################################################


export project_id=ykhemani
export bucket=ykhemani-image-bucket
export machine_type="g1-small"
export zone="us-east4-c"

export terraform_version=0.12.18
export vault_version=1.3.1
export consul_version=1.6.2
export nomad_version=0.10.2
export packer_version=1.5.1

export hashi_base_url=https://releases.hashicorp.com
export hashi_download_dir=/data/src/hashicorp

export source_image="ubuntu-1804-bionic-v20190404"
export source_image_family="ubuntu-1604-lts"
export ssh_username="ubuntu"

export tag_owner="${project_id}"
export tag_timestamp=$(date +%Y%m%d-%H%M%S)

export image_name="${tag_owner}-hashistack-${tag_timestamp}"
export image_description="HashiStack Terraform ${terraform_version}, Vault ${vault_version}, Consul ${consul_version}, Nomad ${nomad_version} created by ${tag_owner} on ${tag_timestamp}"

packer build hashistack_gce.json

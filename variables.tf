## Copyright (c) 2021, Oracle and/or its affiliates.
## All rights reserved. The Universal Permissive License (UPL), Version 1.0 as shown at http://oss.oracle.com/licenses/upl

variable "tenancy_ocid" {}
variable "user_ocid" {}
variable "fingerprint" {}
variable "private_key_path" {}
variable "region" {}
variable "compartment_id" {}
variable "compartment_ocid" {}
variable "oci_username" {}
variable "oci_user_authtoken" {}

locals {
  ocir_docker_repository = join("", [lower(lookup(data.oci_identity_regions.current_region.regions[0], "key")), ".ocir.io"])
  #ocir_docker_repository = join("", [lower(lookup(data.oci_identity_regions.home_region.regions[0], "key")), ".ocir.io"])
  #ocir_namespace = lookup(data.oci_identity_tenancy.oci_tenancy, "name" )
  ocir_namespace = lookup(data.oci_objectstorage_namespace.ns, "namespace")
}


variable "app_name" {
  default     = "DevOps"
  description = "Application name. Will be used as prefix to identify resources, such as OKE, VCN, DevOps, and others"
}

variable "release" {
  description = "Reference Architecture Release (OCI Architecture Center)"
  default     = "1.2.1"
}

variable "repository_name" {
  default = "nodejs"
}

variable "repository_default_branch" {
  default = "main"
}

variable "repository_description" {
  default = "Sample node express microservice with helm"
}

variable "repository_repository_type" {
  default = "HOSTED"
}

variable "git_repo" {
  default = "https://github.com/ashok-cm/oci-devops-node-service-helm.git"
}

variable "git_repo_name" {
  default = "node-express-remote"
}

variable "build_pipeline_description" {
  default = "Build pipeline for NodeJS express app"
}

variable "build_pipeline_display_name" {
  default = "NodeJS-build-pipeline"
}

variable "build_pipeline_stage_build_source_collection_items_connection_type" {
  default = "DEVOPS_CODE_REPOSITORY"
}

variable "build_pipeline_stage_build_pipeline_stage_type" {
  default = "BUILD"
}

variable "build_pipeline_stage_build_source_collection_items_branch" {
  default = "main"
}

variable "build_pipeline_stage_build_source_collection_items_name" {
  default = "node_express"
}

variable "build_pipeline_stage_build_spec_file" {
  default = ""
}

variable "build_pipeline_stage_display_name" {
  default = "build-pipeline"
}

variable "build_pipeline_stage_image" {
  default = "OL7_X86_64_STANDARD_10"
}

variable "build_pipeline_stage_stage_execution_timeout_in_seconds" {
  default = 36000
}

variable "build_pipeline_stage_wait_criteria_wait_duration" {
  default = "waitDuration"
}

variable "build_pipeline_stage_wait_criteria_wait_type" {
  default = "ABSOLUTE_WAIT"
}

variable "build_pipeline_stage_deliver_artifact_stage_type" {
  default = "DELIVER_ARTIFACT"
}

variable "build_pipeline_stage_deliver_artifact_collection_items_artifact_name" {
  default = "output01"
}

variable "helm_image_url" {}

variable "deliver_artifact_stage_display_name" {
  default = "deliver-artifact"
}

variable "container_repository_is_public" {
  default = true
}

variable "deploy_artifact_argument_substitution_mode" {
  default = "SUBSTITUTE_PLACEHOLDERS"
}

variable "deploy_artifact_deploy_artifact_source_deploy_artifact_source_type" {
  default = "OCIR"
}

variable "deploy_artifact_deploy_artifact_type" {
  default = "DOCKER_IMAGE"
}
resource "oci_devops_build_pipeline" "test_build_pipeline" {

  #Required
  project_id = oci_devops_project.test_project.id

  description  = var.build_pipeline_description
  display_name = var.build_pipeline_display_name

  build_pipeline_parameters {
        #Required
        items {
            #Required
            name = "USER_AUTH_TOKEN"

            #Optional
            default_value = var.oci_user_authtoken
            description = "User auth token to push helm packages."
        }
        
        items {
            #Required
            name = "HELM_REPO_USER"

            #Optional
            default_value = var.oci_username
            description = "User to push helm packages."
        }

        items {
            #Required
            name = "HELM_REPO_URL"

            #Optional
            default_value = "oci://${local.ocir_docker_repository}/${local.ocir_namespace}/${oci_artifacts_container_repository.test_container_repository_helm.display_name}"
            description = "Helm repo URL to push helm packages."
        }

        items {
            #Required
            name = "HELM_REPO"

            #Optional
            default_value = "${local.ocir_docker_repository}"
            description = "Helm repo name"
        }
    }
}

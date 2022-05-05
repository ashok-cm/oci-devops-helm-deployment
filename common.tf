data "oci_identity_regions" "current_region" {
  filter {
    name   = "name"
    values = [var.region]
  }
  provider = oci.current_region
}

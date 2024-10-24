provider "oci" {
  tenancy_ocid = "tenancy-ocid"
  user_ocid = "user-ocid"
  fingerprint = "fingerprint"
  private_key_path = "/path/to/your/private-key.pem"
  region = "us-phoenix-1"
  compartment_ocid = "compartment-ocid" 
}

resource "oci_core_vcn" "oke_vcn" {
  compartment_ocid = "compartment-ocid"
  cidr_block = "10.0.0.0/16"
  display_name = "OKE_VCN"  
}

resource "oci_core_subnet" "oke_subnet" {
  compartment_ocid = "compartment-ocid"
  vcn_id = oci_core_vcn.oke_vcn.id
  cidr_block = "10.0.0.1/24"
  availability_domain = "availability_domain"
  display_name = "OKE_Subnet" 
}

resource "oci_containerengine_cluster" "oke_cluster" {
  compartment_ocid = "compartment-ocid"
  name = "my-oke-cluster"
  vcn_id = oci_core_vcn.oke_vcn.id
  kubernetes_version = "v1.30.1"  
}

resource "oci_containerengine_node_pool" "oke_node_pool" {
  compartment_ocid = "compartment-ocid"
  cluster_id = oci_containerengine_cluster.oke_cluster.id
  name = "oke_node_pool"
  node_shape = "VM.Standard2.1"
  node_config_details {
    size =2
    subnet_ids = [oci_core_subnet.oke_subnet.id]
  }
}


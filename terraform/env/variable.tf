variable "project_id" {
  description = "Google Cloud project ID"
  type        = string
}

variable "region" {
  description = "Region for the resources"
  type        = string
}

variable "credentials_file" {
  description = "Path to the service account JSON key file"
  type        = string
}

variable "vpc_name" {
  description = "Name of the VPC"
  type        = string
}

variable "subnet_name" {
  description = "Name of the subnet"
  type        = string
}

variable "subnet_cidr" {
  description = "CIDR range for the subnet"
  type        = string
}

variable "db_instance_name" {
  description = "Name of the PostgreSQL database instance"
  type        = string
}

variable "region" {
  description = "Region for the resources"
  type        = string
}

variable "project_id" {
  description = "Google Cloud project ID"
  type        = string
}

variable "instance_name" {
  description = "Base name of the compute instances"
  type        = string
}

variable "instance_count" {
  description = "Number of compute instances to create"
  type        = number
}

variable "instance_machine_type" {
  description = "Machine type for the compute instances"
  type        = string
  default     = "n1-standard-1"
}

variable "instance_zone" {
  description = "Zone where the compute instances will be created"
  type        = string
}

variable "instance_tags" {
  description = "Tags to assign to the compute instances"
  type        = list(string)
  default     = []
}

variable "instance_startup_script" {
  description = "StartupScript for the compute instances"
  type        = string
  default     = ""
}

variable "source_ranges" {
  description = "Source IP ranges for the firewall rules"
  type        = list(string)
  default     = []
}

variable "target_tags" {
  description = "Target tags for the firewall rules"
  type        = list(string)
  default     = []
}

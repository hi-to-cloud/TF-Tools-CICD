variable "common_tags" {
  type = map(any)
  default = {
    Project     = "expense",
    Environment = "dev",
    Terraform   = "true",
    Component = "Jenkins-Node"
  }
}

variable "zone_name" {
  type        = string
  default     = "step-into-iot.cloud"
}
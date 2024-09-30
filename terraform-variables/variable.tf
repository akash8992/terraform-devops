variable "filename" {
	default = "/home/ubuntu/terraform-devops/terraform-variables/devops_test.txt"
}

variable "content" {
	default = "this is the auto generated from a variable"
}

variable "devops-op-trainer" {}

variable "content_map" {
type =  map
default = {
"content1" = " this is a cool content1"
"content2" = "this is cooler content2"
}

}

variable "file_list" {
type = list 
default = ["/home/ubuntu/terraform-devops/terraform-variables/file_1.txt", "/home/ubuntu/terraform-devops/terraform-variables/file_2.txt"]
}




resource "local_file" "devops" {
  filename = var.file_list[0]
  content = var.content_map ["content1"]
  
}

resource "local_file" "devops_var" {
	filename = var.fle_list[1]
	content = var.content_map ["content2"]

}


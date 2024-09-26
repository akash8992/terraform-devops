resource "local_file" "devops" {
        filename = "/Users/apple/Desktop/devops-study/terraform-devops/terraform-local/devops_automated.txt"
        content = "i want to become a devops enginner"
}


resource "random_string" "rand-str" { 
    length = 16 
    special = true 
    override_special = "!#$%&*()-_=+[]{}<>:?" 
}
output "random_string" {
value = random_string.rand-str[*].result

}
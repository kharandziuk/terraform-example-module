module "example" {
  source = "./modules/example"
  access_key = var.aws_access_key
  secret_key =  var.aws_secret_key
}

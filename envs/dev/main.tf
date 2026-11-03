module "hello" {
  source    = "../../modules/hello-app"
  namespace = "dev"
  port      = 8080
}
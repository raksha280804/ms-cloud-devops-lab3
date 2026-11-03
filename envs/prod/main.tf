module "hello" {
  source    = "../../modules/hello-app"
  namespace = "prod"
  port      = 8090
}
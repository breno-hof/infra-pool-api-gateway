module "apigateway_v2" {
  source = "github.com/breno-hof/module-api-gateway-rest-api//src?ref=0.0.2"

  aws_region                             = "us-east-1"
  apigateway_v2_name                     = "my-api-gateway"
  apigateway_v2_protocol_type            = "HTTP"
  apigateway_v2_authorizer_name          = "my-authorizer-name"
  apigateway_v2_route_selection_expression = "$request.body.action"
  apigateway_v2_stage_name               = "dev"
  openapi_file_path                      = "${path.module}/openapi.json"
  apigateway_v2_vpc_link_name            = "my-vpc-link"
  security_groups_ids                    = ["sg-0123456789abcdef0"]
  subnet_ids                             = ["subnet-0123456789abcdef0", "subnet-abcdef0123456789"]
  create_vpc_link                        = false

  use_jwt_authorizer = {
    audience = ["my-audience"]
    issuer   = "https://issuer.example.com"
  }
}
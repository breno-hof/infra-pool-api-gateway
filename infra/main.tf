module "apigateway_v2" {
	source					= "github.com/breno-hof/module-api-gateway-v2//src?ref=1.0.1"

	name					= "${local.name}-api-gateway-v2"
	openapi_file_path		= local.openapi_file_path

	cors_configuration		= {
		allow_headers		= ["content-type", "x-amz-date", "authorization", "x-api-key", "x-amz-security-token", "x-amz-user-agent"]
		allow_methods		= ["*"]
		allow_origins		= ["*"]
	}

	description				= "My awesome HTTP API Gateway"
	fail_on_warnings		= false

	authorizer = {
		authorizer_type		= "JWT"
		identity_sources	= ["$request.header.Authorization"]
		name				= "cognito"
		jwt_configuration	= {
			audience		= [""]
			issuer			= "https://${aws_cognito_user_pool.this.endpoint}"
		}
	}
	
	tags					= local.tags
}

resource "aws_cognito_user_pool" "this" {
	name					= "${local.name}-cognito-user-pool"

	tags					= local.tags
}

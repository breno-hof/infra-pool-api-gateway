module "apigateway_v2" {
	source					= "../../module-api-gateway-rest-api/src"

	name					= "${local.name}-api-gateway-v2"
	openapi_file_path		= local.openapi_file_path

	cors_configuration		= {
		allow_headers		= ["content-type", "x-amz-date", "authorization", "x-api-key", "x-amz-security-token", "x-amz-user-agent"]
		allow_methods		= ["*"]
		allow_origins		= ["*"]
	}

	description				= "My awesome HTTP API Gateway"
	fail_on_warnings		= false

	# authorizer = {
	# 	authorizer_type		= "JWT"
	# 	identity_sources	= ["$request.header.Authorization"]
	# 	name				= "cognito"
	# 	jwt_configuration	= {
	# 		audience		= ["d6a38afd-45d6-4874-d1aa-3c5c558aqcc2"]
	# 		issuer			= "https://${aws_cognito_user_pool.this.endpoint}"
	# 	}
	# }
	
	tags = local.tags
}

# resource "aws_cognito_user_pool" "this" {
#   name = "${local.name}-cognito-user-pool"

#   tags = local.tags
# }
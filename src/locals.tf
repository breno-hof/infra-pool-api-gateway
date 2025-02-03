locals {
	name				= "pool-monitoring"
	openapi_file_path	= "${path.module}/openapi.json"

	tags				= {
		Application		= local.name,
		GitHubRepo		= "pool-monitoring-api-gateway"
	}
}
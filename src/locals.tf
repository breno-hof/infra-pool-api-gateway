locals {
	name				= "pool-monitoring"
	openapi_file_path	= "${module.path}/openapi.json"

	tags				= {
		Application		= local.name,
		GitHubRepo		= "pool-monitoring-api-gateway"
	}
}
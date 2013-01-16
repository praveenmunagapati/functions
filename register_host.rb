require 'rest'
require 'uber_config'

@config = UberConfig.load(file: 'config_development.json')

rest = Rest::Client.new
rest.logger.level = Logger::DEBUG

project_id = @config[:iron][:project_id]
token = @config[:iron][:token]
# host name
host_name = @config[:iron][:host_name] || "routertest.irondns.info"
# which worker to run
code_name = @config[:iron][:code_name] || "sinatra"


response = rest.post(
# "http://localhost:8080/",
    "http://router.irondns.info/?project_id=#{project_id}&token=#{token}&code_name=#{code_name}",
	headers: {"Iron-Router"=>"register"},
	body: {"host"=>host_name, "code"=>code_name}
	)
puts "response body:"
puts response.body
puts "\n\n=======\n\n"

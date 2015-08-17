# PRIVATE CLASS: do not use directly
class teamcity::params {
  $agent_name              = $::hostname
  $agent_user              = 'teamcity'
  $agent_user_home         = undef
  $manage_agent_user_home  = false
  $agent_group             = 'teamcity'
  $manage_user             = false
  $manage_group            = false

  $server_url              = 'http://builder'
  $archive_name            = 'buildAgent.zip'
  $download_url            = "${server_url}/update/${archive_name}"
  $agent_dir               = '/opt/build-agent'

  $service_ensure          = 'running'
  $service_enable          = true
  $service_run_type        = 'service'
  $teamcity_agent_mem_opts = '-Xms512m -Xmx1024m -XX:+HeapDumpOnOutOfMemoryError -Dfile.encoding=UTF-8'
  $custom_properties       = {}
  $launcher_wrapper_conf   = {}
}

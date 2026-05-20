# PRIVATE CLASS: do not call directly
class teamcity::agent::config {
  $required_properties = {
    'serverUrl' => $::teamcity::server_url,
    'name'      => $::teamcity::agent_name,
  }

  # configure buildAgent.properties
  $merged_params = $required_properties + $::teamcity::custom_properties
  create_ini_settings(
    { '' => $merged_params },
    { 'path' => "${::teamcity::agent_dir}/conf/buildAgent.properties" }
  )

  # configure launcher/conf/wrapper.conf
  create_ini_settings(
    { '' => $::teamcity::launcher_wrapper_conf },
    { 'path' => "${::teamcity::agent_dir}/launcher/conf/wrapper.conf" }
  )

  file { '/etc/profile.d/teamcity.sh':
    owner   => 'root',
    group   => 'root',
    mode    => '0755',
    content => template("${module_name}/teamcity-profile.erb"),
  }
}

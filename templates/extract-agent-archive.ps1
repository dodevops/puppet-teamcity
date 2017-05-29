$shell = New-Object -COMObject Shell.Application;
$zipfile = $shell.NameSpace("<%= scope['::teamcity::temp_dir_win'] %>\<%= @archive_name %>");
foreach($item in $zipfile.Items()){$shell.NameSpace("<%= scope['::teamcity::agent_dir_win'] %>").CopyHere($item, "20")};


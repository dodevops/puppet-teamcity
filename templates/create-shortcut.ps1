$shell = New-Object -COMObject WScript.Shell;
$shortcut = $shell.CreateShortcut("<%= scope['::teamcity:shortcut_path'] %>");
$shortcut.TargetPath = "<%= scope['::teamcity:agent_dir_win'] %>\bin\agent.bat";
$shortcut.Arguments = "start";
$shortcut.Description = "Standalone TeamCity agent";
$shortcut.Save();


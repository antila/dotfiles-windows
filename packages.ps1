# Check to see if we are currently running "as Administrator"
if (!(Verify-Elevated)) {
   $newProcess = new-object System.Diagnostics.ProcessStartInfo "PowerShell";
   $newProcess.Arguments = $myInvocation.MyCommand.Definition;
   $newProcess.Verb = "runas";
   [System.Diagnostics.Process]::Start($newProcess);

   exit
}

# system and cli
choco install curl                --limit-output
choco install nuget.commandline   --limit-output
choco install webpi               --limit-output
choco install git.install         --limit-output -params '"/GitAndUnixToolsOnPath /NoShellIntegration"'
choco install nvm.portable        --limit-output

# browsers
choco install GoogleChrome        --limit-output
choco install Firefox             --limit-output

# Dev tools
choco install visualstudiocode    --limit-output
choco install winmerge            --limit-output
choco install putty               --limit-output
choco install virtualbox          --limit-output
choco install winscp              --limit-output
choco install cygwin              --limit-output
choco install cmder               --limit-output
choco install docker              --limit-output
choco install openvpn             --limit-output
choco install tightvnc            --limit-output

# Other stuff
choco install 7zip.install        --limit-output # One day I'll save up for that WinRAR licence
choco install libreoffice         --limit-output
choco install windirstat          --limit-output # Nice way to see where disk space went
choco install f.lux               --limit-output # Because I dont like bleeding from my eyes

# Media
choco install vlc                 --limit-output
choco install irfanview           --limit-output
choco install irfanviewplugins    --limit-output
choco install greenshot           --limit-output # Nice screenshot util
choco install audacity            --limit-output

# Social and communication
choco install rocketchat          --limit-output
choco install thunderbird         --limit-output
choco install skype               --limit-output
choco install slack               --limit-output

### Node Packages
Write-Host "Installing Node Packages..." -ForegroundColor "Yellow"
if (which npm) {
    npm update npm
    npm install -g gulp
    npm install -g mocha
    npm install -g node-inspector
    npm install -g yo
    npm install -g nodemon
}

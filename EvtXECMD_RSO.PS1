#variables
$url = "https://f001.backblazeb2.com/file/EricZimmermanTools/EvtxECmd.zip"
$output = "C:\SentinelOne\EvtxECmd.zip"
$filepath = "C:\SentinelOne\EvtxECmd\EvtxECmd.exe"

#download Zimmerman Tool Exe
Invoke-WebRequest -Uri $url -OutFile ( New-Item -Path $output -Force )

#unpack Zip File	
Expand-Archive -LiteralPath $output -DestinationPath "c:\SentinelOne"
	
#process all event logs using EvtxECmd and output to CSV and JSON
Start-Process -NoNewWindow -FilePath $filepath -ArgumentList "-d c:\Windows\System32\winevt\Logs\ --csv c:\SentinelOne --json c:\SentinelOne"

#send output JSON to DataSet in progress

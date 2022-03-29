$outputExtension = ".mp4"
$bitrate = 160
$channels = 2


foreach($inputFile in get-childitem -recurse -Filter *.flv)
{
	#echo $inputFile
	$outputFileName = [System.IO.Path]::GetFileNameWithoutExtension($inputFile.FullName) + $outputExtension; 
	$outputFileName = [System.IO.Path]::Combine($inputFile.DirectoryName, $outputFileName);
	echo $outputFileName
	$programFiles = ${env:ProgramFiles(x86)};
	if($programFiles -eq $null) { $programFiles = $env:ProgramFiles; }
	
	$processName = $programFiles + "\VideoLAN\VLC\vlc.exe"
	#echo $processName
	$processArgs = "-I dummy -vvv `"$($inputFile.FullName)`" --sout-avcodec-strict=-2 --sout=#transcode{vcodec=h264,acodec=mp4a,samplerate=44100}:standard{access=file,mux=mp4,dst=`"$outputFileName`"} vlc://quit"


	start-process $processName $processArgs -wait
}

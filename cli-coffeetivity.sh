command_exists () {
	type "$1" &> /dev/null ;
}

if [ ! test -r university-undertones.mp3 ] ; then
	if [ ! command_exists wget ] ; then
		if [ ! command_exists brew ] ; then
			echo Can\'t get the files without wget, and can\'t install without brew. Please install brew.
			exit 1
		else
			echo Installing wget to download coffeetivity.
			brew install wget
		fi
	fi
	wget --no-check-certificate https://www.coffitivity.com/sounds/full/mp3/university-undertones.mp3
fi

if [ ! command_exists mpv ] ; then
	if [ ! command_exists brew ] ; then
		echo Can\'t play the files without mpv, and can\'t install without brew. Please install brew.
		exit 1
	else
		echo Installing mpv to play coffeetivity.
		brew install mpv
	fi
fi

mpv --loop=inf --no-audio-display university-undertones.mp3

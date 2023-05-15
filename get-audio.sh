
set -x;

[[ ! $# -eq 1 ]] && echo "getaudio.sh: Need URL argument." && exit 1;

# get FFMPEG location
if [[ -z $FFMPEG ]] ; then

	if [[ -z $(which ffmpeg) ]] ; then
		echo "Install ffmeg using your favorite package installer."

		if [ ! -z $(which apt-get) ]; then 
			sudo $(which apt-get) install -y ffmpeg;
		elif [ ! -z $(which brew) ] ; then
		 	sudo $(which brew) install ffmpeg;
		elif [ ! -z $(which yum) ] ; then 
			sudo $(which yum) install ffmpeg;
		fi

	fi

	export FFMPEG=$(which ffmpeg);

fi

cd original_tracks;

M4A_AUDIO_FORMAT=$(yt-dlp --list-formats --ffmpeg-location "$FFMPEG" "$1" 	\
					| grep "audio only" 									\
					| grep "m4a" 											\
					| head -n 1 											\
					| awk '{print $1}');

yt-dlp -f $M4A_AUDIO_FORMAT  --ffmpeg-location "$FFMPEG" "$1";

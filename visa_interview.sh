#! /bin/bash


cd $HOME/Downloads

end_hour=22
end_minute=1
REFRESH_TIME=1


end_sigma_time=$((end_hour * 60 + end_minute))

current_hour=`date +%H`
current_minute=`date +M`

current_sigma_time=$((current_hour * 60 + current_minute))

WID=`xdotool search --name "Mozilla Firefox" | head -1` ; xdotool windowactivate $WID ; xdotool key F5; WID=`xdotool search --name "Mozilla Firefox" | head -1` ;xdotool windowactivate $WID ; xdotool key KP_Enter; sleep $REFRESH_TIME ;xdotool key Escape;xdotool key "ctrl+s" type "save"; xdotool key KP_Enter

NO_SESSION=`awk 'NR>133' *.html | tr ' ' '\n' | grep 'title="Giorno' | wc -l`
OCCOPIED_SESSION=`awk 'NR>133' *.html | tr ' ' '\n' | grep 'title="No' | wc -l`
OLD_NO_SESSION=$NO_SESSION
OLD_OCCOPIED_SESSION=$OCCOPIED_SESSION



while [  "$current_sigma_time" != "$end_sigma_time" ]; do

	if [ -f *.html ]; then
		rm -f *.html
	fi

	if [ -d *_files ]; then
		rm -rf *_files/
	fi  


	WID=`xdotool search --name "Mozilla Firefox" | head -1` ; xdotool windowactivate $WID ; xdotool key F5; WID=`xdotool search --name "Mozilla Firefox" | head -1` ;xdotool windowactivate $WID ; xdotool key KP_Enter; sleep $REFRESH_TIME ;xdotool key Escape;xdotool key "ctrl+s" type "save"; xdotool key KP_Enter
	NO_SESSION=`awk 'NR>133' *.html | tr ' ' '\n' | grep 'title="Giorno' | wc -l`
	OCCOPIED_SESSION=`awk 'NR>133' *.html | tr ' ' '\n' | grep 'title="No' | wc -l`

	if [ "${NO_SESSION}" != "${OLD_NO_SESSION}" ]; then
		 echo " HURRY HURRY HURRY HURRY HURRY HURRY HURRY HURRY HURRY HURRY HURRY"
	fi

	if [ "${OCCOPIED_SESSION}" != "${OLD_OCCOPIED_SESSION}" ]; then
		 echo " HURRY HURRY HURRY HURRY HURRY HURRY HURRY HURRY HURRY HURRY HURRY"
	fi

	OLD_NO_SESSION=$NO_SESSION
    OLD_OCCOPIED_SESSION=$OCCOPIED_SESSION
	current_hour=`date +%H`
    current_minute=`date +M`
	current_sigma_time=$((current_hour * 60 + current_minute))
	echo ".."
done









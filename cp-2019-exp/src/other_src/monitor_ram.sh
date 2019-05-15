#!/bin/bash

MEM_THRESHOLD=80.0	# %
MIN_USAGE=10.0		# %
SLEEP_TIME=5		# s.

# mem_monitor.sh:
# monitors at intervals of SLEEP_TIME the amount of RAM used, then the MEM_THRESHOLD
# is exceeded the process currently using the greatest amount of memory is killed off
# unless its memory usage is less than MIN_USAGE.

while true :
do
	sleep ${SLEEP_TIME}
	mem_data=`free -b | grep -E "^Mem"`

	total=`echo ${mem_data} | awk '{print $2}'`
	used=`echo ${mem_data} | awk '{print $3}'`
	buffers=`echo ${mem_data} | awk '{print $6}'` # now includes cache!
#	cache=`echo ${mem_data} | awk '{print $7}'`
	cache="0"

	perc_used=`echo ${used} ${buffers} ${cache} ${total} | \
			awk '{printf("%.2f", ($1 - $2 - $3) * 100 / $4)}'`

	if [ 1 -eq `echo "${MEM_THRESHOLD} <= ${perc_used}" | bc` ]; then
		proc_data=`ps -e -o pid,%mem,comm= | sort -n -k 2 | tail -n 1`
		proc_pid=`echo ${proc_data} | awk '{print $1}'`
		proc_prc=`echo ${proc_data} | awk '{print $2}'`
		proc_cmd=`echo ${proc_data} | awk '{print $3}'`
		if [ 1 -eq `echo "${MIN_USAGE} <= ${proc_prc}" | bc` ]; then
			echo -e "$0 killed '${proc_cmd}' (${proc_pid}) using ${proc_prc}% of memory"
			kill -9 ${proc_pid} >> /dev/null 2>&1
		fi
	fi
done

number_of_files=50
output_directory=/Volumes/SIPP-256

start_time=$(date +%s)

for i in $(seq 1 $number_of_files); do
  dd if=/dev/urandom of=$output_directory/music_file_$i.mp3 bs=1M count=$(( RANDOM % 35 + 10 )) oflag=sync status=none
done

end_time=$(date +%s)

# Prevent division by zero
time_taken=$(( end_time - start_time ))
if [ "$time_taken" -eq 0 ]; then
  time_taken=1
fi

echo "Write Speed KPI: $(( number_of_files * 25 / time_taken )) MB/s"

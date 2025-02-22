number_of_files=50
output_directory=/Volumes/SIPP-SILVER

start_time=$(date +%s)                                         

for file in $output_directory/music_file_*.mp3; do
  dd if="$file" of=/dev/null bs=1M status=none
done

end_time=$(date +%s)

echo "Read Speed KPI: $(( $number_of_files * 25 / (end_time - start_time) )) MB/s"

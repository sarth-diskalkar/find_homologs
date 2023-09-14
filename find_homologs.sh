#!/bin/bash

query_file="$1"
subject_file="$2"
output_file="$3"

# Run BLAST and filter for perfect matches, then count them
blastn -query "$query_file" -subject "$subject_file" -task blastn-short -outfmt '6 qseqid sseqid length nident' | awk '$3 == $4' > "$output_file"
num=$(wc -l < "$output_file")

# Print the number of perfect matches
echo "Number of perfect matches: $num"

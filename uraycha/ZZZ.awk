BEGIN {
    OFS = ",";        # Output field separator: comma
    count = 0
}

PASS == 1 {
    
    for (i = 1; i <= NF; i++) {
        target_words[$i] = 1;  # Mark the word as a target word
    }
}

# PASS 2: Process the data file (data.txt) to count word frequencies per paragraph
PASS == 2 {
    # Paragraphs are separated by blank lines
    if ($0 == "") {
        current_paragraph++;
    } 
    else {
        for (i = 1; i <= NF; i++) {
            if ($i in target_words) {
                paragraph_freq[current_paragraph][$i] += 1;
            } 
        }
    }
}

END {
    # Print the header row: column names
    for (i in target_words) {
        printf "%s,", i;
    }
    printf "\n"

    # Print frequency counts
    for (para in paragraph_freq) {
        for (i in target_words) {
            printf "%d%s", paragraph_freq[para][i], OFS;
        }
        print "";  # Move to the next line 
    }
}
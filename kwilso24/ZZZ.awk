PASS==1 {
    # handle config.txt
    # words, newline separated
    for (i = 1; i <= NF; i++) {
        words[$i]
    }
}

PASS==2 {
    # handle data.txt
    # for each paragraph, record the frequency of each word in words
    # paragraphs are separated by two newlines, so
    # if the line is empty, it's a new paragraph

    # freq is a 2d array, freq[paragraph][word] = frequency
    # initialize to 0

    if ($0 == "") {
        # new paragraph
        paragraph++
    } else {
        for (i = 1; i <= NF; i++) {
            freq[paragraph][$i]++
        }
    }


}

END {
    # print the words from config, comma separated
    for (i in words) {
        printf "%s%s", i, (i == length(words) ? "\n" : ",")
    }
    printf "\n"

    # print the frequency of each word in each paragraph, comma separated
    for (i in freq) {
        for (j in words) {
            # if 0, print a 0
            if (freq[i][j] == 0) {
                printf "0,"
            } else {
                printf "%d,", freq[i][j]
            }
        }
        printf "\n"
    }

}

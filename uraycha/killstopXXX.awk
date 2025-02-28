{
    split("is the in but can a the is in of to a that it for on with as this was at by an be from or are", stopwords, " ")
    for (i in stopwords) stopword_list[stopwords[i]] = 1

    # Process each word, filtering out stop words
    for (i = 1; i <= NF; i++) {
        if (!($i in stopword_list)) {
            printf "%s ", $i
        }
    }
    print ""
}

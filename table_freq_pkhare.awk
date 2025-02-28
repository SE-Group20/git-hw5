# table_freq_pkhare.awk
BEGIN {
  if (PASS == 1) {
    while (getline < ARGV[1]) {
      top_words[NR] = $1
    }
  } else if (PASS == 2) {
    for (i = 1; i <= length(top_words); i++) {
      printf "%s%s", top_words[i], (i == length(top_words) ? "" : ",")
    }
    printf "\n"
    while (getline < ARGV[2]) {
      split($0, words, " ")
      for (i = 1; i <= length(top_words); i++) {
        count = 0
        for (j = 1; j <= length(words); j++) {
          if (words[j] == top_words[i]) {
            count++
          }
        }
        printf "%d%s", count, (i == length(top_words) ? "" : ",")
      }
      printf "\n"
    }
  }
}

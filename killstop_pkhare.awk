# killstop_pkhare.awk
{
  stop_words = "is the in but can a of to that it for on with as this was at by an be from or are"
  split(stop_words, stop_array, " ")
  for (i = 1; i <= NF; i++) {
    word = $i
    found = 0
    for (j = 1; j <= length(stop_array); j++) {
      if (word == stop_array[j]) {
        found = 1
        break
      }
    }
    if (found == 0 && word != "") {
      printf "%s ", word
    }
  }
  printf "\n"
}

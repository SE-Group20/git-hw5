# Define variables
INPUT = data_pkhare.txt
CLEANED = cleaned_pkhare.txt
STOPPED = stop_pkhare.txt
TOKENS = tokens_pkhare.txt
FREQS = word_counts_pkhare.txt
TOP_WORDS = top_pkhare.txt
TABLE = table_pkhare.txt

# Run the full pipeline
all: $(TABLE)

# Step 1: Canonicalization (Kill punctuation, Lowercase, Remove Punctuation)
$(CLEANED): $(INPUT)
	sed 's/[^a-zA-Z ]//g' $< | tr 'A-Z' 'a-z' > $@

# Step 2: Remove stop words
# Stop words are (is|the|in|but|can|a|the|is|in|of|to|a|that|it|for|on|with|as|this|was|at|by|an|be|from|or|are)
$(STOPPED) : $(CLEANED)
	gawk -f killstop_pkhare.awk $< > $@

# Step 3: Report frequency of words
$(FREQS): $(STOPPED)
	cat $< | tr ' ' '\n' | sort | uniq -c | sort -nr > $@

# Step 4: Extract Top 10 most frequent words
$(TOP_WORDS): $(FREQS)
	gawk '$$2 && NR <=10 {print $$2}' $< > $@

# Step 5: Generate table of word frequencies per paragraph
$(TABLE): $(CLEANED) $(TOP_WORDS)
	gawk -f table_freq_pkhare.awk PASS=1 $(TOP_WORDS) PASS=2 $(CLEANED) > $@

# Cleanup
clean:
	rm -f $(CLEANED) $(TOKENS) $(FREQS) $(TOP_WORDS) $(TABLE)

step1:
	$(MAKE) clean $(CLEANED); head $(CLEANED)

step2:
	$(MAKE) clean $(STOPPED); head $(STOPPED)

step3:
	$(MAKE) clean $(TOP_WORDS); head $(TOP_WORDS)

step4:
	$(MAKE) clean $(TABLE); head $(TABLE) # | column -s, -t

GEM_BIN := $(HOME)/.local/share/gem/ruby/3.2.0/bin
ASCIIDOCTOR := $(GEM_BIN)/asciidoctor

ADOC_FLAGS := \
  -r asciidoctor-katex \
  -a stem=latexmath \
  -a source-highlighter=rouge \
  -a rouge-style=github \
  -a docinfo=shared

SOURCES := $(wildcard blog/*.adoc)
TARGETS := $(SOURCES:.adoc=.html)

.PHONY: all clean

all: $(TARGETS)

blog/%.html: blog/%.adoc blog/docinfo.html
	$(ASCIIDOCTOR) $(ADOC_FLAGS) $<

clean:
	rm -f $(TARGETS)

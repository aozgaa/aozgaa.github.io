# frozen_string_literal: true

source "https://rubygems.org"

ruby ">= 2.7"

# rouge must be 4+: rouge 3 ships different 'github' theme CSS, which is
# inlined into every post with a source block.
gem "asciidoctor", "~> 2.0"
gem "asciidoctor-katex", "~> 0.4"
gem "rouge", ">= 4"

# ruby 4.0 moved these out of the default gems; asciidoctor and execjs still
# require them without declaring the dependency.
gem "logger"

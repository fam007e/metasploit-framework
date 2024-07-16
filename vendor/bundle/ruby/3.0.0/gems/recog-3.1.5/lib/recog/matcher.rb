# frozen_string_literal: true

module Recog
  class Matcher
    attr_reader :fingerprints, :reporter, :multi_match

    # @param fingerprints Array of [Recog::Fingerprint] The list of fingerprints from the Recog DB to find possible matches.
    # @param reporter [Recog::MatchReporter] The reporting structure that holds the matches and fails
    # @param multi_match [Boolean] specifies whether or not to use multi-match (true) or not (false)
    def initialize(fingerprints, reporter, multi_match)
      @fingerprints = fingerprints
      @reporter = reporter
      @multi_match = multi_match
    end

    # @param banners_file [String] The source of banners to attempt to match against the Recog DB.
    def match_banners(banners_file)
      reporter.report do
        fd = $stdin
        file_source = false

        if banners_file && (banners_file != '-')
          fd = File.open(banners_file, 'rb')
          file_source = true
        end

        fd.each_line do |line|
          reporter.increment_line_count

          line = line.to_s.unpack('C*').pack('C*').strip.gsub(/\\[rn]/, '')
          found_extractions = false

          extraction_data = []
          fingerprints.each do |fp|
            extractions = fp.match(line)
            next unless extractions

            found_extractions = true
            extractions['data'] = line
            extraction_data << extractions
            break unless multi_match
          end

          if found_extractions
            reporter.match extraction_data
          else
            reporter.failure line
          end

          break if reporter.stop?
        end

        fd.close if file_source
      end
    end
  end
end

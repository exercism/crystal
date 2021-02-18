module Anagram
  extend self

  def find(subject, candidates)
    matches = Array(String).new
    candidates.each do |candidate|
      if !duplicates?(subject, candidate) && anagrams?(subject, candidate)
        matches << candidate
      end
    end
    matches
  end

  def anagrams?(subject, candidate)
    subject.downcase.chars.sort == candidate.downcase.chars.sort
  end

  def duplicates?(subject, candidate)
    subject.downcase == candidate.downcase
  end
end

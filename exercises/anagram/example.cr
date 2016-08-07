module Anagram
  extend self

  def find(subject, candidates)
    downcased_subject = subject.downcase
    sorted_subject_chars = downcased_subject.chars.sort
    matches = Hash(String, Array(String)).new
    matches[downcased_subject] = Array(String).new
    candidates.each do |candidate|
      downcased_candidate = candidate.downcase
      sorted_candidate_chars = downcased_candidate.chars.sort
      unless downcased_subject == downcased_candidate
        if sorted_subject_chars == sorted_candidate_chars
          matches[downcased_subject] << candidate
        end
      end
    end
    matches.values.flatten
  end
end

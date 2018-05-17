class Bob
  def self.response(string : String)
    case
    when self.silence?(string)
      "Fine. Be that way!"
    when self.forceful_question?(string)
      "Calm down, I know what I'm doing!"
    when self.shouting?(string)
      "Whoa, chill out!"
    when self.question?(string)
      "Sure."
    else
      "Whatever."
    end
  end

  :private

  def self.silence?(string : String)
    string.gsub(/\s+/, "").empty?
  end

  def self.forceful_question?(string : String)
    self.shouting?(string) && self.question?(string)
  end

  def self.shouting?(string : String)
    string == string.upcase && string =~ /[A-Z]/
  end

  def self.question?(string : String)
    string.rstrip[-1] == '?'
  end
end

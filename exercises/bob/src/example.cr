class Bob
  def self.hey(string : String)
    case
    when self.silence?(string)
      "Fine. Be that way!"
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

  def self.shouting?(string : String)
    string == string.upcase && string =~ /[A-Z]/
  end

  def self.question?(string : String)
    string[string.size - 1] == '?'
  end
end

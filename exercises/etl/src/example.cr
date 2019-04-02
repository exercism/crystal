module ETL
  extend self

  def transform(input : Hash(String, Array(String))) : Hash(String, Int32)
    input.reduce({} of String => Int32) do |acc, (key, values)|
      values.each do |i|
        acc[i.downcase] = key.to_i
      end
      acc
    end
  end
end

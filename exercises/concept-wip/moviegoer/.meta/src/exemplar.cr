class Moviegoer
  getter age, member

  def initialize(age, member = false)
    @age = age
    @member = member
  end

  def ticket_price
    age < 60 ? 15 : 10
  end

  def watch_scary_movie?
    age >= 18
  end

  def claim_free_popcorn!
    member ? "🍿" : "none"
  end
end

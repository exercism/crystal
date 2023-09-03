module TicketingReservation
  MINIMUM_TICKETS = 100

  def tickets_available : UInt32
    @tickets_available
  end

  def order_ticket? : Bool
    if tickets_available() >= MINIMUM_TICKETS
      @tickets_available -= 1
      return true
    end
    false
  end

  def order_message(name : String) : String
    amount = tickets_available()
    if order_ticket?()
      "#{name}, your purchase was successful, your ticket number is ##{amount}, and the game is played at the #{@stadium} stadium."
    else
      "#{name}, your purchase was unsuccessful, there are not enough tickets available."
    end
  end
end

class TicketSystem
  include TicketingReservation

  def initialize(@tickets_available : UInt32, @stadium : String); end
end

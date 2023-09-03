require "spec"
require "../src/*"

describe TicketSystem do
  describe "initialize" do
    it "Can create a new TicketSystem" do
      ticket_system = TicketSystem.new(200, "Bellebrook")
      ticket_system.@tickets_available.should eq 200
      ticket_system.@stadium.should eq "Bellebrook"
    end

    it "Can create another TicketSystem" do
      ticket_system = TicketSystem.new(100, "Redwood")
      ticket_system.@tickets_available.should eq 100
      ticket_system.@stadium.should eq "Redwood"
    end
  end

  describe "tickets_available" do
    it "Can return the number of tickets available" do
      {% if @top_level.has_constant? "TicketingReservation" %}
        {% if TicketingReservation.has_method? "tickets_available" %}
          ticket_system = TicketSystem.new(200, "Bellebrook")
          ticket_system.tickets_available.should eq 200
        {% else %}
          raise "TicketingReservation does not have a tickets_available method"
        {% end %}
      {% else %}
        raise "TicketingReservation does not exist"
      {% end %}
    end

    it "Can return the number of tickets available when only a few" do
      {% if @top_level.has_constant? "TicketingReservation" %}
        {% if TicketingReservation.has_method? "tickets_available" %}
          ticket_system = TicketSystem.new(10, "Bellebrook")
          ticket_system.tickets_available.should eq 10
        {% else %}
          raise "TicketingReservation does not have a tickets_available method"
        {% end %}
      {% else %}
        raise "TicketingReservation does not exist"
      {% end %}
    end
  end

  describe "order_ticket?" do
    it "Can order a ticket" do
      {% if @top_level.has_constant? "TicketingReservation" %}
        {% if TicketingReservation.has_method?("order_ticket?") && TicketingReservation.has_method?("tickets_available") %}
          ticket_system = TicketSystem.new(200, "Bellebrook")
          ticket_system.tickets_available.should eq 200
          ticket_system.order_ticket?.should eq true
          ticket_system.tickets_available.should eq 199
        {% else %}
          raise "TicketingReservation does not have a order_ticket? method"
        {% end %}
      {% else %}
        raise "TicketingReservation does not exist"
      {% end %}
    end

    it "can order when 100 tickets left" do
      {% if @top_level.has_constant? "TicketingReservation" %}
        {% if TicketingReservation.has_method?("order_ticket?") && TicketingReservation.has_method?("tickets_available") %}
          ticket_system = TicketSystem.new(100, "Bellebrook")
          ticket_system.tickets_available.should eq 100
          ticket_system.order_ticket?.should eq true
          ticket_system.tickets_available.should eq 99
        {% else %}
          raise "TicketingReservation does not have a order_ticket? method"
        {% end %}
      {% else %}
        raise "TicketingReservation does not exist"
      {% end %}
    end

    it "Cant order when 99 tickets left" do
      {% if @top_level.has_constant? "TicketingReservation" %}
        {% if TicketingReservation.has_method?("order_ticket?") && TicketingReservation.has_method?("tickets_available") %}
          ticket_system = TicketSystem.new(99, "Bellebrook")
          ticket_system.tickets_available.should eq 99
          ticket_system.order_ticket?.should eq false
          ticket_system.tickets_available.should eq 99
        {% else %}
          raise "TicketingReservation does not have a order_ticket? method"
        {% end %}
      {% else %}
        raise "TicketingReservation does not exist"
      {% end %}
    end

    it "Can't order a ticket when only a few" do
      {% if @top_level.has_constant? "TicketingReservation" %}
        {% if TicketingReservation.has_method?("order_ticket?") && TicketingReservation.has_method?("tickets_available") %}
          ticket_system = TicketSystem.new(10, "Bellebrook")
          ticket_system.tickets_available.should eq 10
          ticket_system.order_ticket?.should eq false
          ticket_system.tickets_available.should eq 10
        {% else %}
          raise "TicketingReservation does not have a order_ticket? method"
        {% end %}
      {% else %}
        raise "TicketingReservation does not exist"
      {% end %}
    end

    it "Can't order a ticket when none available" do
      {% if @top_level.has_constant? "TicketingReservation" %}
        {% if TicketingReservation.has_method?("order_ticket?") && TicketingReservation.has_method?("tickets_available") %}
          ticket_system = TicketSystem.new(0, "Bellebrook")
          ticket_system.tickets_available.should eq 0
          ticket_system.order_ticket?.should eq false
          ticket_system.tickets_available.should eq 0
        {% else %}
          raise "TicketingReservation does not have a order_ticket? method"
        {% end %}
      {% else %}
        raise "TicketingReservation does not exist"
      {% end %}
    end
  end

  describe "order_message" do
    it "Give message for succesfull purchase" do
      {% if @top_level.has_constant? "TicketingReservation" %}
        {% if TicketingReservation.has_method?("tickets_available") && TicketingReservation.has_method?("order_message") %}
          expected = "John, your purchase was successful, your ticket number is #100, and the game is played at the Bellebrook stadium."

          ticket_system = TicketSystem.new(100, "Bellebrook")
          ticket_system.tickets_available.should eq 100
          ticket_system.order_message("John").should eq expected
          ticket_system.tickets_available.should eq 99
        {% else %}
          raise "TicketingReservation does not have a order_message method"
        {% end %}
      {% else %}
        raise "TicketingReservation does not exist"
      {% end %}
    end

    it "Give message for unsuccesful purchase" do
      {% if @top_level.has_constant? "TicketingReservation" %}
        {% if TicketingReservation.has_method?("tickets_available") && TicketingReservation.has_method?("order_message") %}
          expected = "John, your purchase was unsuccessful, there are not enough tickets available."

          ticket_system = TicketSystem.new(10, "Bellebrook")
          ticket_system.tickets_available.should eq 10
          ticket_system.order_message("John").should eq expected
          ticket_system.tickets_available.should eq 10
        {% else %}
          raise "TicketingReservation does not have a order_message method"
        {% end %}
      {% else %}
        raise "TicketingReservation does not exist"
      {% end %}
    end

    it "Works when give different stadium and name" do
      {% if @top_level.has_constant? "TicketingReservation" %}
        {% if TicketingReservation.has_method?("tickets_available") && TicketingReservation.has_method?("order_message") %}
          expected = "Jane, your purchase was successful, your ticket number is #100, and the game is played at the Redwood stadium."

          ticket_system = TicketSystem.new(100, "Redwood")
          ticket_system.tickets_available.should eq 100
          ticket_system.order_message("Jane").should eq expected
          ticket_system.tickets_available.should eq 99
        {% else %}
          raise "TicketingReservation does not have a order_message method"
        {% end %}
      {% else %}
        raise "TicketingReservation does not exist"
      {% end %}
    end

    it "Can give different name for unsuccessful" do
      {% if @top_level.has_constant? "TicketingReservation" %}
        {% if TicketingReservation.has_method?("tickets_available") && TicketingReservation.has_method?("order_message") %}
          expected = "Jane, your purchase was unsuccessful, there are not enough tickets available."

          ticket_system = TicketSystem.new(5, "Redwood")
          ticket_system.tickets_available.should eq 5
          ticket_system.order_message("Jane").should eq expected
          ticket_system.tickets_available.should eq 5
        {% else %}
          raise "TicketingReservation does not have a order_message method"
        {% end %}
      {% else %}
        raise "TicketingReservation does not exist"
      {% end %}
    end
  end
end

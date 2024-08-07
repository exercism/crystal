require "spec"
require "../src/*"

describe PasswordLock do
  describe "initialize", tags: "task_id=1" do
    it "can take a digit password" do
      {% if PasswordLock.has_method? "initialize" %}
        pasword_lock = PasswordLock.new(1234)
        pasword_lock.@password.should eq 1234
      {% else %}
        raise "Error: wrong number of arguments for 'PasswordLock.new' (given 1, expected 0)"
      {% end %}
    end

    it "can take a string password" do
      {% if PasswordLock.has_method? "initialize" %}
        pasword_lock = PasswordLock.new("abc123")
        pasword_lock.@password.should eq "abc123"
      {% else %}
        raise "Error: wrong number of arguments for 'PasswordLock.new' (given 1, expected 0)"
      {% end %}
    end

    it "can take a fingerprint password" do
      {% if PasswordLock.has_method? "initialize" %}
        pasword_lock = PasswordLock.new(23231.422)
        pasword_lock.@password.should eq 23231.422
      {% else %}
        raise "Error: wrong number of arguments for 'PasswordLock.new' (given 1, expected 0)"
      {% end %}
    end
  end

  describe "encrypt", tags: "task_id=2" do
    it "can encrypt digits password" do
      {% if PasswordLock.has_method?("encrypt") && PasswordLock.has_method?("initialize") %}
        pasword_lock = PasswordLock.new(1234)
        pasword_lock.encrypt
        pasword_lock.@password.should eq 617
      {% else %}
        raise "Error: undefined method 'encrypt' for PasswordLock"
      {% end %}
    end

    it "can enccrypt string password" do
      {% if PasswordLock.has_method?("encrypt") && PasswordLock.has_method?("initialize") %}
        pasword_lock = PasswordLock.new("abc123")
        pasword_lock.encrypt
        pasword_lock.@password.should eq "321cba"
      {% else %}
        raise "Error: undefined method 'encrypt' for PasswordLock"
      {% end %}
    end

    it "can encrypt fingerprint password" do
      {% if PasswordLock.has_method?("encrypt") && PasswordLock.has_method?("initialize") %}
        pasword_lock = PasswordLock.new(23231.422)
        pasword_lock.encrypt
        pasword_lock.@password.should eq 92925.688
      {% else %}
        raise "Error: undefined method 'encrypt' for PasswordLock"
      {% end %}
    end

    it "can encrypt string password with spaces" do
      {% if PasswordLock.has_method?("encrypt") && PasswordLock.has_method?("initialize") %}
        pasword_lock = PasswordLock.new("abc 123")
        pasword_lock.encrypt
        pasword_lock.@password.should eq "321 cba"
      {% else %}
        raise "Error: undefined method 'encrypt' for PasswordLock"
      {% end %}
    end

    it "can encrypt string password whith single character" do
      {% if PasswordLock.has_method?("encrypt") && PasswordLock.has_method?("initialize") %}
        pasword_lock = PasswordLock.new("a")
        pasword_lock.encrypt
        pasword_lock.@password.should eq "a"
      {% else %}
        raise "Error: undefined method 'encrypt' for PasswordLock"
      {% end %}
    end

    it "can encrypt digit that is odd" do
      {% if PasswordLock.has_method?("encrypt") && PasswordLock.has_method?("initialize") %}
        pasword_lock = PasswordLock.new(12345)
        pasword_lock.encrypt
        pasword_lock.@password.should eq 6172
      {% else %}
        raise "Error: undefined method 'encrypt' for PasswordLock"
      {% end %}
    end
  end

  describe "unlock?", tags: "task_id=3" do
    it "can check if a digit password is correct" do
      {% if PasswordLock.has_method?("unlock?") && PasswordLock.has_method?("encrypt") && PasswordLock.has_method?("initialize") %}
        pasword_lock = PasswordLock.new(1234)
        pasword_lock.encrypt
        pasword_lock.unlock?(1234).should eq "Unlocked"
      {% else %}
        raise "Error: undefined method 'unlock?' for PasswordLock"
      {% end %}
    end

    it "can check if a digit password is incorrect" do
      {% if PasswordLock.has_method?("unlock?") && PasswordLock.has_method?("encrypt") && PasswordLock.has_method?("initialize") %}
        pasword_lock = PasswordLock.new(1234)
        pasword_lock.encrypt
        pasword_lock.unlock?(1235).should eq nil
      {% else %}
        raise "Error: undefined method 'unlock?' for PasswordLock"
      {% end %}
    end

    it "can check if a string password is correct" do
      {% if PasswordLock.has_method?("unlock?") && PasswordLock.has_method?("encrypt") && PasswordLock.has_method?("initialize") %}
        pasword_lock = PasswordLock.new("abc123")
        pasword_lock.encrypt
        pasword_lock.unlock?("abc123").should eq "Unlocked"
      {% else %}
        raise "Error: undefined method 'unlock?' for PasswordLock"
      {% end %}
    end

    it "can check if a string password is incorrect" do
      {% if PasswordLock.has_method?("unlock?") && PasswordLock.has_method?("encrypt") && PasswordLock.has_method?("initialize") %}
        pasword_lock = PasswordLock.new("abc123")
        pasword_lock.encrypt
        pasword_lock.unlock?("abc124").should eq nil
      {% else %}
        raise "Error: undefined method 'unlock?' for PasswordLock"
      {% end %}
    end

    it "can check if a fingerprint password is correct" do
      {% if PasswordLock.has_method?("unlock?") && PasswordLock.has_method?("encrypt") && PasswordLock.has_method?("initialize") %}
        pasword_lock = PasswordLock.new(23231.422)
        pasword_lock.encrypt
        pasword_lock.unlock?(23231.422).should eq "Unlocked"
      {% else %}
        raise "Error: undefined method 'unlock?' for PasswordLock"
      {% end %}
    end

    it "can check if a fingerprint password is incorrect" do
      {% if PasswordLock.has_method?("unlock?") && PasswordLock.has_method?("encrypt") && PasswordLock.has_method?("initialize") %}
        pasword_lock = PasswordLock.new(23231.422)
        pasword_lock.encrypt
        pasword_lock.unlock?(23231.423).should eq nil
      {% else %}
        raise "Error: undefined method 'unlock?' for PasswordLock"
      {% end %}
    end
  end
end

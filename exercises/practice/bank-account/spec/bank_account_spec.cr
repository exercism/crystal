require "spec"
require "../src/*"

describe "BankAccount" do
  it "Newly opened account has zero balance" do
    bank_account = BankAccount.new
    bank_account.open
    bank_account.balance.should eq 0
  end

  pending "Single deposit" do
    bank_account = BankAccount.new
    bank_account.open
    bank_account.deposit(100)
    bank_account.balance.should eq 100
  end

  pending "Multiple deposits" do
    bank_account = BankAccount.new
    bank_account.open
    bank_account.deposit(100)
    bank_account.deposit(50)
    bank_account.balance.should eq 150
  end

  pending "Withdraw once" do
    bank_account = BankAccount.new
    bank_account.open
    bank_account.deposit(100)
    bank_account.withdraw(75)
    bank_account.balance.should eq 25
  end

  pending "Withdraw twice" do
    bank_account = BankAccount.new
    bank_account.open
    bank_account.deposit(100)
    bank_account.withdraw(80)
    bank_account.withdraw(20)
    bank_account.balance.should eq 0
  end

  pending "Can do multiple operations sequentially" do
    bank_account = BankAccount.new
    bank_account.open
    bank_account.deposit(100)
    bank_account.deposit(110)
    bank_account.withdraw(200)
    bank_account.deposit(60)
    bank_account.withdraw(50)
    bank_account.balance.should eq 20
  end

  pending "Cannot check balance of closed account" do
    bank_account = BankAccount.new
    bank_account.open
    bank_account.close

    expect_raises(ArgumentError) do
      bank_account.balance
    end
  end

  pending "Cannot deposit into closed account" do
    bank_account = BankAccount.new
    bank_account.open
    bank_account.close

    expect_raises(ArgumentError) do
      bank_account.deposit(50)
    end
  end

  pending "Cannot deposit into unopened account" do
    bank_account = BankAccount.new

    expect_raises(ArgumentError) do
      bank_account.deposit(50)
    end
  end

  pending "Cannot withdraw from closed account" do
    bank_account = BankAccount.new
    bank_account.open
    bank_account.close

    expect_raises(ArgumentError) do
      bank_account.withdraw(50)
    end
  end

  pending "Cannot close an account that was not opened" do
    bank_account = BankAccount.new

    expect_raises(ArgumentError) do
      bank_account.close
    end
  end

  pending "Cannot open an already opened account" do
    bank_account = BankAccount.new
    bank_account.open

    expect_raises(ArgumentError) do
      bank_account.open
    end
  end

  pending "Reopened account does not retain balance" do
    bank_account = BankAccount.new
    bank_account.open
    bank_account.deposit(50)
    bank_account.close
    bank_account.open
    bank_account.balance.should eq 0
  end

  pending "Cannot withdraw more than deposited" do
    bank_account = BankAccount.new
    bank_account.open
    bank_account.deposit(25)

    expect_raises(ArgumentError) do
      bank_account.withdraw(50)
    end
  end

  pending "Cannot withdraw negative" do
    bank_account = BankAccount.new
    bank_account.open
    bank_account.deposit(100)

    expect_raises(ArgumentError) do
      bank_account.withdraw(-50)
    end
  end

  pending "Cannot deposit negative" do
    bank_account = BankAccount.new
    bank_account.open

    expect_raises(ArgumentError) do
      bank_account.deposit(-50)
    end
  end
end

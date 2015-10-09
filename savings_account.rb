module Bank

require 'csv'

  class SavingsAccount < Account

    # @@min_balance = 10

    def initialize(account_id, balance, datetime_open, owner = nil)
      super
      @min_balance = 10
      @withdrawal_fee = 2
    end
  end
end

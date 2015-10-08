module Bank
  class MoneyMarketAccount < Account
    attr_reader :used_checks

    @@min_balance = 1000000

    def initialize(ident, open_date, balance)
      super
      @transaction_count = 0
    end

    


  end
end

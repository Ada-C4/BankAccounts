module Bank
  # this will inherit behavior from Account class
  class CheckingAccount < Account

    def withdrawl # add withdrawl functionality
      super
      # Each withdrawl -$1 from balance
      # RETURNS updated balance
      # Can't go negative.
# Will output warning and un-modified balance
    end

    def withdrawl_using_check(amount)
      # Input is taken out of balance
      # Returns updated account balance
      # Can overdraft up to $10, but not lower
      # Can use 3 checks for free.
      # Any more has a $2 fee.
    end

    def reset_checks
      # Reserts the number of checks used to zero
    end
  end
end

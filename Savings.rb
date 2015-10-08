module Bank
  # inherit behavior from Account class
  class SavingsAccount < Account
  # initial balance can't be < $10
    # if it is, raise ArgumentError


  # Update withdrawl functionality
    def withdrawl
      super # accesses current functionality
      # Each transaction -$2 from balance
      # Can't go below the $10 min.
# Will output a warning if they try
# and output un-modified balance
    end

    def add_interest(rate)
      # Calculate interest on the balance
  # balance * rate/100
      # Add that to the balance
      # RETURN the interest
    end
  end
end

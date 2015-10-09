module Bank

require 'csv'

  def initiate(account_id, balance, datetime_open, owner = nil)
    super
    #max of 6 transactions (deposit or withdrawal)
    #initial balance !< $10000 - will raise ArgumentError
    @min_balance = 10000

  end

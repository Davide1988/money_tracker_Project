class Transaction


  attr_reader :id
  attr_accessor :transaction_date, :amount, :merchant_id, :transaction_id

  def initialize(options)
    @id = options['id'].to_i if options['id']
    @transaction_date = options['transaction_date'].to_i
    @amount = options['amount'].to_i
    @merchant_id = options['merchant_id'].to_i
    @transaction_id = options['transaction_id'].to_i
  end




end

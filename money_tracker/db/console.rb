require('pg')
require('pry')
require_relative('../models/merchant')
require_relative('../models/tag')
require_relative('../models/transaction')


merchant1 = Merchant.new({'name' => 'Tesco'})
merchant1.save


tag1 = Tag.new({'type' => 'Groceries'})


transaction1 = Transaction.new ({'transaction_date' => '11122018', 'amount' => 30, 'merchant_id' => 1, 'transaction_id' => 2})

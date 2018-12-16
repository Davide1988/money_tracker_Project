require('pg')
require('pry')
require_relative('../models/merchant')
require_relative('../models/tag')
require_relative('../models/transaction')
require_relative('../models/budget')

Transaction.delete_all
Merchant.delete_all
Tag.delete_all
Budget.delete_all

merchant1 = Merchant.new({'name' => 'Tesco'})
merchant1.save
merchant2 = Merchant.new({'name' => 'Boots'})
merchant2.save

tag1 = Tag.new({'type' => 'Groceries'})
tag1.save
tag2 = Tag.new({'type' => 'Medicine'})
tag2.save


transaction1 = Transaction.new ({'transaction_date' => 20181103, 'amount' => 30.57, 'merchant_id' => merchant1.id, 'tag_id' => tag1.id})
transaction1.save

transaction2 = Transaction.new ({'transaction_date' => 20171203, 'amount' => 20.53, 'merchant_id' => merchant2.id, 'tag_id' => tag2.id})
transaction2.save


budget1 = Budget.new({'budget_amount' => 300.00})
budget1.save

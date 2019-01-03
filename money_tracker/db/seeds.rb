require('pg')
require('pry')
require_relative('../models/merchant')
require_relative('../models/tag')
require_relative('../models/transaction')
require_relative('../models/budget')

Transaction.delete_all
Budget.delete_all
Merchant.delete_all
Tag.delete_all

merchant1 = Merchant.new({'name' => 'Tesco'})
merchant1.save
merchant2 = Merchant.new({'name' => 'Boots'})
merchant2.save
merchant3 = Merchant.new({'name' => 'Sainsburys'})
merchant3.save
merchant4 = Merchant.new({'name' => 'The Dome'})
merchant4.save
merchant5 = Merchant.new({'name' => 'Nike'})
merchant5.save
merchant6 = Merchant.new({'name' => 'EDF'})
merchant6.save

tag1 = Tag.new({'type' => 'Groceries'})
tag1.save
tag2 = Tag.new({'type' => 'Medicine'})
tag2.save
tag3 = Tag.new({'type' => 'Booze'})
tag3.save
tag4 = Tag.new({'type' => 'Bills'})
tag4.save
tag5 = Tag.new({'type' => 'Clothes'})
tag5.save


transaction1 = Transaction.new ({'transaction_date' => 20181103, 'amount' => 30.57, 'merchant_id' => merchant1.id, 'tag_id' => tag1.id})
transaction1.save

transaction2 = Transaction.new ({'transaction_date' => 20171203, 'amount' => 20.53, 'merchant_id' => merchant2.id, 'tag_id' => tag2.id})
transaction2.save


budget1 = Budget.new({'budget_amount' => 30.00, 'tag_id' => tag1.id })
budget1.save
budget2 = Budget.new({'budget_amount' => 100.00, 'tag_id' => tag5.id })
budget2.save


p budget1.tag.type
p budget2.tag.type

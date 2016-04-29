class Account < ActiveRecord::Base

  groupify :named_group_member

  has_many :transactions

  def self.import(file, account_id)
    require 'date'

    mcount = 0
    count = 0

    File.foreach(file.path).with_index do |line, index|
      if(line.match("OFXHEADER:100"))
	@type = "OFX"
	ofx = OfxParser::OfxParser.parse(open(file.path))
	ofx.bank_account.statement.transactions.each do |fxtrans|
	  @transaction = Transaction.where(
	    action: fxtrans.type,
	    price: fxtrans.amount,
	    date: fxtrans.date
	  ).take || Transaction.new
	  if(@transaction.action)
	    mcount += 1
	  end
	  if(a = Alias.where(payee: fxtrans.payee, memo: fxtrans.memo).take)
	    if(a.vendor_id)
	      @transaction.vendor_id = a.vendor_id
	    end
	  else
	    Alias.new(payee: fxtrans.payee, memo: fxtrans.memo).save
	  end
	  @transaction.memo = fxtrans.memo
	  @transaction.payee = fxtrans.payee
	  @transaction.action = fxtrans.type
	  @transaction.price = fxtrans.amount
	  @transaction.date = fxtrans.date
	  @transaction.account_id = account_id 
	  @transaction.save
	  count += 1
	end
	return "Imported #{count} transactions from #{@type}. #{count - mcount} were new and #{mcount} matched existing transactions"
      elsif(line.match("Date,Action,Security,Price,Quantity,Amount,Text,Memo,Commission,"))
	@type = "Capital One Investing CSV"
	next
      end

      if(line.match("^#"))
	next
      end

      if(@type.match("Capital One Investing CSV"))

	array = line.split(',')

	if(array[2])
	  vendor = Vendor.find_by(symbol: array[2]) || Vendor.new(symbol: array[2])
	  vendor.save
	end

	if(array[1].match(/Buy|Sell/)) 
	  @transaction = Transaction.where(
	    date: Date.strptime(array[0], '%m/%d/%Y'),
	    action: array[1],
	    price: array[3],
	    quantity: array[4],
	    memo: array[7],
	    commission: array[8],
	    vendor_id: vendor.id
	  ).take || Transaction.new
	  if(@transaction.action) 
	    mcount += 1
	  end
	  @transaction.vendor_id = vendor.id
	  @transaction.price = array[3]
	  @transaction.quantity = array[4]
	  @transaction.memo = array[7]
	  @transaction.commission = array[8]
	elsif(array[1].match(/Div/))
	  @transaction = Transaction.where(
	    date: Date.strptime(array[0], '%m/%d/%Y'),
	    action: array[1],
	    price: array[5],
	    memo: array[7],
	    vendor_id: vendor.id
	  ).take || Transaction.new
	  if(@transaction.action) 
	    mcount += 1
	  end
	  @transaction.vendor_id = vendor.id
	  @transaction.price = array[5]
	  @transaction.memo = array[7]
	elsif(array[1].match(/ReinvDiv/))
	  @transaction = Transaction.where(
	    date: Date.strptime(array[0], '%m/%d/%Y'),
	    action: array[1],
	    price: array[3],
	    quantity: array[4],
	    memo: array[7],
	    vendor_id: vendor.id
	  ).take || Transaction.new
	  if(@transaction.action) 
	    mcount += 1
	  end
	  @transaction.vendor_id = vendor.id
	  @transaction.price = array[3]
	  @transaction.quantity = array[4]
	  @transaction.memo = array[7]
	elsif(array[1].match(/MargInt/))
	  @transaction = Transaction.where(
	    date: Date.strptime(array[0], '%m/%d/%Y'),
	    action: array[1],
	    price: array[5]
	  ).take || Transaction.new
	  if(@transaction.action) 
	    mcount += 1
	  end
	  @transaction.price = array[5]
	elsif(array[1].match(/CREDIT|DEBIT/))
	  @transaction = Transaction.where(
	    date: Date.strptime(array[0], '%m/%d/%Y'),
	    action: array[1],
	    memo: array[2],
	    price: array[5]
	  ).take || Transaction.new
	  if(@transaction.action) 
	    mcount += 1
	  end
	  @transaction.memo = array[2]
	  @transaction.price = array[5]
	else
	  redirect root_url, notice: "Parse Error"
	end
	@transaction.date = Date.strptime(array[0], '%m/%d/%Y') 
	@transaction.action = array[1]
	@transaction.account_id = account_id 

	if(transfer = Transaction.where("date = ? AND price = ? AND memo LIKE '%?' AND transfer_id = ?", @transaction.date, -@transaction.price, @transaction.account.four, nil).take)
	  @transaction.transfer_id = transfer.id
	  transfer.transfer_id = @transaction.id
	  transfer.save
	end

	@transaction.save
	count += 1
      end
    end

    return "Imported #{count} transactions from #{@type}. #{count - mcount} were new and #{mcount} matched existing transactions"

  end
end

class CheckingAccount < Account
end

class SavingsAccount < Account
end

class StockAccount < Account
end

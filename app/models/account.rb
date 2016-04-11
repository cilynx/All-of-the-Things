class Account < ActiveRecord::Base
  has_many :transactions

  def self.import(file, account_id)
    require 'date'

    File.foreach(file.path).with_index do |line, index|
      if(line.match("Date,Action,Security,Price,Quantity,Amount,Text,Memo,Commission,"))
	@type = "Capital One Investing CSV"
	next
      end

      if(line.match("^#"))
	next
      end

      array = line.split(',')

      if(array[2])
	vendor = Vendor.find_by(symbol: array[2]) || Vendor.new(symbol: array[2])
	vendor.save
      end

      if(@type.match("Capital One 360 CSV"))

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
	  @transaction.price = array[5]
	elsif(array[1].match(/CREDIT|DEBIT/))
	  @transaction = Transaction.where(
	    date: Date.strptime(array[0], '%m/%d/%Y'),
	    action: array[1],
	    memo: array[2],
	    price: array[5]
	  ).take || Transaction.new
	  @transaction.memo = array[2]
	  @transaction.price = array[5]
	else
	  redirect root_url, notice: "Parse Error"
	end
	@transaction.date = Date.strptime(array[0], '%m/%d/%Y') 
	@transaction.action = array[1]
	@transaction.account_id = account_id 
	@transaction.save
      end
    end

    return @type

  end
end

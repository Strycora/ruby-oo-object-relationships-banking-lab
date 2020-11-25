class Transfer
  attr_accessor :sender, :receiver, :amount
  attr_reader :status

  def initialize(sender, receiver, amount = 50)
    @sender = sender
    @receiver = receiver
    @status = "pending"
    @amount = amount
  end

  def valid?
    if sender.valid? == true && receiver.valid? == true
      true
    else
      false
    end
  end

  def execute_transaction
    if sender.valid? && receiver.valid? && sender.balance >= self.amount && status == "pending"
      sender.balance -= amount
      receiver.balance += amount
      @status = "complete"
    else
      @status = "rejected"
      "Transaction rejected. Please check your account balance."
    end
  end

  def reverse_transfer
    if @status == "complete"
      sender.balance += self.amount
      receiver.balance -= self.amount
      @status = "reversed"
    end

  end

end

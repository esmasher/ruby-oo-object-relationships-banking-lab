require "pry"
class Transfer

  attr_reader :sender, :receiver, :amount
  attr_accessor :status

  def initialize (sender, receiver, amount)
    @sender = sender
    @receiver = receiver
    @amount = amount
    @status = "pending"
  end

 def valid?
  self.sender.balance >= self.amount
  self.receiver.balance >= self.amount
  self.sender.valid? && self.receiver.valid?
 end

def execute_transaction

  if self.status == "pending" && self.sender.valid? && self.receiver.valid? && self.valid?
binding.pry
    @receiver.balance += @amount
    @sender.balance -= @amount

    self.status = "complete"
  else
    self.status = "rejected"
    "Transaction rejected. Please check your account balance."

  end
end

end

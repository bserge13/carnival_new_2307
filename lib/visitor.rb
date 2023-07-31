class Visitor
  attr_reader :name,
              :height,
              :spending_money,
              :preferences

  def initialize(name, height, spending_money)
    @name = name
    @height = height 
    @spending_money = spending_money.delete!("$").to_i
    @preferences = []
  end

  def spend_money(amount)
    @spending_money -= amount  
  end

  def add_preference(ride_preference)
    @preferences << ride_preference
  end

  def tall_enough?(height_req)
    @height >= height_req
  end
end
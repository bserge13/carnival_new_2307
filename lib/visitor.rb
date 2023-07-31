class Visitor
  attr_reader :name,
              :height,
              :dollar_ammount,
              :preferences

  def initialize(name, height, dollar_ammount)
    @name = name
    @height = height 
    @dollar_ammount = dollar_ammount
    @preferences = []
  end

  def spending_money
    @dollar_ammount.delete! "$"
    @dollar_ammount.to_i
  end

  def add_preference(ride_preference)
    @preferences << ride_preference
  end

  def tall_enough?(height_req)
    @height >= height_req
  end
end
class Ride 
  attr_reader :name, 
              :min_height,
              :admission_fee,
              :excitement,
              :total_revenue,
              :rider_log

  def initialize(ride_data)
    @name = ride_data[:name]
    @min_height = ride_data[:min_height]
    @admission_fee = ride_data[:admission_fee]
    @excitement = ride_data[:excitement]
    @total_revenue = 0
    @rider_log = Hash.new(0)
  end

  def board_rider(visitor)
    if visitor.preferences.include?(@excitement) && visitor.tall_enough?(@min_height)
      @rider_log[visitor] +=1
      @total_revenue += @admission_fee 
      visitor.spend_money(@admission_fee)
    end 
  end
end
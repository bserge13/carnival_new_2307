class Carnival 
attr_reader :duration,
            :rides

  def initialize(duration)
    @duration = duration
    @rides = []
  end 

  def add_ride(ride)
    @rides << ride
  end

  def total_revenue 
    carn_revenue = []
    @rides.each do |ride|
      carn_revenue << ride.total_revenue
    end
    carn_revenue.sum
  end

  def most_popular_ride
    @rides.find do |ride|
      ride.rider_log.length >=3
    end
  end 
end
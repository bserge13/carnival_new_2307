require 'rspec'
require './lib/carnival'
require './lib/visitor'
require './lib/ride'

RSpec.describe Carnival do 
  it 'exists' do 
    carnival = Carnival.new(3)
    expect(carnival).to be_a(Carnival)
  end

  describe '#attributes' do 
    it 'has readable attributes' do 
      carnival = Carnival.new(3)

      expect(carnival.duration).to eq(3)
      expect(carnival.rides).to eq([])
    end
  end

  describe '#add_ride' do 
    it 'can add rides to a carnival' do 
      carnival = Carnival.new(3)
      ride1 = Ride.new({ name: 'Carousel', min_height: 24, admission_fee: 1, excitement: :gentle })

      carnival.add_ride(ride1)
      expect(carnival.rides).to eq([ride1])
    end
  end

  describe '#total_revenue' do 
    it 'returns the total revenue of all rides' do 
      carnival = Carnival.new(3)
      ride1 = Ride.new({ name: 'Carousel', min_height: 24, admission_fee: 1, excitement: :gentle })
      ride2 = Ride.new({ name: 'Ferris Wheel', min_height: 36, admission_fee: 5, excitement: :gentle })
      ride3 = Ride.new({ name: 'Roller Coaster', min_height: 36, admission_fee: 2, excitement: :thrilling })
      visitor1 = Visitor.new('Bruce', 54, '$10')
      visitor2 = Visitor.new('Tucker', 36, '$5')
      visitor3 = Visitor.new('Penny', 64, '$15')


      carnival.add_ride(ride1)
      carnival.add_ride(ride2)
      carnival.add_ride(ride3)

      visitor1.add_preference(:gentle)
      visitor2.add_preference(:gentle)
      visitor2.add_preference(:thrilling)
      visitor3.add_preference(:gentle)
      visitor3.add_preference(:thrilling)

      ride1.board_rider(visitor1)
      ride1.board_rider(visitor2)
      ride1.board_rider(visitor1)
      ride2.board_rider(visitor1)
      ride2.board_rider(visitor3)
      ride3.board_rider(visitor2)
      ride3.board_rider(visitor2)

      expect(ride1.total_revenue).to eq(3)
      expect(ride2.total_revenue).to eq(10)
      expect(ride3.total_revenue).to eq(4)

      expect(carnival.total_revenue).to eq(17)
    end
  end
end 

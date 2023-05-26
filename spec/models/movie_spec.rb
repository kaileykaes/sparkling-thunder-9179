require "rails_helper"

RSpec.describe Movie, type: :model do
  describe "relationships" do
    it {should belong_to :studio}
    it {should have_many :actors}
  end

  describe "methods" do 
    before(:each) do 
      @universal = Studio.create!(name: 'Universal Studios', location: 'Orlando')
      @when_bess_got_in_wrong = @universal.movies.create!(title: 'When Bess Got in Wrong', creation_year: '1914', genre: 'silent comedy')
      @lee = @when_bess_got_in_wrong.actors.create!(name: 'Lee Moran', age: 24)
      @bess = @when_bess_got_in_wrong.actors.create!(name: 'Bess Meredyth', age: 22)
    end

    it '#average_age' do 
      expect(@when_bess_got_in_wrong.average_age).to eq(23)
    end

    it '#sort_by_age' do 
      expect(@when_bess_got_in_wrong.sort_actors_by_age).to eq([@bess, @lee])
    end
  end
end

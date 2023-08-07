require 'rails_helper'
require 'vcr'

RSpec.describe DogService do
  context "get_dogs", :vcr do 
    it "returns all adoptable dogs" do
      response = DogService.get_dogs
      expect(response).to be_a Hash
    end
  end
end
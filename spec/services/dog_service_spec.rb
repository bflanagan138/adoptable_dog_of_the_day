require 'rails_helper'
require 'vcr'

RSpec.describe DogService do
  context "get_dogs", :vcr do 
    it "returns all adoptable dogs" do
      response = DogService.get_dogs
      expect(response).to be_a Hash
      expect(response.keys).to eq([:animals, :pagination])
      expect(response[:animals]).to be_a Array
      expect(response[:animals][0]).to be_a Hash
      # require 'pry'; binding.pry
      expect(response[:animals][0].keys).to eq([:id, :organization_id, :url, :type, :species, :breeds, :colors, :age, :gender, :size, :coat, :attributes, :environment, :tags, :name, :description, :organization_animal_id, :photos, :primary_photo_cropped, :videos, :status, :status_changed_at, :published_at, :distance, :contact, :_links])
    end
  end
end
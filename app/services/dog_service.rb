class DogService
  def self.get_dogs
    response = conn.get("animals?type=dog&status=adoptable")
    parse_json(response)
  end

  private
  def self.conn
    url = "https://api.petfinder.com/v2/"
    Faraday.new(url: url) do |faraday|
      faraday.headers["Authorization"] = "Bearer #{ENV['petfinder_bearer']}"
    end
  end

  def self.parse_json(response)
    JSON.parse(response.body, symbolize_names: :true)
  end
end
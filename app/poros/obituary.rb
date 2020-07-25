class Obituary
  attr_reader :name,:age
  def initialize(obituary_data)
    @name = obituary_data[:name]
    @age = obituary_data[:age]
  end
end

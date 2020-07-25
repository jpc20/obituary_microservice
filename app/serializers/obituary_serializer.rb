class ObituarySerializer
  def format_obituaries(obituaries)
    obituaries.map do |obituary|
      {
        "data": {
                  "type": "obituary",
                  "attributes": {
                                  'name': obituary.name,
                                  'age': obituary.age
                                }
                }
      }
    end.to_json
  end
end

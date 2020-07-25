class ObituarySerializer
  def format_obituaries(obituaries)
    obituaries.map do |obituary|
      {
        "data": {
                  "type": "obituary",
                  "attributes": {
                                  'headline': obituary.headline,
                                  'abstract': obituary.abstract,
                                  'web_url': obituary.web_url,
                                  'pub_date': obituary.pub_date,
                                  'word_count': obituary.word_count
                                }
                }
      }
    end.to_json
  end
end

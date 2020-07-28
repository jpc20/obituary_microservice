class Obituary
  attr_reader :headline,
              :abstract,
              :web_url,
              :pub_date,
              :word_count,
              :image

  def initialize(obituary_data)

    @headline = obituary_data[:headline]
    @abstract = obituary_data[:abstract]
    @web_url = obituary_data[:web_url]
    @pub_date = obituary_data[:pub_date]
    @word_count = obituary_data[:word_count]
    @image = sort_images(obituary_data[:image])
  end

  def sort_images(data)

    if data.empty?
      nil
    else
      data.select do |entry|
        entry[:legacy][:thumbnail] != nil
      end.first[:legacy][:thumbnail]
    end
  end
end

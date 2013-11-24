class CoverPagesController < ApplicationController
  def home
  	@all_causes = Cause.all
  end

  def display_carousel
  	JSON.parse(
	    '{
	        "caption": "Parents\' house from the air",
	        "id": 26,
	        "preview_url": "http://www.26fruits.co.uk/images/full-fruit/orange.jpg",
	        "url": "http://www.26fruits.co.uk/images/full-fruit/orange.jpg"
    }')
  end
end

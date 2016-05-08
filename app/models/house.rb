class House < ActiveRecord::Base
#  def zip
#    property = Rubillow::HomeValuation.search_results( { address: @house.address, citystatezip: @house.city + ' ' + @house.state } )
#    if property.success?
#      @house.zpid = property.zpid
#      @house.url = property.links[:homedetails]
#      @house.zip = property.address[:zipcode]
#    end
#  end
end

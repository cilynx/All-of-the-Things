class House < ActiveRecord::Base

  def zip
    if self[:address] && self[:city] && self[:state] && !self[:zip]
      property = Rubillow::HomeValuation.search_results( { address: self[:address], citystatezip: self[:city] + ' ' + self[:state] + ' ' + self[:zip].to_s } )
      if property.success?
        self[:zip] = property.address[:zipcode]
        self.save
      end
    end
    self[:zip]
  end

  def zpid
    if self[:address] && ((self[:city] && self[:state]) || self[:zip]) && !self[:zpid]
      property = Rubillow::HomeValuation.search_results( { address: self[:address], citystatezip: self[:city] + ' ' + self[:state] + ' ' + self[:zip].to_s } )
      if property.success?
        self[:zpid] = property.zpid
        self.save
      end
    end
    self[:zpid]
  end

  def url
    if self[:address] && ((self[:city] && self[:state]) || self[:zip]) && !self[:url]
      property = Rubillow::HomeValuation.search_results( { address: self[:address], citystatezip: self[:city] + ' ' + self[:state] + ' ' + self[:zip].to_s } )
      if property.success?
        self[:url] = property.links[:homedetails]
        self.save
      end
    end
    self[:url]
  end

end

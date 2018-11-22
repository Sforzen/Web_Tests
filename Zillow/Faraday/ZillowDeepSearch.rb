require 'faraday'
require 'nokogiri'

class ZProperty

    def initialize
        @conn = Faraday.new("http://www.zillow.com") { |b|
            b.adapter Faraday.default_adapter
        }
    end

    def search_property(id, address, citystate)
        resp = @conn.get do |req|
            req.url '/webservice/GetDeepSearchResults.htm'
            req.params['zws-id'] = "X1-ZWz1grh4b5zksr_29gz1"
            req.params['address'] = '13071 Rainbow St'
            req.params['citystatezip'] = "Garden Grove, CA"
        end
        return { 'address' => resp.xpath('//street').text, 'city' => resp.xpath('//city').text, 'state' => resp.xpath('//state').text }
    end

end

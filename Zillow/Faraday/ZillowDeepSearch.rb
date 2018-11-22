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
            req.params['zws-id'] = id
            req.params['address'] = address
            req.params['citystatezip'] = citystate
        end
        if resp.status.eql? 200
            respxml = Nokogiri::XML(resp.body)
            return { 'address' => respxml.xpath('//street').text, 'city' => respxml.xpath('//city').text, 'state' => respxml.xpath('//state').text }
        else
            return "fail"
        end
    end

end

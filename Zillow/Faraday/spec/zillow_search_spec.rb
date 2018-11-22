require_relative '../ZillowDeepSearch'

describe 'ZProperty' do
    let(:property) { ZProperty.new }
    it "verify property information of '13071 Rainbow St Garden Grove, CA' is the property in question" do
        id = "X1-ZWz1grh4b5zksr_29gz1"
        street = "13071 Rainbow St"
        citystate = "Garden Grove, CA"
        status = property.search_property("X1-ZWz1grh4b5zksr_29gz1", "13071 Rainbow St", "Garden Grove, CA")
        expect([status['city'], status['state']] * ', ').to eq(citystate.upcase)
        expect(status['address']).to eq(street)
    end
end

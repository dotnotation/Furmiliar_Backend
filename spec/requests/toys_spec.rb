require "rails_helper"

RSpec.describe "toys", :type => :request do
    describe "#toys" do
        it "returns all the toys" do
            toybox = ToyBox.create(name: "Some")
            toybox.toys.create(name: "Simple Name")
            toybox.toys.create(name: "Simple Name2")
            
            get "/toys"

            parsed_body = JSON.parse(response.body)
            expect(parsed_body.length).to eq(2)

        end
    end
end
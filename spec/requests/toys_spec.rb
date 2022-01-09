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

    describe "#create" do
        it "creates a new toy" do
            # test that database has nothing
            # create the data
            # send data to create method
            # test that database has a toy
            toy_name = "New Toy"

            expect(Toy.all.length).to eq(0)

            toybox = ToyBox.create(name: "New ToyBox")

            post "/toys", :params => { :toy => {name: toy_name, toy_box_id: toybox.id} }

            parsed_body = JSON.parse(response.body)
            
            expect(parsed_body["name"]).to eq(toy_name)
        end
    end
end
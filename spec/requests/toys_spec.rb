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
            expect(Toy.all.length).to eq(1)
        end
    end

    describe "#destroy" do
        it "removes the selected toy" do
            # check that Toy.all is 0
            # create a toybox
            # create a toy associated with that toybox
            # send the destroy request
            # check that Toy.all is 0

            expect(Toy.all.length).to eq(0)

            toybox = ToyBox.create(name: "Sample Box")

            toy_sample = Toy.create(name: "Sample Toy", toy_box_id: toybox.id)

            delete "/toys/#{toy_sample.id}", :params => {:toy => {name: toy_sample.name, toy_box_id: toybox.id} }

            expect(Toy.all.length).to eq(0)

        end
    end
end
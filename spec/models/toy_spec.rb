require 'rails_helper'

RSpec.describe 'Toy' do           
    describe '#name' do  
        context 'validations' do
            it 'is invalid without name' do   
                toy = Toy.new
                toy.validate

                expect(toy.errors[:name]).to include("can't be blank")
            end
        end
    end
end
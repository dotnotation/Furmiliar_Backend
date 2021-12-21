class Toy < ApplicationRecord
    belongs_to :toy_box

    validates :name, presence: true
end

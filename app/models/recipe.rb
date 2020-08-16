class Recipe < ApplicationRecord
    validates :name, presence: true
    validates :description, presence: true, length: {minimum: 5, maximum: 5000}
    belongs_to :chef
    validates :chef_id, presence: true
end
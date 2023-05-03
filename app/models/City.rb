class City < ActiveRecord::Base
    has_many :posts
    belongs_to :country
end
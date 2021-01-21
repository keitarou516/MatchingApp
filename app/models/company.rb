class Company < ApplicationRecord
	has_many :users
	has_many :sites
	has_many :excesses
end

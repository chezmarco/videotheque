class Record < ActiveRecord::Base
	validates :NOM, presence: true

	belongs_to :user
end

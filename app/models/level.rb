class Level < ActiveRecord::Base
  belongs_to :program
  has_many :questions
  has_many :videos
end

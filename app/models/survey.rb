class Survey < ActiveRecord::Base
  validates :title, presence: true
  # Remember to create a migration!
  has_many :questions
  belongs_to :user
  
end

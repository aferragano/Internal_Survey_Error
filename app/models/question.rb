class Question < ActiveRecord::Base
  # Remember to create a migration!
  has_many :options
  belongs_to :survey

  validates :question, presence: true
end

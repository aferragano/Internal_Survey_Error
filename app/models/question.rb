class Question < ActiveRecord::Base
  # Remember to create a migration!
  has_many :answers
  belongs_to :survey

  validates :question, presence: true
end

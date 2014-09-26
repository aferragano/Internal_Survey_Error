class Option < ActiveRecord::Base
  belongs_to :question
  has_many :responses

  validates :answer, presence: true  
end

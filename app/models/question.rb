class Question < ApplicationRecord
  belongs_to :exercice

  has_many :answers, dependent: :destroy
  
  accepts_nested_attributes_for :answers, allow_destroy: true
  
  ################## VALIDATIONS  ###############
  validates :name,  presence: true

end

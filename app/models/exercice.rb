class Exercice < ApplicationRecord
  
  ##########  SECTION RELATIONS  ########## 
  belongs_to  :user
  belongs_to :course


  #enum exercice_type: { single_choice: 0, multiple_choice: 1, long_answer: 2 }
  #def self.question_type_select
  #  question_types.keys.map { |k| [k.titleize, k] }
  #end
  
  ##########  SECTION BEFORE VALIDATIONS  ##########
  before_validation :strip_fields


  ########## SECTION VALIDATIONS  ########## 
  validates :title, :slug, presence: true, uniqueness: true, length: {minimum:30, maximum:200,
    mesage:"vous n'avez pas respecter les limites"}



  ##########  SECTION URL  ########## 
  extend FriendlyId
  friendly_id :title, use: :slugged
  
  def should_generate_new_friendly_id?
    title_changed?
  end



  ##########  SECTION BEFORE VALIDATIONS ########## 
  # supprimé les espaces du debut et la fin du title, puis les espaces doubles
  def strip_fields
    self.title = title.strip.gsub!(/\s+/, ' ').downcase
  end
  # supprimé les espaces doubles entre les mots
  ##########  SECTION BEFORE SAVE  ########## 
  before_save do  
    self.title = title.capitalize
  end

end

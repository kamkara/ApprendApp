class Course < ApplicationRecord
  ##########  SECTION RELATIONS  ########## 
  has_rich_text :content
  
  
  ##########  SECTION BEFORE VALIDATIONS  ##########
  before_validation :strip_fields


  ########## SECTION VALIDATIONS  ########## 
  validates :title, :content, presence: true
  validates :title, length: {minimum:30, maximum:200,
    mesage:"vous n'avez pas respecter les limites"}
  validates :content, length: {minimum:200, maximum:10000,
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

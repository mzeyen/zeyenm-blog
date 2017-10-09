class Article < ActiveRecord::Base
  
  belongs_to :user
  #Validate user input for title and description
  validates :title, presence: true, length: {minimum: 3, maximum: 50}
  validates :description, presence: true, length: {minimum: 10, maximum: 300}
  #Validate user is present for any article
  validates :user_id, presence: true

end
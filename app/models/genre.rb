class Genre < ActiveRecord::Base
  
  has_many :themes
end

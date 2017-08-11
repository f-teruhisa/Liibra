class Element < ActiveRecord::Base

  has_many :results
  belongs_to :genre
end

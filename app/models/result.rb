class Result < ActiveRecord::Base
  belongs_to :theme
  belongs_to :element
end

class Sector < ActiveRecord::Base
  # attr_accessible :title, :body
  belongs_to :digital_datum
end

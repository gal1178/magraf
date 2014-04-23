class Localisation < ActiveRecord::Base
  # attr_accessible :title, :body
  belongs_to :digital_datum
  belongs_to :patient
end

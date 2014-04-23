class GraphicDatum < ActiveRecord::Base
  attr_accessible :filename
  belongs_to :examination
end

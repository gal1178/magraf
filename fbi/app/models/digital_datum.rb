class DigitalDatum < ActiveRecord::Base
  attr_accessible :filename
  has_many :correlations
  has_many :currents
  has_many :globals
  has_many :integrals
  has_many :localisations
  has_many :sectors
  belongs_to :examination
end

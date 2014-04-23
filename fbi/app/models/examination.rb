class Examination < ActiveRecord::Base
  attr_accessible :patient, :number, :comment
  belongs_to :patient
  has_one :archive
  has_many :graphic_data
  has_many :digital_data
  has_many :graphic
end

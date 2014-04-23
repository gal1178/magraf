# -*- encoding : utf-8 -*-
class Patient < ActiveRecord::Base
  mount_uploader :archive, ArchiveUploader
  validates :cart_name, :uniqueness => true , :presence => true, :length => {:maximum => 100}
  has_many :examinations
  has_many :localisations
  def dir
    return "#{Rails.root}/public/uploads/patient/archive/#{cart_name}"
  end
  def file?
    check =  Dir.entries(dir)
    for i in 0...check.size
      if check[i].scan(".zip").size > 0
        return true
      end
    end
    return false
  end

  def dir?
    check =  Dir.entries("#{Rails.root}/public/uploads/patient/archive/")
    for i in 0...check.size
      if check[i].scan(cart_name).size > 0
        return true
      end
    end
    return false
  end

  def oname
    check =  Dir.entries(dir)
    for i in 0...check.size
      if check[i].scan(".zip").size > 0
        return Dir.entries(dir)[i]
      end
    end
  end
end

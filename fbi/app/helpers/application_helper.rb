# -*- encoding : utf-8 -*-
module ApplicationHelper
  def show_flash
    res=[]
    flash.each do |k,v|
      res<<content_tag(:div,v, :class => "flash_#{k}")
    end
    raw(res.join)
  end
  def menu_items
    [{name: "users", title: "Пользователи", admin:true},{name: "patients", title: "Пациенты"}]
  end
  def show_url(obj)
    tmp="http://"
    if obj[0..6]==tmp
      link_to obj, obj,:target => "_blank"
    else
      link_to obj, tmp << obj,:target => "_blank"
    end
  end
end

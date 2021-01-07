module SessionsHelper
  def show_flash(type, options = { class: "flash #{type.to_sym}" })
    content_tag :p, flash[type.to_sym], class: options[:class] if flash[type.to_sym]
  end
end

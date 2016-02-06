module ApplicationHelper
  def flash_content_helper
    unless flash.empty?
      flash.each do |key, value|
        if key == "error"
          return content_tag(:div, "error", class: ["flash-message flash-error"]).html_safe
        elsif key == "success"
          content_tag(:div, value.messages, class: ["flash-message flash-success"]).html_safe
        end
      end
    end
  end
end

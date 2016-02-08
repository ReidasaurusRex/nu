module ApplicationHelper
  def flash_content
    unless flash.empty?
      render 'flash/flash_messages', messages: flash
    end
  end
end

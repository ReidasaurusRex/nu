module FormsHelper
  def add_errors_if_any(object, section)
    if object.errors[section]
      return friendly_messages(object.errors[section])
    end
  end

  def friendly_messages(errors)
    flat_errors = errors.map{|error| error.downcase}
    return flat_errors.join(", ").capitalize
  end 
end
module SharingSettingsHelper
  def boolean_yes_or_no(bool)
    if bool
      return "yes"
    else
      return "no"
    end
  end
end

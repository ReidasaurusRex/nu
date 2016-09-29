module ChallengesHelper
  
  def friendly_challenge_length(length)
    time_array = [[3153600 ,"year"], [2592000, "month"], [604800, "week"], [86400, "day"], [3600, "hour"], [60, "minute"], [1, "second"]]
    time_array.each do |time| 
      if (length / time[0]) >= 1
        x_since = (length / time[0]).to_i
        response = "#{x_since} #{time[1]}"
        response << "s" if x_since > 1
        return response
      end
    end
  end

end

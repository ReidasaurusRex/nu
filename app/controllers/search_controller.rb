class SearchController < ApplicationController
  before_action :get_profile

  def results
    @query = params[:query]
    @results = get_results(params[:query])
  end

  private
  def get_profile
    @profile = User.find(session[:user_id]).profile
  end
  def get_results(query)
    results = {}
    results[:followers] = find_followers(query)
    results[:followings] = find_followings(query)
    results[:habits] = find_habits(query)
    # results[:challenges] = find_challenges(query)
    results[:profiles] = find_profiles(query).keep_if do |prof|
      !results[:followers].include?(prof) && !results[:followings].include?(prof)
    end
    binding.pry
    return results
  end

  def find_followers(query)
    followers = []
    @profile.followers.where(first_name: query).each{|follower| followers.push(follower)}
    @profile.followers.where(last_name: query).each{|follower| followers.push(follower)}
    query.split.each do |word|
      @profile.followers.where(first_name: word).each{|follower| followers.push(follower)}
      @profile.followers.where(last_name: word).each{|follower| followers.push(follower)}
    end
    return followers.uniq
  end

  def find_followings(query)
    followings = []
    @profile.followings.where(first_name: query).each{|following| followings.push(following)}
    @profile.followings.where(last_name: query).each{|following| followings.push(following)}
    query.split.each do |word|
      @profile.followings.where(first_name: word).each{|following| followings.push(following)}
      @profile.followings.where(last_name: word).each{|following| followings.push(following)}
    end
    return followings.uniq


  end

  def find_habits(query)
    results_habits = []
    habits = Habit.all
    habits.map{|habit| habit.title == query}.each{|habit| results_habits.push(habit)}
    habits.map{|habit| habit.caption.include?(query)}.each{|habit| results_habits.push(habit)}
    query.split.each do |word|
      habits.map{|habit| habit.title == word}.each{|habit| results_habits.push(habit)}
      habits.map{|habit| habit.caption.include?(word)}.each{|habit| results_habits.push(habit)}
    end
    return results_habits.uniq
  end

  # def find_challenges(query)
  #   results_challenges = []
  #   challenges = Challenges.all
  #   challenges.map{|habit| habit.title == query}.each{|habit| results_challenges.push(habit)}
  #   challenges.map{|habit| habit.caption.include?(query)}.each{|habit| results_challenges.push(habit)}
  #   query.split.each do |word|
  #     challenges.map{|habit| habit.title == word}.each{|habit| results_challenges.push(habit)}
  #     challenges.map{|habit| habit.caption.include?(word)}.each{|habit| results_challenges.push(habit)}
  #   end
  # end

  def find_profiles(query)
    profiles = []
    Profile.where(first_name: query).each{|prof| profiles.push(prof)}
    Profile.where(last_name: query).each{|prof| profiles.push(prof)}
    query.split.each do |word|
      Profile.where(first_name: word).each{|prof| profiles.push(prof)}
      Profile.where(last_name: word).each{|prof| profiles.push(prof)}
    end
    return profiles.uniq
  end
end

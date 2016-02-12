class SearchController < ApplicationController
  before_action :get_user

  def results
    @query = params[:query]
  end

  private
  def get_user
    @user = User.find(session[:user_id])
  end
  def get_results(query)
    results = {}
    results[:followers] = find_followers(query)
    results[:followings] = find_followings(query)
    results[:habits] = find_habits(query)
    results[:challenges] = find_challenges(query)
  end

  def find_followers(query)
    followers = []
    @user.followers.where(first_name: query).each{|follower| followers.push(follower)}
    @user.followers.where(last_name: query).each{|follower| followers.push(follower)}
    query.split.each do |word|
      @user.followers.where(first_name: word).each{|follower| followers.push(follower)}
      @user.followers.where(last_name: word).each{|follower| followers.push(follower)}
    end
    return followers.uniq
  end

  def find_followings(query)
    followings = []
    @user.followings.where(first_name: query).each{|following| followings.push(following)}
    @user.followings.where(last_name: query).each{|following| followings.push(following)}
    query.split.each do |word|
      @user.followings.where(first_name: word).each{|following| followings.push(following)}
      @user.followings.where(last_name: word).each{|following| followings.push(following)}
    end
    return followings.uniq


  end

  def find_habits(query)
    results_habits = []
    habits = Habit.all
    habits.map{|habit| habit.title == query}.each{|habit| results_habits.push(habit)}
  end

  def find_challenges(query)
    challenges = []
  end
end

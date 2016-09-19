class Profiles::SearchController < Inheritance::CompletedProfileController
  # TODO: add results from tags
  def results
    @query = params[:query]
    @results = get_results(params[:query])
  end

  private
  def get_results(query)
    results = {}
    results[:profiles] = find_profiles(query)
    results[:newsfeed_items] = find_newsfeed_items(query)
    results[:challenges] = find_challenges(query)
    return results
  end

  def find_profiles(query)
    return Profile.find_by_fuzzy_full_name(query, limit: 10)
  end

  def find_newsfeed_items(query)
    return NewsfeedItem.find_by_tag_name(query, 5)
  end

  def find_challenges(query)
    found_challenges = []
    Challenge.find_by_fuzzy_title(query, limit: 5).each{|fc| found_challenges.push(fc)}
    Challenge.find_by_fuzzy_progress_category(query, limit: 5).each{|fc| found_challenges.push(fc)}
    return found_challenges.uniq
  end
end

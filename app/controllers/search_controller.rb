class SearchController < ApplicationController
  def results
    @query = params[:query]
  end
end

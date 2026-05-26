class RecommendationsController < ApplicationController
  def index
    @recommendations = Message.recommendations
  end
end

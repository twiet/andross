class Api::MatchesController < ApplicationController

  def show
    @match = Match.find(params[:id])
  end

  def update
    @match = Match.find(params[:id])
    # @match.update_attributes
  end
end

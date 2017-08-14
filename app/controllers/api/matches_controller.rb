class Api::MatchesController < ApplicationController

  def show
    @match = Match.find(params[:id])
  end

end

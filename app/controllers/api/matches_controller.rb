class Api::MatchesController < ApplicationController

  #NOTE: renamed from singular

  def create
    @match = Match.new(match_params)

  end

  private

  def match_params
  params.require(:match)
    .permit(:player1_id, :player2_id, :station_number, :next_match_id)
end

end

class Api::TournamentGenerationsController < ApplicationController

  def update
    @tournament = Tournament.find(params[:id])
    @tournament.generate_matches
    @tournament.start_tournament
    @tournament.reload
    render "api/tournaments/show"
  end

end

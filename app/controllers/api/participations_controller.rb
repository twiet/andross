class Api::ParticipationsController < ApplicationController

  def create
    @participation = Paricipation.new(participation_params)

    if @participation.save
      render "api/tournaments/show"
    else
      render json: @participation.errors.full_messages, status: 422
    end
  end

  def destroy
    @participation = Participation.find(params[:id])
    @tournament = @participation.tournament
    @participation.destroy
    render "api/tournaments/show"
  end

  private

  def participation_params
    params.require(:participation).permit(:player_id, :tournament_id)
  end
end

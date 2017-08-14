class Api::TournamentsController < ApplicationController

  def index
    @tournaments = Tournament.all
  end

  def show
    @tournament = Tournament.find(params[:id])
  end

  def create
    @tournament = Tournament.new(tournament_params)

    if @tournament.save
      render "api/tournaments/show"
    else
      render json: @tournament.errors.full_messages, status: 422
    end
  end

  def update
    @tournament = Tournament.find(params[:id])
    if @tournament.update_attributes(tournament_params)
      render "api/tournaments/show"
    else
      render json: @tournament.errors.full_messages, status: 422
    end
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
    render "api/users/index", status: 200;
  end

  private

  def tournament_params
    params.require(:tournament).permit(
      :tournament_name, :location, :creator_id, :is_finished?, :is_published?, :date_start, :date_end, :registration_start, :registration_end, :registration_length, :has_started?, :champion_id
    )
  end

end

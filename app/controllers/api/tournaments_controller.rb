require_relative './tournament'
require 'json'
require 'byebug'

#NOTE: renamed from singular

class Api::TournamentsController < ApplicationController

  # def index
  #   render :json => test_tournament
  # end

  def names
    ["frank","adam","rose","kevin","kyle","john","george","paul"]
  end

  def create #takes array of player objects as parameter
    # 1. take array of players's length and round up to nearest power of 2
    # 2. append players list with 'byes' to ensure top seeds get initial byes
    # 2. create tournament with list of players
    # 3. create pairings and tree within tournament
    # 4. TODO: Discuss: add array column for matches and players? Or rely on active record?

    @tournament = Tournament.new(tournament_params)
    @tournament.fill
    @tournament.generate_matches(@tournament.players)

  end

  # def test_tournament
  #   players = (0...2**4).map { |i| Player.new(names[i]) }
  #   t1 = Tournament.new(players)
  #   idx = 0
  #   while !t1.complete?
  #     match = t1.matches[idx]
  #     if !match.finished? && match.ready?
  #       t1.advance_match(t1.matches[idx], match.p1.name)
  #     end
  #     idx += 1
  #     idx = idx % t1.matches.length
  #   end
  #   # print to console
  #   t1.display
  #   return pretty_json(t1)
  # end

  # annoying hacking prettify
  # def pretty_json(tournament)
  #   js = JSON.pretty_generate(tournament)
  #   obj = JSON.parse(js)
  #   return JSON.pretty_generate(obj)
  # end

  private

  def tournament_params
    params.require(:tournament).permit(
      :tournament_name, :location, :author_id, :is_finished?, :is_published?
    )
  end

end

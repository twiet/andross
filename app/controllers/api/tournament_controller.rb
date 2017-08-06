require_relative './tournament'
require 'json'
require 'byebug'

class Api::TournamentController < ApplicationController

  def index
    render :json => test_tournament
  end

  def test_tournament
    players = (0...2**4).map { |i| Player.new(i) }
    t1 = Tournament.new(players)
    idx = 0
    while !t1.complete?
      match = t1.matches[idx]
      if !match.finished? && match.ready?
        t1.advance_match(t1.matches[idx], match.p1.name)
      end
      idx += 1
      idx = idx % t1.matches.length
    end
    # print to console
    t1.display
    return pretty_json(t1)
  end

  # annoying hacking prettify
  def pretty_json(tournament)
    js = JSON.pretty_generate(tournament)
    obj = JSON.parse(js)
    return JSON.pretty_generate(obj)
  end

end

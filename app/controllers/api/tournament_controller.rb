require_relative './tournament'
require 'json'

class Api::TournamentController < ApplicationController

  def index
    test
    render :json => "hello world"
  end

  def test
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
    t1.display
  end

end

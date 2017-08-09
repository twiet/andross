# require 'json'
#
# class Tournament
#
#   attr_accessor :name, :height, :matches, :indices, :players
#
#   # assumes players.length is power of 2
#   # todo : handle cases where that's not true
#   def initialize(players)
#     @players = players
#     @height = Math.log2(players.length).round
#     @indices = construct_index(players.length)
#     @matches = construct_matches(players)
#   end
#
#   def construct_matches(players)
#     matches = []
#     idx = 0
#     # generate initial matches
#     while players.length > idx
#       matches.push(Match.new({:p1 => players[idx], :p2 => players[idx + 1]}))
#       idx += 2
#     end
#     idx = 0
#     # generate future pending matches
#     while matches.length < indices.last
#       newMatch = Match.new({:m1 => matches[idx], :m2 => matches[idx + 1]})
#       matches.push(newMatch)
#       idx += 2
#     end
#     return matches
#   end
#
#   def complete?
#     matches.all? { |m| m.finished? }
#   end
#
#   # generate indicies for rounds
#   def construct_index(playerLength)
#     indices = [] << 0
#     sum = 0
#     idx = 0
#     while (playerLength/(2**idx) > 1)
#       idx += 1
#       indices << sum += playerLength/(2**idx)
#     end
#     return indices
#   end
#
#   # advance match with winner
#   def advance_match(match, winner_name)
#     winner = find_player_by_name(winner_name).first
#     match.finish(winner)
#   end
#
#   def find_player_by_name(player_name)
#     players.select { |player| player.name == player_name }
#   end
#
#   def find_all_matches_by_level(level)
#     if level == 0
#       return matches[0...indices[0]]
#     elsif level <= height
#       return matches[indices[level - 1]...indices[level]]
#     else
#       p "level out of range"
#     end
#   end
#
#   def helper(root, space)
#     if root.nil?
#       return
#     end
#     space += 6
#     helper(root.m2, space)
#     puts "\n#{' ' * space}#{root}"
#     helper(root.m1, space)
#   end
#
#   # display tree to console
#   def display
#     return helper(matches.last, 0)
#   end
#
#   def to_json(*opt)
#     match_by_level = {}
#     (1..height).each { |lvl| match_by_level[lvl] = find_all_matches_by_level(lvl).map(&:to_json) }
#     return match_by_level.to_json
#   end
#
#   private :construct_index, :construct_matches
# end
#
# class Player
#   attr_accessor :name, :bye
#
#   def initialize(name)
#     @name = name
#   end
#
#   def to_s
#     return "#{name}"
#   end
#
# end
#
# class Match
#   attr_accessor :p1, :p2, :m1, :m2, :winner, :id, :next_match
#   attr_accessor :finished, :ready
#
#   def initialize(args)
#     @p1 = args[:p1]
#     @p2 = args[:p2]
#     @m1 = args[:m1]
#     @m2 = args[:m2]
#     #todo : verfiy match is correctly formated
#
#     if !m1.nil? && !m2.nil?
#       m1.next_match = m2.next_match = self
#     end
#   end
#
#   def finished?
#     return !winner.nil?
#   end
#
#   def ready?
#     return p1 && p2
#   end
#
#   # finish match with winner
#   def finish(winner)
#     # winner should be either p1 or p2
#     @winner = winner
#     if !next_match.nil?
#       next_match.add_player(winner)
#     end
#   end
#
#   # add player from previous match
#   def add_player(player)
#     if ready?
#       p "match full"
#     end
#     if p1.nil?
#       @p1 = player
#     elsif p2.nil?
#       @p2 = player
#     end
#   end
#
#   def to_json(*opt)
#     {
#       :next_match => next_match.to_s,
#       :m1 => m1.to_s,
#       :m2 => m2.to_s,
#       :p1 => p1.to_s,
#       :p2 => p2.to_s
#     }.to_json
#   end
#
#   def to_s
#     "#{p1.nil? ? -1 : p1} vs #{p2.nil? ? -1 : p2}"
#   end
# end
#
# def generate_future_matches(matches)
#   return matches if matches.length <= 1
#   new_matches = []
#   idx = 0
#   while idx < matches.length/2
#     new_matches << (matches[idx].to_s + matches[matches.length - idx - 1].to_s)
#     idx += 1
#   end
#   return matches += generate_future_matches(new_matches)
# end

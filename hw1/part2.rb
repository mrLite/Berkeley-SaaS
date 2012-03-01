class WrongNumberOfPlayersError < StandardError; end
class NoSuchStrategyError < StandardError; end

def rps_game_winner(game)
  moves = ["p", "r", "s"]
  
  raise WrongNumberOfPlayersError unless game.length == 2
  game.each do |g|
    raise NoSuchStrategyError unless moves.include? g[1].downcase
  end
  
  case game[0][1].downcase
  when "p"
    game[1][1].downcase == "s" ? (return game[1]) : (return game[0])
  when "r"
    game[1][1].downcase == "p" ? (return game[1]) : (return game[0])
  when "s"
    game[1][1].downcase == "r" ? (return game[1]) : (return game[0])
  end
end

def rps_tournament_winner(t)
  
end
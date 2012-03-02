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

def flatten_tournament(t)
  t.flatten!
  ret = []
  while t.size > 0
    ret << t.slice!(0..1)
  end
  ret
end

def rps_tournament_winner(tournament)
  t_copy = tournament
  t = []
  while t_copy.size > 0
    t_copy = flatten_tournament(t_copy)
    return t_copy[0] if t_copy.size == 1
    while t_copy.size > 0
      t << rps_game_winner(t_copy.slice!(0..1))
    end
    t_copy = t
  end
end
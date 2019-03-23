module Tournament
  HEADER = ["Team", "MP", "W", "D", "L", "P"]
  FORMAT = "%-30s | % 2s | % 2s | % 2s | % 2s | % 2s\n"

  Team = Struct.new(:won, :drawn, :lost) do
    def win
      self.won += 1
    end

    def loss
      self.lost += 1
    end

    def draw
      self.drawn += 1
    end

    def maches
      won + lost + drawn
    end

    def points
      won * 3 + drawn
    end
  end

  def self.calcurate_table(input)
    table = Hash.new{|h, k| h[k] = Team.new(0, 0, 0)}
    input.chomp.each_line(chomp: true) do |line|
      team1, team2, result = line.split(";");
      case result
      when "win"
        table[team1].win
        table[team2].loss
      when "loss"
        table[team1].loss
        table[team2].win
      when "draw"
        table[team1].draw
        table[team2].draw
      end
    end
    table
  end

  def self.format_table(table)
    FORMAT % HEADER + table.sort_by{|k, v| [-v.points, k]}.map do |k, v|
      FORMAT % [k, v.maches, v.won, v.drawn  , v.lost, v.points]
    end.join
  end

  def self.tally(input)
    format_table(calcurate_table(input))
  end
end

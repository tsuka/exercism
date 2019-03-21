module Tournament
  Team = Struct.new(:mp, :w, :d, :l, :p) do
    def win
      self.mp += 1
      self.w += 1
      self.p += 3
    end

    def loss
      self.mp += 1
      self.l += 1
    end

    def draw
      self.mp += 1
      self.d += 1
      self.p += 1
    end
  end

  def self.tally(input)
    header = "Team                           | MP |  W |  D |  L |  P\n"
    table = Hash.new{|h, k| h[k] = Team.new(0, 0, 0, 0, 0)}
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

    header + table.sort_by{|k, v| [-v.p, k]}.map do |k, v|
      [k.ljust(30), v.mp, v.w, v.d, v.l, v.p].join(" |  ") + "\n"
    end.join
  end
end

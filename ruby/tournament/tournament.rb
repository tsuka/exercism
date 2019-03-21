module Tournament
  def self.tally(input)
    header = "Team                           | MP |  W |  D |  L |  P\n"
    table = Hash.new{|h, k| h[k] = {mp: 0, w: 0, d: 0, l: 0, p: 0}}
    input.chomp.each_line(chomp: true) do |line|
      team1, team2, result = line.split(";");

      table[team1][:mp] += 1
      table[team2][:mp] += 1
      case result
      when "win"
        table[team1][:w] += 1
        table[team1][:p] += 3
        table[team2][:l] += 1
      when "loss"
        table[team2][:w] += 1
        table[team2][:p] += 3
        table[team1][:l] += 1
      when "draw"
        table[team1][:d] +=1
        table[team2][:d] +=1
        table[team1][:p] +=1
        table[team2][:p] +=1
      end
    end

    header + table.sort_by{|k, v| [-v[:p], k]}.map do |k,v|
      sprintf("%s|  %d |  %d |  %d |  %d |  %d\n", k.ljust(31), v[:mp], v[:w], v[:d], v[:l], v[:p])
    end.join
  end
end

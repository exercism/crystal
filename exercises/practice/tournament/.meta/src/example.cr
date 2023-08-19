module Tournament
  def self.tally(input)
    format(parse(input))
  end

  private def self.format(results)
    [header].concat(rows(results))
  end

  private def self.header
    "Team                           | MP |  W |  D |  L |  P"
  end

  private def self.rows(results)
    results.each.to_a.sort { |a, b| compare_rows(a, b) }.map do |team, results|
      [
        team.ljust(30),
        results[:matches_played].to_s.rjust(2),
        results[:wins].to_s.rjust(2),
        results[:draws].to_s.rjust(2),
        results[:losses].to_s.rjust(2),
        results[:points].to_s.rjust(2),
      ].join(" | ")
    end
  end

  private def self.compare_rows(left, right)
    if left[1][:points] == right[1][:points]
      left[0] <=> right[0]
    else
      right[1][:points] <=> left[1][:points]
    end
  end

  private def self.parse(input)
    results = Hash(String, Hash(Symbol, Int32)).new { |h, v| h[v] = default_results }

    input.each do |line|
      team_a, team_b, result = /(.+);(.+);(.+)/.match(line).not_nil!.captures

      case result
      when "win"
        add_win results[team_a]
        add_loss results[team_b]
      when "loss"
        add_loss results[team_a]
        add_win results[team_b]
      when "draw"
        add_draw results[team_a]
        add_draw results[team_b]
      end
    end

    results
  end

  private def self.add_win(results)
    results[:matches_played] += 1
    results[:wins] += 1
    results[:points] += 3
  end

  private def self.add_loss(results)
    results[:matches_played] += 1
    results[:losses] += 1
  end

  private def self.add_draw(results)
    results[:matches_played] += 1
    results[:draws] += 1
    results[:points] += 1
  end

  private def self.default_results
    {:matches_played => 0, :wins => 0, :losses => 0, :draws => 0, :points => 0}
  end
end

module PlayersHelper

  def player_bats(player)
    if player.bats == 0
      'Right'
    elsif player.bats == 1
      'Left'
    else
      'Switch'
    end
  end

  def player_throws(player)
    if player.throws == 0
      'Right'
    else player.throws == 1
      'Left'
    end
  end

  def player_position(player)
    if player.position == 1
      "Pitcher"
    elsif player.position == 2
      "Catcher"
    elsif player.position == 3
      "First Base"
    elsif player.position == 4
      "Second Base"
    elsif player.position == 5
      "Shortstop"
    elsif player.position == 6
      "Third Base"
    elsif player.position == 7
      "Left Field"
    elsif player.position == 8
      "Center Field"
    else
      "Right Field"
    end
  end

  def style_player(player)
    # If the player is not a pitcher
    if player.position != 1
      # If the player is a lefty or switch hitter
      if (player.bats == 1 || player.bats == 2)
        "l-s-player"
      else
        "r-player-pitcher"
      end
    # If the player is a pitcher
    elsif player.position == 1
      # If the player throws left-handed
      if player.throws == 1
        "l-pitcher"
      else
        "r-player-pitcher"
      end
    else
      "r-player-pitcher"
    end
  end

  def abbrev_position(player)
    if player.position == 1
      "P"
    elsif player.position == 2
      "C"
    elsif player.position == 3
      "1B"
    elsif player.position == 4
      "2B"
    elsif player.position == 5
      "SS"
    elsif player.position == 6
      "3B"
    elsif player.position == 7 || player.position == 8 || player.position == 9
      "OF"
    else
      "N/A"
    end
  end

end

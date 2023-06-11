class TictactoeboardsController < ApplicationController
  def index
    @tictactoeboard = Tictactoeboard.find(1)
  end

  def initialise_board
    player_1 = cookies['player_1']
    player_2 = cookies['player_2']

    if player_1 || player_2
      redirect_to action: 'index'
    else
      tictactoeboard = Tictactoeboard.find(1)
      if tictactoeboard.player_1.blank?
        cookies['player_1'] = true
        tictactoeboard.update(player_1: true)
        redirect_to action: 'index'
      elsif tictactoeboard.player_2.blank?
        cookies['player_2'] = true
        tictactoeboard.update(player_2: true)
        redirect_to action: 'index'
      end
    end
  end

  def click
    @tictactoeboard = Tictactoeboard.find(1)
    if @tictactoeboard.cell_1 == 'cross'
      @tictactoeboard.update cell_1: 'circle'
    else
      @tictactoeboard.update cell_1: 'cross'
    end
  end
end

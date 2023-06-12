class TictactoeboardsController < ApplicationController
  before_action :initialise_board, only: :index

  def index
    @tictactoeboard = Tictactoeboard.find(1)
  end

  def click
    request_body = JSON.parse(request.body.read)
    cell = request_body['cell']
    player = cookies['player_1'].present? ? 'player_1' : 'player_2' 
    @tictactoeboard = Tictactoeboard.find(1)

    return if @tictactoeboard.send(cell)
    return if @tictactoeboard.winner
    return unless @tictactoeboard.whose_turn_next == player

    if player == 'player_1'
      @tictactoeboard.update("#{cell}": 'circle', circles_count: @tictactoeboard.circles_count + 1)
    elsif player == 'player_2'
      @tictactoeboard.update("#{cell}": 'cross', crosses_count: @tictactoeboard.crosses_count + 1)
    end
  end

  private

  def initialise_board
    player_1 = cookies['player_1']
    player_2 = cookies['player_2']

    if player_1.blank? && player_2.blank?
      tictactoeboard = Tictactoeboard.find(1)
      if tictactoeboard.player_1.blank?
        cookies['player_1'] = true
        tictactoeboard.update(player_1: true)
        # redirect_to action: 'index'
      elsif tictactoeboard.player_2.blank?
        cookies['player_2'] = true
        tictactoeboard.update(player_2: true)
        # redirect_to action: 'index'
      end
    end
  end
end

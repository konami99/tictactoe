class TictactoeboardsController < ApplicationController
  def index
    @tictactoeboard = Tictactoeboard.find(1)
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

class TictactoeboardsController < ApplicationController
  include Turbo::Streams::ActionHelper

  before_action :initialise_board, only: :index

  def index
    #@tictactoeboard = Tictactoeboard.find(1)
  end

  def click
    request_body = JSON.parse(request.body.read)
    cell = request_body['cell']
    player = cookies['player_1'].present? ? 'player_1' : 'player_2'
    channel = cookies['channel']
    @tictactoeboard = Tictactoeboard.find_by(channel: channel)

    return if @tictactoeboard.send(cell)
    return if @tictactoeboard.winner
    return unless @tictactoeboard.whose_turn_next == player

    if player == 'player_1'
      @tictactoeboard.update("#{cell}": 'circle', circles_count: @tictactoeboard.circles_count + 1)
    elsif player == 'player_2'
      @tictactoeboard.update("#{cell}": 'cross', crosses_count: @tictactoeboard.crosses_count + 1)
    end
  end

  def reset
    player_1 = cookies['player_1']
    player_2 = cookies['player_2']
    channel = cookies['channel']

    tictactoeboard = Tictactoeboard.find_by(channel: channel)
    tictactoeboard.update(
      player_1: nil,
      player_2: nil,
      cell_1: nil,
      cell_2: nil,
      cell_3: nil,
      cell_4: nil,
      cell_5: nil,
      cell_6: nil,
      cell_7: nil,
      cell_8: nil,
      cell_9: nil,
      circles_count: 0,
      crosses_count: 0
    )

    ActionCable.server.broadcast(channel, turbo_stream_action_tag(:reload))
  end

  def join

  end

  def join_team
    binding.pry
    channel = params[:channel]
  end

  private

  def initialise_board
    player_1 = cookies['player_1']
    player_2 = cookies['player_2']
    @channel = SecureRandom.alphanumeric(12)
    @tictactoeboard = Tictactoeboard.create(channel: @channel)
    
    if @tictactoeboard.player_1.blank?
      cookies['player_1'] = true
      cookies['channel'] = @channel
      @tictactoeboard.update(player_1: true)
    elsif @tictactoeboard.player_2.blank?
      cookies['player_2'] = true
      cookies['channel'] = @channel
      @tictactoeboard.update(player_2: true)
    end
  end
end

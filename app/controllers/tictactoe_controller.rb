class TictactoeController < ApplicationController
  def index

  end

  def click
    
    respond_to do |format|
      format.html {  }
      format.turbo_stream
    end
  end
end

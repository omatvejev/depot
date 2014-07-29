module CurrentCounter
  extend ActiveSupport::Concern

  private

  def set_counter
    if session[:counter].nil?
      session[:counter] = 0
    end
    @counter = session[:counter]
  end

  def update_counter
    session[:counter] += 1
    set_counter
  end

  def reset_counter
    session[:counter] = 0
    set_counter
  end
end

require 'click_counter_app'
require 'qt'

class ClickCounterApp < Qt::Application

  def initialize(main_window)
    super(ARGV)
    main_window.show
  end

end

require 'qt'

class ClickCounter < Qt::Widget

  def initialize
    super(nil)
    layout = Qt::VBoxLayout.new
    layout.addWidget(Qt::Label.new('0'))
    setLayout(layout)
  end
end

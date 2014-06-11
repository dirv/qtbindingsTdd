require 'qt'

class ClickCounter < Qt::Widget
  
  slots :click

  def initialize
    super(nil)
    @count_label = Qt::Label.new('0')
    layout = Qt::VBoxLayout.new
    layout.addWidget(@count_label)
    button = Qt::PushButton.new
    button.object_name = 'clicker'
    connect(button, SIGNAL(:clicked), self, SLOT(:click))
    layout.addWidget(button)
    setLayout(layout)
  end
  
  def click
    @count_label.text = '1'
  end
end

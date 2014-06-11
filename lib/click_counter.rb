require 'qt'

class ClickCounter < Qt::Widget
  
  slots :click

  def initialize
    super(nil)
    layout = Qt::VBoxLayout.new
    layout.addWidget(create_label)
    layout.addWidget(create_button)
    setLayout(layout)
  end
  
  def click
    update_label
  end
  
  def create_label
    @count = 0
    @count_label = Qt::Label.new(@count.to_s)
  end

  def update_label
    @count += 1
    @count_label.text = @count.to_s
  end
  
  def create_button
    button = Qt::PushButton.new
    button.object_name = 'clicker'
    connect(button, SIGNAL(:clicked), self, SLOT(:click))
    button
  end

end

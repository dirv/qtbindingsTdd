require 'spec_helper'
require 'qt'
require 'click_counter'

describe ClickCounter do

  it 'is a window' do
    app = Qt::Application.new(ARGV)
    window = ClickCounter.new
    expect(window).to be_kind_of(Qt::Widget)
    expect(window.parent).to be_nil
  end
end

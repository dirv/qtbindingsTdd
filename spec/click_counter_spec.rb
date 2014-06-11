require 'spec_helper'
require 'qt'
require 'click_counter'

RSpec::Matchers.define :have_label_with_text do |expected|
  match do |widget|
    widget.children.any? do |child|
      child.kind_of?(Qt::Label) and child.text==expected
    end
  end
end

describe ClickCounter do

  let(:window) { ClickCounter.new }

  before do
    app = Qt::Application.new(ARGV)
  end

  it 'is a window' do
    expect(window).to be_kind_of(Qt::Widget)
    expect(window.parent).to be_nil
  end
  
  it 'shows 0 before any clicks are made' do
    expect(window).to have_label_with_text('0')
  end
  
  it 'shows 1 after one click' do
    find_widget('clicker').click
    expect(window).to have_label_with_text('1')
    expect(window).to_not have_label_with_text('0')
  end
  
  it 'shows 2 after two clicks' do
    find_widget('clicker').click
    find_widget('clicker').click
    expect(window).to have_label_with_text('2')
  end
  def find_widget(name)
    window.children.find{ |w| w.object_name==name }
  end

end

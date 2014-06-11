require 'spec_helper'
require 'qt'
require 'click_counter'

describe ClickCounter do
  include_context :qt

  let(:window) { ClickCounter.new }

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

end

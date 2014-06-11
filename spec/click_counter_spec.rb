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
end

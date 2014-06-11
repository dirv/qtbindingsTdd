require 'spec_helper'
require 'click_counter'
require 'click_counter_app'

describe ClickCounterApp do
  include_context :qt

  let(:window) { ClickCounter.new }

  it 'displays a click counter window' do
    expect(window).to receive(:show)
    ClickCounterApp.new(window)
  end

end

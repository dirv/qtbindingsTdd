describe ClickCounter do

  it 'displays a window' do
    window = ClickCounter.new
    expect(window).to be_kind_of(Qt::Window)
  end
end

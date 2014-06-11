RSpec.shared_context :qt do

  before do
    app = Qt::Application.new(ARGV)
  end

  def find_widget(name)
    window.children.find{ |w| w.object_name==name }
  end

end

RSpec::Matchers.define :have_label_with_text do |expected|
  match do |widget|
    widget.children.any? do |child|
      child.kind_of?(Qt::Label) and child.text==expected
    end
  end
end

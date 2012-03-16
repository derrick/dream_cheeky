require 'dream_cheeky'

describe DreamCheeky do

  it "should contain a BigRedButton class" do
    expect { DreamCheeky::BigRedButton.new }.to_not raise_error(NameError)
  end

end

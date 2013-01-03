require 'dream_cheeky'

describe DreamCheeky::UsbFidget do

  it "should raise an error when instantiated if it can't find a UsbFidget device" do
    pending
    expect { subject }.to raise_error
  end
end

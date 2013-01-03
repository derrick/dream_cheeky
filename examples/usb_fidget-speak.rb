require 'rubygems'
require 'dream_cheeky'

DreamCheeky::UsbFidget.run do
  push do
    `say "BEEP!"`
  end
end

require 'rubygems'
require 'dream_cheeky'

DreamCheeky::BigRedButton.run do
  open do
    `say "World, the time has come to"`
    `say -v Zarvox -r 100 "Push the button"`
  end

  close do
    `say -v Bad "Dum dum da dum dum da dum da dum da dum"`
  end

  push do
    `say "Boom!" -r 10`
    `say "Oh, the humanity!"`
  end
end

# Dream Cheeky

World, the time has come to PUSH THE BUTTON!


```ruby
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
```

```ruby
require 'dream_cheeky'
require 'watir-webdriver'

DreamCheeky::BigRedButton.run do
  browser = Watir::Browser.new

  open do
    browser.goto 'devastatingexplosions.com'
  end

  close do
    browser.close
  end

  push do
    browser.object(:id => 'flashcontent').click
  end
end
```

# Dream Cheeky

Make your Dream Cheeky USB Device do something cool.

World, the time has come to PUSH THE BUTTON!

## Support
The following Dream Cheeky USB Devices are supported `(vendor_id:product_id)`

Big Red Button ``(1d34:000d)``  
USB Fidget ``(1d34:0001)``  

Please get in touch if you have an unsupported Dream Cheeky device.

## Usage

```ruby
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
```

or

```ruby
require 'rubygems'
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

## Requirements

1. A supported Dream Cheeky USB Device. Example: http://dreamcheeky.com/big-red-button
2. Mac OS X with Developer Tools installed. (Support for Linux and Windows is planned).

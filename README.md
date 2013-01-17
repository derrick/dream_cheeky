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

## Requirements

1. A Dream Cheeky Big Red Button(TM).  Don't have one?  http://dreamcheeky.com/big-red-button

2. Mac OS X with Developer Tools installed or Linux with libusb and udev installed. (Support for Windows is planned).

3. On Linux you may have to [add a udev rule](http://reactivated.net/writing_udev_rules.html). To do that, create a 
   file named 99-dream_cheeky.rules with the following content:
   
        <SUBSYSTEM=="usb", ATTR{idVendor}=="1d34", ATTR{idProduct}=="000d", MODE="0666", GROUP="plugdev">
   
   Then, copy the file to /etc/udev/rules.d/99-dream_cheeky.rules (you probably would need root priviles to copy it).

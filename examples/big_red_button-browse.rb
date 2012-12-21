require 'rubygems'
require 'dream_cheeky'
require 'watir-webdriver'

DreamCheeky::BigRedButton.run do
  browser = ""

  open do
    browser = Watir::Browser.new
    browser.goto 'devastatingexplosions.com'
  end

  close do
    browser.close
  end

  push do
    browser.object(:id => 'flashcontent').click
  end
end

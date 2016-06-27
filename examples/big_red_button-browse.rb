require 'rubygems'
require 'dream_cheeky'
require 'watir-webdriver'

DreamCheeky::BigRedButton.run do
  browser = nil

  open do
    ## to use google chrome instead of default firefox add :chrome after new (with a space) and add the ChromeDriver http://code.google.com/p/chromedriver/downloads/list to your $PATH
    browser = Watir::Browser.new
    browser.goto 'www.soulstice.org'
  end

  close do
    browser.close unless browser.nil?
  end

  push do
    browser.object(:id => 'flashcontent').click
  end
end

require 'rubygems'
require 'libusb'


usb = LIBUSB::Context.new
button = usb.devices(:idVendor => 0x1d34, :idProduct => 0x000d).first
mouse = usb.devices(:idVendor => 0x045e, :idProduct => 0x0024).first
puts mouse.inspect
puts mouse.configurations.inspect
puts mouse.interfaces.first.settings.first.bInterfaceNumber.inspect
mouse.open do |handle|
  #puts handle.set_configuration(1)
  #puts device.configurations.inspect
  handle.claim_interface(0) do
    sleep 60
    ##handle.control_transfer(:bmRequestType => 0x40, :bRequest => 0xa0, :wValue => 0xe600, :wIndex => 0x0000, :dataOut => 1.chr)
  end
end

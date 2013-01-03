module DreamCheeky
  class UsbFidget

    DEPRESSED = 0x1E

    def self.run(&block)
      brb = new
      brb.instance_eval(&block)
      brb.run
    end

    def push(&block)
      @button_pushed_callback = block
    end

    def run
      poll_usb
    end


    private ####################################################################

    attr_accessor :prior_state, :current_state

    def poll_usb
      init_loop
      begin
        case check_button
        when DEPRESSED
          push! unless already_pushed?
        end
      end while(true)
    end

    def init_loop
      self.prior_state = self.current_state = get_current_state
    end

    def check_button
      self.prior_state = current_state
      self.current_state = get_current_state
    end

    def push!
      @button_pushed_callback && @button_pushed_callback.call
    end

    def already_pushed?
      DEPRESSED == prior_state
    end

  end
end

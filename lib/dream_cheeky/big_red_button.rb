module DreamCheeky
  class BigRedButton

    CLOSED    = 0x15
    OPEN      = 0x17
    DEPRESSED = 0x16

    def self.run(&block)
      brb = new
      brb.instance_eval(&block)
      brb.run
    end

    def open(&block)
      @button_opened_callback = block
    end

    def close(&block)
      @button_closed_callback = block
    end

    def push(&block)
      @button_pushed_callback = block
    end

    def run
      poll_usb
    end


    private ####################################################################

    attr_accessor :prior_state, :current_state, :open_or_closed

    def poll_usb
      init_loop
      begin
        case check_button
        when OPEN
          open! unless already_open?
        when DEPRESSED
          push! unless already_pushed?
        when CLOSED
          close! unless already_closed?
        end
      end while(true)
    end

    def init_loop
      self.prior_state = self.current_state = get_current_state
      self.open_or_closed = DEPRESSED == prior_state ? OPEN : prior_state
    end

    def check_button
      self.prior_state = current_state
      self.current_state = get_current_state
    end

    def open!
      self.open_or_closed = OPEN
      @button_opened_callback && @button_opened_callback.call
    end
    
    def already_open?
      OPEN == open_or_closed
    end

    def push!
      @button_pushed_callback && @button_pushed_callback.call
    end

    def already_pushed?
      DEPRESSED == prior_state
    end

    def close!
      self.open_or_closed = CLOSED
      @button_closed_callback && @button_closed_callback.call
    end

    def already_closed?
      CLOSED == open_or_closed
    end


  end
end

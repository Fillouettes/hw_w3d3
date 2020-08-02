class Simon
  COLORS = %w(red blue green yellow)

  attr_accessor :sequence_length, :game_over, :seq

  def initialize
    @seq = []
    @sequence_length = 1
    @game_over = false
  end

  def play
    puts "SIMON"
    until self.game_over
      puts "Round #{self.sequence_length}"
      self.take_turn
    end
    self.game_over_message
    self.reset_game
  end

  def take_turn
    self.show_sequence
    self.require_sequence
    self.round_success_message if !self.game_over
    self.sequence_length += 1
  end

  def show_sequence
    self.add_random_color
    self.seq.each do |color|
      puts color
    end
    sleep(2)
    system 'clear'
  end

  def require_sequence
    i = 1
    while i <= self.sequence_length
      puts "Next color?"
      input = gets.chomp
      if input != self.seq[i -1]
        self.game_over = true
        break
      end
      i += 1
    end
  end

  def add_random_color
    colors = %w(red blue yellow green)
    seq << colors.sample
  end

  def round_success_message
    puts "Passed round #{self.sequence_length}!"
  end

  def game_over_message
    puts "Failed. GAME OVER"
    puts "Survived #{self.sequence_length} rounds"
  end

  def reset_game
    self.sequence_length = 1
    self.game_over = false
    self.seq = []
  end
end

# s = Simon.new
# s.play
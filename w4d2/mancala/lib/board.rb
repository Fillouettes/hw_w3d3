class Board
  attr_accessor :cups

  def initialize(name1, name2)
    @player_1 = name1
    @player_2 = name2
    @cups = Array.new(14) {[]}
    self.place_stones
  end

  def place_stones
    (0..5).each {|i| self.cups[i] = [:stone, :stone, :stone, :stone]}
    (7..12).each {|i| self.cups[i] = [:stone, :stone, :stone, :stone]}
  end

  def valid_move?(start_pos)
    raise "Invalid starting cup" if !(0..13).include?(start_pos)
    raise "Starting cup is empty" if self.cups[start_pos].empty?
  end

  def make_move(start_pos, current_player_name)
    pos = (start_pos + 1 % 14)
    bad_store = current_player_name == @player_1 ? 13 : 6
    while !self.cups[start_pos].empty?
      if pos != bad_store
        self.cups[pos] << self.cups[start_pos].pop
      end
      pos = (pos + 1 % 14)
    end
    self.next_turn(pos)
    self.render
  end

  def next_turn(ending_cup_idx)
    # helper method to determine whether #make_move returns :switch, :prompt, or ending_cup_idx
  end

  def render
    print "      #{@cups[7..12].reverse.map { |cup| cup.count }}      \n"
    puts "#{@cups[13].count} -------------------------- #{@cups[6].count}"
    print "      #{@cups.take(6).map { |cup| cup.count }}      \n"
    puts ""
    puts ""
  end

  def one_side_empty?
  end

  def winner
  end
end
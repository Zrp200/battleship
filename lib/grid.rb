class Grid
  attr_accessor :status_line

  AXE_LETTERS = %w( A B C D E F G H I J )
  AXE_DIGGITS = %w( 1 2 3 4 5 6 7 8 9 10 )
  HIT_CHAR = 'X'
  NO_SHOT_CHAR = '.'
  MISS_CHAR = '-'


  def initialize
    @matrix = []
    @fleet = []
  end

  def build(matrix, fleet = nil)
    @matrix = matrix
    @fleet = fleet
    self  
  end

  def show
    print_header
    setup_with_fleet if @fleet
    @matrix.each_with_index do |grow, index|
      Grid.row("#{ AXE_LETTERS[index] } #{ grow.join(' ') }")
    end
  end

  def self.row(txt)
    return nil if ENV['RACK_ENV'] == 'test'
    puts txt if txt
  end

  private

  def setup_with_fleet
    if @fleet
      for ship in @fleet
        for coordinates in ship.location
          @matrix[coordinates[0]][coordinates[1]] = HIT_CHAR
        end
      end
    end
    @matrix
  end

  def print_header
    return nil if ENV['RACK_ENV'] == 'test'
    puts "=" * AXE_DIGGITS.size*3
    puts status_line
    puts "  #{AXE_DIGGITS.join(' ')}"
  end
end

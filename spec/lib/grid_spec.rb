require "spec_helper"
require "grid"
require "ship"

describe Grid do
  let(:grid) { Grid.new.build(Array.new) }

  it "is valid" do
    expect(grid).to be_kind_of(Grid)
  end

  it 'has letters array' do
    expect(Grid::AXE_LETTERS).to eql(%w(A B C D E F G H I J))
  end

  it 'has diggits array' do
    expect(Grid::AXE_DIGGITS).to eql(%w(1 2 3 4 5 6 7 8 9 10))
  end

  it 'has show method' do
    expect(grid).to respond_to(:show)
  end

  it 'has row class method' do
    expect(described_class).to respond_to(:row)
  end

  it '#setup_with_fleet' do
    matrix = Array.new(4){ Array.new(4, " ") }

    ship1 = Ship.new(matrix, 1).build
    ship1.instance_variable_set("@location", [[0,2]]) 

    fleet = [ship1, Ship.new(matrix, 2).build]

    grid = Grid.new().build(matrix)
    grid.instance_variable_set("@fleet",fleet)
    expect(grid.send(:setup_with_fleet)[0][2]).to eql('X')
  end
end

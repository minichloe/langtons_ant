require 'board'

RSpec.describe Board do
  let(:size) { 5 }
  let(:board) { described_class.new(size) }

  describe "#new" do
    subject { board }

    it "creates a board with the proper size" do
      expect(subject.board.length).to eq(size)

      subject.board.each do |row|
        expect(row.length).to eq(size)
      end
    end
  end

  describe "#play!" do
    let(:n) { 2 }
    let(:current_cell) { double(:cell, colour: Cell::WHITE, flip!: true) }
    let(:ant) { double(:ant, rotate!: true, move!: true, current_position: {}) }
    subject { board.play!(n) }

    before do
      allow(board).to receive(:current_cell).and_return(current_cell)
      allow(board).to receive(:ant).and_return(ant)
      allow(board).to receive(:print_board)
    end

    it "plays n times" do
      expect(board).to receive(:update_board!).twice
      subject
    end

    it "rotates the ant" do
      expect(ant).to receive(:rotate!).with(current_cell.colour)
      subject
    end

    it "flips the current cell" do
      expect(current_cell).to receive(:flip!)
      subject
    end

    it "moves the ant" do
      expect(ant).to receive(:move!)
      subject
    end

    it "prints the board" do
      expect(board).to receive(:print_board).twice
      subject
    end
  end
end

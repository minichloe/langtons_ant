require 'ant'

RSpec.describe Ant do
  let(:board_size) { 5 }
  let(:ant) { described_class.new(board_size) }

  describe "#move!" do
    subject { ant.move! }

    before do
      ant.direction = direction
    end

    context "when direction is north" do
      let(:direction) { 0 }

      it "moves one step up the board" do
        expect{ subject }.not_to change { ant.col }
        expect(ant.row).to eq(1)
      end
    end

    context "when direction is east" do
      let(:direction) { 1 }

      it "moves one step right" do
        expect{ subject }.not_to change { ant.row }
        expect(ant.col).to eq(3)
      end
    end

    context "when direction is south" do
      let(:direction) { 2 }

      it "moves one step right" do
        expect{ subject }.not_to change { ant.col }
        expect(ant.row).to eq(3)
      end
    end

    context "when direction is west" do
      let(:direction) { 3 }

      it "moves one step right" do
        expect{ subject }.not_to change { ant.row }
        expect(ant.col).to eq(1)
      end
    end
  end

  describe "rotate!" do
    subject { ant.rotate!(colour) }

    context "when colour is white" do
      let(:colour) { Cell::WHITE }

      it "rotates the ant clockwise" do
        expect(ant.direction).to eq(0)
        subject
        expect(ant.direction).to eq(1)
      end
    end

    context "when colour is white" do
      let(:colour) { Cell::BLACK }

      it "rotates the ant counter clockwise" do
        expect(ant.direction).to eq(0)
        subject
        expect(ant.direction).to eq(3)
      end
    end
  end

  describe "#current_position" do
    let(:row) { ant.row }
    let(:col) { ant.col }
    let(:direction) { Ant::DIRECTIONS[ant.direction] }
    let(:expected_output) do
      {
        location: [row, col],
        direction: direction
      }
    end
    subject { ant.current_position }

    it { is_expected.to eq(expected_output) }
  end
end

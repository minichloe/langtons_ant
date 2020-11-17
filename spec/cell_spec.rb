require 'cell'

RSpec.describe Cell do
  let(:cell) { described_class.new }

  describe "#flip" do
    subject { cell.flip! }

    context "when colour is white" do
      it "flips it to black" do
        subject
        expect(cell.colour).to eq(Cell::BLACK)
      end
    end

    context "when colour is black" do
      before do
        cell.colour = Cell::BLACK
      end

      it "flips it to white" do
        subject
        expect(cell.colour).to eq(Cell::WHITE)
      end
    end
  end

  describe "#readable_colour" do
    subject { cell.readable_colour}

    context "when colour is white" do
      it { is_expected.to eq("W") }
    end

    context "when colour is black" do
      before do
        cell.colour = Cell::BLACK
      end

      it { is_expected.to eq("B") }
    end
  end
end

require 'journey'

describe Journey do

  let(:journey) { described_class.new }

  it 'expects the journey class to exist' do
    expect(journey).to be_an_instance_of(Journey)
  end

  context 'beginning and ending journeys' do

    it 'expects begin_journey to' do
      journey.begin_journey
      expect(journey.journey_started).to eq true
    end

    it 'expects end_journey to' do
      journey.end_journey
      expect(journey.journey_finished).to eq true
    end

    it 'expects the Journey to have journey started (set to false) attributes' do
      expect(journey.journey_started).to eq false
    end

    it 'expects the Journey to have journey finished (set to false) attributes' do
      expect(journey.journey_finished).to eq false
    end

    it 'expects to return true once the journey has been completed' do
      journey.begin_journey
      journey.end_journey
      expect(journey.journey_completed?).to eq true
    end

  end
end

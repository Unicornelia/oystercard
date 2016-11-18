require 'journey'

describe Journey do

  let(:journey) { described_class.new }
  let(:entry_station) { double :entry_station}
  let(:exit_station) { double :exit_station}

  it 'expects the journey class to exist' do
    expect(journey).to be_an_instance_of(Journey)
  end

  context 'beginning and ending journeys' do
    it 'expects begin_journey to' do
      journey.begin_journey(entry_station)
      expect(journey.journey_started).to eq true
    end

    it 'expects end_journey to' do
      journey.end_journey(exit_station)
      expect(journey.journey_finished).to eq true
    end

    it 'expects to return true once the journey has been completed' do
      journey.begin_journey(entry_station)
      journey.end_journey(exit_station)
      expect(journey.journey_completed?).to eq true
    end
  end

  context 'journey fare' do

    it 'returns the penalty fare if journey is not completed (no touch out)' do
      journey.begin_journey(entry_station)
      expect(journey.fare).to eq Journey::PENALTY_FARE
    end

    it 'returns the penalty fare if journey is not completed (no touch in)' do
      journey.end_journey(exit_station)
      expect(journey.fare).to eq Journey::PENALTY_FARE
    end
  end

  context 'travelling' do
    it 'records the entry_station on card' do
      journey.begin_journey(entry_station)
      expect(journey.entry_station).to eq entry_station
    end

    it 'expects to return true once the journey has been completed' do
      journey.begin_journey(entry_station)
      journey.end_journey(exit_station)
      expect(journey.fare).to eq Journey::MINIMUM_FARE
    end
  end
end

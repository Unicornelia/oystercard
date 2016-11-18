require 'station'

describe Station do
  let(:station) { described_class.new("name", "zone")}

  it 'expects station to exist' do
    expect(station).to be_instance_of(Station)
  end

  it 'expects zone instance variable to equal "zone"' do
    expect(station.zone).to eq "zone"
  end

  it 'expects name instance variable to equal "name"' do
    expect(station.name).to eq "name"
  end

end

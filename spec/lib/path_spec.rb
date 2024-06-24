# frozen_string_literal: true

describe Path do
  it 'has a LEFT constant' do
    expect(Path::LEFT).to eq('L')
  end

  it 'has a RIGHT constant' do
    expect(Path::RIGHT).to eq('R')
  end

  it 'has a MOVE constant' do
    expect(Path::MOVE).to eq('M')
  end
end

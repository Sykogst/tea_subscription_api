require 'rails_helper'

RSpec.describe TeaSerializer, type: :serializer do
  describe 'Serializing' do
    it 'serializes tea data' do
      tea = create(:tea)
      serialized_tea = TeaSerializer.new(tea).as_json['data']

      expect(serialized_tea).to have_key('id')
      expect(serialized_tea['id']).to eq(tea.id.to_s)
      expect(serialized_tea).to have_key('type')
      expect(serialized_tea['type']).to eq('tea')
      expect(serialized_tea).to have_key('attributes')

      serialized_attributes = serialized_tea['attributes']
      expect(serialized_attributes).to have_key('title')
      expect(serialized_attributes['title']).to eq(tea.title)
      expect(serialized_attributes).to have_key('description')
      expect(serialized_attributes['description']).to eq(tea.description)
      expect(serialized_attributes).to have_key('temperature')
      expect(serialized_attributes['temperature']).to eq(tea.temperature)
      expect(serialized_attributes).to have_key('brew_time')
      expect(serialized_attributes['brew_time']).to eq(tea.brew_time)
    end
  end
end
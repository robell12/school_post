require 'rails_helper'

RSpec.describe Period, type: :model do
  describe 'association' do
    it { should belong_to :school }
  end
end

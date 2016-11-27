require 'rails_helper'

RSpec.describe School, type: :model do
  describe 'associations' do
    it { should have_many :periods }
  end
end

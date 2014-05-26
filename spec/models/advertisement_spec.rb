require 'spec_helper'

describe Advertisement do

  it { should belong_to(:company) }
  it { should belong_to(:category_1) }
  it { should belong_to(:category_2) }
  it { should belong_to(:advertisement_type) }
  it { should belong_to(:working_turn) }
  it { should have_many(:postulations) }
  it { should have_many(:postulants) }

  it { should validate_presence_of(:title) }
  it { should validate_presence_of(:company) }
  it { should validate_presence_of(:category_1) }
  it { should validate_presence_of(:advertisement_type) }
  it { should validate_presence_of(:description) }
  it { should validate_presence_of(:short_description) }
  it { should validate_presence_of(:title) }
  it { should validate_presence_of(:working_turn) }

  it { should ensure_length_of(:title).is_at_most(45) }
  it { should ensure_length_of(:short_description).is_at_most(250) }

  let(:advertisement) { build(:advertisement) }

  describe '#if_is_recommendable_it_should_be_published' do

    it 'should fail if both categories are the same' do
      a = advertisement
      a.category_2 = a.category_1
      expect {a.save!}.to raise_error ActiveRecord::RecordInvalid
    end

  end

end

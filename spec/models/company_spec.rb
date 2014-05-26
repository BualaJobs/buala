require 'spec_helper'

describe Company do

  before do
    Company.stub(:acts_as_gmappable).and_return({})
  end

  it { should belong_to(:category) }
  it { should belong_to(:company_type) }
  it { should have_many(:advertisements) }

  # it { should validate_presence_of(:name) }
  # it { should validate_presence_of(:description) }
  # it { should validate_presence_of(:category) }
  # it { should validate_presence_of(:company_type) }
  # it { should validate_presence_of(:email) }

end

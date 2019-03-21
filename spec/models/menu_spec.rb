require 'rails_helper'

describe Menu do
  it { should validate_presence_of(:startdate) }
end

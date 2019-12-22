require 'rails_helper'

# Test suite for the Category model
RSpec.describe Category, type: :model do
  # Association test
  # ensure Category model has a 1:m relationship with the Product model
  it { should have_many(:products).dependent(:destroy) }
  # Validation tests
  # ensure columns name ,category_type and  are present before saving
  it { should validate_presence_of(:name) }
  it { should validate_presence_of(:category_type) }
  it { should validate_presence_of(:model) }

end
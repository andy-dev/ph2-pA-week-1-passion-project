require_relative '../spec_helper'


describe Note do

  it {should validate_presence_of(:user)}

end
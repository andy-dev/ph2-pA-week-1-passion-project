require_relative '../spec_helper'

#----------------------------------------------------
# TESTING PRESENCE AND UNIQUNESS
#----------------------------------------------------

describe Note do
  it {should validate_presence_of(:user)}
end

describe User do
  subject { User.new(password_hash: '123456') }
  it { should validate_presence_of(:password_hash) }
end


# COMENT THIS TEST OUT BECAUSE WE CHANGE VALIDATION WITH CUSTOM MESSAGE
# describe User do
#   subject { User.new(user_name: 'Andy') }
#   it { should validate_presence_of(:user_name). }
# end

describe User do
      it do
        should validate_presence_of(:user_name).
          with_message('Need Username and Password to login/register')
      end
    end


describe User do
      it do
        should validate_uniqueness_of(:user_name).
          with_message('Username already Exists')
      end
    end


#----------------------------------------------------
# TESTING ACTIVE RECORD ASSOCIATIONS
#----------------------------------------------------
describe View do
  it { should belong_to(:user) }
end

describe View do
  it { should belong_to(:note) }
end

describe User do
  it { should have_many(:notes) }
end

describe User do
  it { should have_many(:views) }
end

describe Note do
  it { should belong_to(:user) }
end

describe Note do
  it { should have_many(:views) }
end

#----------------------------------------------------
# TESTING Controller
#----------------------------------------------------


#if you get a 302 it means it is redirecting
  describe "GET /register" do
    it "renders a successful status" do
      # arrange
      # act
      get '/register'
      # assert
      expect(last_response.status).to eq(200)
    end
end


describe "GET /" do
    it "renders a successful status" do
      # arrange
      # act
      get '/'
      # assert
      expect(last_response.status).to eq(200)
    end
end




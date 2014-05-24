require 'spec_helper'

describe Posts do
  before :each do
    @post = Posts.new(subject: 'Title', main_body: 'This a post')
  end

  subject { @post }

  it { should respond_to(:subject) }
  it { should respond_to(:main_body) }
  it { should respond_to(:main_image) }
  it { should be_valid }

  describe 'validations' do
    describe 'should not be valid when subject is blank' do
      before { @post.subject = '' }
      it { should_not be_valid }
    end

    describe 'should not be valid when subject is too long' do
      before { @post.subject = 'a' * 31 }
      it { should_not be_valid }
    end

    describe 'should not be valid when subject is blank' do
      before { @post.main_body = '' }
      it { should_not be_valid }
    end
  end
end

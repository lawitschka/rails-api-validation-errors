require 'spec_helper'

describe ActiveModel::Errors do

  before :each do
    ActiveModel::Errors.enable_translations
  end

  after :each do
    ActiveModel::Errors.enable_translations
  end

  it { expect(ActiveModel::Errors).to respond_to :enable_translations }
  it { expect(ActiveModel::Errors).to respond_to :disable_translations }

  it 'translates messages per default' do
    option = ActiveModel::Errors.class_variable_get '@@translate_message'
    expect(option).to be_truthy
  end

  describe '.enable_translations' do
    it 'sets message translation option to true' do
      ActiveModel::Errors.class_variable_set '@@translate_message', false
      ActiveModel::Errors.enable_translations
      option = ActiveModel::Errors.class_variable_get '@@translate_message'
      expect(option).to be_truthy
    end
  end

  describe '.disable_translations' do
    it 'sets message translation option to false' do
      ActiveModel::Errors.disable_translations
      option = ActiveModel::Errors.class_variable_get '@@translate_message'
      expect(option).to be_falsy
    end
  end

  describe '#generate_message' do
    let(:errors) { ActiveModel::Errors.new({}) }

    context "when translations are turned on" do
      it 'uses the original method' do
        ActiveModel::Errors.enable_translations
        RR.stub(errors)._generate_message

        errors.generate_message(:attribute)

        expect(errors).to have_received._generate_message(
          :attribute, :invalid, {}
        )
      end
    end

    context "when translations are turned off" do
      before :each do
        ActiveModel::Errors.disable_translations
      end

      it 'does not use the original method' do
        RR.stub(errors)._generate_message

        errors.generate_message(:attribute)

        expect(errors).to_not have_received._generate_message(
          :attribute, :invalid, {}
        )
      end

      it 'returns a hash with message and meta keys' do
        error_hash = errors.generate_message :attribute

        expect(error_hash).to be_instance_of Hash
        expect(error_hash).to have_key :message
        expect(error_hash).to have_key :meta
      end

      it 'returns the type as message' do
        error_hash = errors.generate_message :attribute, :custom_error

        expect(error_hash[:message]).to eq :custom_error
      end

      it 'returns passed options as meta' do
        error_hash = errors.generate_message :attribute, :invalid, { :count => 2 }

        expect(error_hash[:meta]).to have_key :count
        expect(error_hash[:meta][:count]).to eq 2
      end
    end
  end

end

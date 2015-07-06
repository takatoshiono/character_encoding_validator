require 'spec_helper'

describe CharacterEncodingValidator do
  describe '#validate' do
    let(:model_class) {
      _encoding = encoding
      Struct.new(:attr) do
        include ActiveModel::Validations
        def self.name
          'DummyModel'
        end
        def attributes
          to_h
        end
        validates_with CharacterEncodingValidator, encoding: _encoding
      end
    }

    subject { model_class.new(attr) }

    context 'when encoding is eucjp-ms' do
      let(:encoding) { 'eucjp-ms' }

      context 'when not include unencodable characters' do
        let(:attr) { 'あいうえお' }
        it { is_expected.to be_valid }
      end

      context 'when include unencodable characters' do
        describe '〜 (U+301C WAVE DASH)' do
          let(:attr) { "あいう\u{301C}えお" }
          it { is_expected.not_to be_valid }
        end

        describe '− (U+2212 MINUS SIGN)' do
          let(:attr) { "あいう\u{2212}えお" }
          it { is_expected.not_to be_valid }
        end

        describe ':curry: (U+1F35B CURRY AND RICE)' do
          let(:attr) { "あいう\u{1F35B}えお" }
          it { is_expected.not_to be_valid }
        end
      end

      context 'when it is a number' do
        let(:attr) { 12345 }
        it { is_expected.to be_valid }
      end
    end
  end
end

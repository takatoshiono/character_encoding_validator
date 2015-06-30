class CharacterEncodingValidator < ActiveModel::Validator
  def validate(record)
    record.attributes.each do |attribute, value|
      next unless value.is_a?(String)
      begin
        value.encode(options[:encoding])
      rescue Encoding::UndefinedConversionError => e
        record.errors.add(attribute, :undefined_conversion)
      rescue Encoding::InvalidByteSequenceError => e
        record.errors.add(attribute, :invalid_byte_sequence)
      end
    end
  end
end

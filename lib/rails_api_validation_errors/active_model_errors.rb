# Monkey patch ActiveModel::Errors class to return a hash containing translation
# key and options if translation is missing.
module ActiveModel
  class Errors

    # Option to specify wether to return hash or translation. Defaults to true
    # to keep original behaviour.
    @@translate_message = true

    def self.disable_translations
      @@translate_message = false
    end

    def self.enable_translations
      @@translate_message = true
    end

    # Keep original method
    alias _generate_message generate_message

    def generate_message(attribute, type = :invalid, options = {})
      if @@translate_message
        _generate_message(attribute, type, options)
      else
        type = options.delete(:message) if options[:message].is_a?(Symbol)

        { :message => type, :meta => options }
      end
    end

  end
end

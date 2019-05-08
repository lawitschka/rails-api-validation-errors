module Rails::API::HashValidationErrors

  def self.included(base)
    base.send :around_action, :use_hash_validation_errors
  end

  def use_hash_validation_errors(&block)
    ActiveModel::Errors.disable_translations
    yield
  ensure
    ActiveModel::Errors.enable_translations
  end

end

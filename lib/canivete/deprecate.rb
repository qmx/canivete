module Canivete
  module Deprecate
    def self.included(base)
      base.extend Deprecate
    end

    def method_added(method_name)
      unless @_deprecation_options.nil?
        module_eval <<END
          alias_method :deprecated_#{method_name}, :#{method_name}
          def #{method_name}(*args, &block)
            warn "#{build_message(method_name)}"
            deprecated_#{method_name}(*args, &block)
          end
END
      end
      super
    end

    def deprecate(opts = {})
      @_deprecation_options = opts
    end

    private

    def build_message(method_name)
      msg = "Warning: calling deprecated method #{self}.#{method_name}."
      msg += " Use #{compute_new_method}." unless new_method.nil?
      @_deprecation_options = nil
      return msg
    end

    def compute_new_method
      if new_method.class.eql? Symbol
        "#{class_for_new_method}##{new_method}"
      else
        new_method
      end
    end

    def new_method
      @_deprecation_options[:for]
    end

    def class_for_new_method
      @_deprecation_options[:on] || self
    end
  end
end

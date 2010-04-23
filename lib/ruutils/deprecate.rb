module RUUtils

	module Deprecate

		def self.included(base)
			base.extend(Deprecate)
		end

		def method_added(methodName)
			if self.instance_variable_get(:@_deprecate_it) != nil
				puts "#{methodName} will be redefined"
				self.instance_variable_set(:@_deprecate_it, nil)
				module_eval <<END
					alias_method :deprecated_#{methodName}, :#{methodName}
					def #{methodName}(*args, &block)
						warn "Warning: calling deprecated method #{self}.#{methodName}"
						deprecated_#{methodName}(*args, &block)
					end
END
			end
			super
		end

		def deprecate
			self.instance_variable_set :@_deprecate_it, true
		end

	end
end

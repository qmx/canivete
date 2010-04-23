module Canivete

	module Deprecate

		def self.included(base)
			base.extend(Deprecate)
		end

		def method_added(method_name)
			if self.instance_variable_get(:@_deprecate_it) != nil
				puts "#{method_name} will be redefined"
				self.instance_variable_set(:@_deprecate_it, nil)
				module_eval <<END
					alias_method :deprecated_#{method_name}, :#{method_name}
					def #{method_name}(*args, &block)
						warn "Warning: calling deprecated method #{self}.#{method_name}"
						deprecated_#{method_name}(*args, &block)
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

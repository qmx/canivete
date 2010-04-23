# RUUtils - Ruby Ultimate Utilities

Basically this gem provides you with a very handy set of utilities. Currently, only the deprecate functionality is included

Instructions:

		gem install ruutils

		require  'ruutils/deprecate'

		class Test
			include RUUtils::Deprecate

			deprecate
			def soon_to_die_method
				puts "goodbye"
			end
		end

		Test.new.soon_to_die_method
		Warning: calling deprecated method Test.soon_to_die_method


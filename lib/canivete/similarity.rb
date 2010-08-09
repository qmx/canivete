require 'text'
module Canivete
	module Similarity
		def similarity_rate(target_string, options = {:ignore_case => true})
			src = self.dup
			tgt = target_string.dup

			if options[:ignore_case]
				src.downcase!
				tgt.downcase!
			end

			return 0 if (src.length == 0 && tgt.length != 0)
			return 1 if (src.length == 0 && tgt.length == 0)
			distance = Text::Levenshtein.distance(src, tgt)
			rate = 1 - (distance/src.length.to_f) unless src.length == 0
			rate < 0.0 ? 0.0 : rate
		end
	end
end

require 'text'
module Canivete
	module Similarity
		def similarity_rate(tgt)
			return 0 if (self.length == 0 && tgt.length != 0)
			return 1 if (self.length == 0 && tgt.length == 0)
			distance = Text::Levenshtein.distance(self, tgt)
			1 - (distance/self.length.to_f) unless self.length == 0
		end
	end
end

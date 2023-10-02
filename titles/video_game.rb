# frozen_string_literal: true

##
##
##
###### ---------------- List of features/data avialable to extract -----------------------
###    All features are available from Base class

##
##
##

# features exclusive to Video Game title type
module VideoGame
  # remove duration instance method as its not relevant for the game object
  def self.extended(obj)
    obj.class.instance_eval do
      undef_method :duration
    end
  end
end

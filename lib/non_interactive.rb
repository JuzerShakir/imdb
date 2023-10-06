# frozen_string_literal: true

##
##
##
###### ---------------- List of features/data avialable to extract -----------------------
###    All features are available from Base class

##  1. duration
##
##

# features exclusive to Movies, Tv-Shows & Episode media type
module NonInteractive
  # returns runtime of the media
  def duration
    inspect_this document.css("li[data-testid=title-techspec_runtime] div").text
  end

  # define streaming_on method that returns on which platform the media is streaming
end

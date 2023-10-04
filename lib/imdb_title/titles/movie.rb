# frozen_string_literal: true

##
##
##
###### ---------------- List of features/data avialable to extract -----------------------
###    All features are available from Base class

#### ------- BOX OFFICE ---------
###   12. Budget
###   13. Gross Worldwide (Revenue)
##
##
##

# features exclusive to Movie title type
module Movie
  # returns budget price of the movie
  def budget
    document.css("li[data-testid=title-boxoffice-budget] div").text[/\$\S+/]
  end

  # returns revenue price of the movie
  def revenue
    inspect_this document.css("li[data-testid=title-boxoffice-cumulativeworldwidegross] div").text
  end
end

# frozen_string_literal: true

##
##
##
###### ---------------- List of features/data avialable to extract -----------------------
###    All features are available from Title class
#### ------- BOX OFFICE ---------
###   12. Budget
###   13. Gross Worldwide (Revenue)
##
##
##

# features exclusive to Movie media type
module Movie
  prepend NonInteractive

  # its budget (String)
  def budget
    document.css("li[data-testid=title-boxoffice-budget] div").text[/\$\S+/]
  end

  # its revenue (String)
  def revenue
    inspect_this document.css("li[data-testid=title-boxoffice-cumulativeworldwidegross] div").text
  end
end

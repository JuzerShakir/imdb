# frozen_string_literal: true

##
##
##
###### ---------------- List of features/data available to extract -----------------------
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

  # budget (String)
  def budget
    document.css("li[data-testid=title-boxoffice-budget] div").text[/\$\S+/]
  end

  # revenue / Gross Worldwide (String)
  def revenue
    document.css("li[data-testid=title-boxoffice-cumulativeworldwidegross] div").first&.text
  end
end

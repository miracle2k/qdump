# Methods added to this helper will be available to all templates in the application.
module ApplicationHelper
  # convert new lines to html line breaks
  def nl2br(string)
    string.gsub("\n", '<br/>')
  end 
end

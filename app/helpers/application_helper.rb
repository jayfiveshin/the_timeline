module ApplicationHelper
  # Returns title of the webpage
  def title
    base_title = "Timeline"
    if @title.blank?
      base_title
    else
      "#{base_title} | #{@title}"
    end
  end
  
end

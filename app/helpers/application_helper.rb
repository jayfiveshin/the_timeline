module ApplicationHelper
  # Returns title of the webpage
  def title
    base_title = "Konnect"
    if @title.blank?
      base_title
    else
      "#{base_title} | #{@title}"
    end
  end
  
  def date
    Time.now()
  end
end

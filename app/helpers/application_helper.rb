module ApplicationHelper

  # Return a title on a per-page basis.
  def title
    base_title = "TimeLine"
    if @title.nil?
      base_title
    else
      "#{base_title} | #{@title}"
    end
  end #of title
  
  def logo
    image_tag("timeline_logo.jpg",  :alt => "Timeline", 
                                    :class => "round",
                                    :size => "102x30")
  end #of logo
  
  def light 
    image_tag("light.jpg",  :alt => "Light",
                            :class  => "round",
                            :id => "light",
                            :size => "150x200")
  end
  
  def joonha 
    image_tag("joonha.jpg", :alt => "Joonha",
                            :class  => "round",
                            :id => "joonha",
                            :size => "150x196")
  end
  
  # Returns "a" or "an", depending on the input.
  # ex: a_or_an("apple") will return "an apple", whereas
  #     a_or_an("child") will return "a child".
  def a_or_an(word)
    word = word.strip
    if %w{a e i o u A E I O U}.include? word[0..0].to_s
      "an #{word}"
    else
      "a #{word}"
    end
  end #of a_or_an
                
end #of ApplicationHelper

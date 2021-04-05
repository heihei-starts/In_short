module ApplicationHelper

  def full_title (page_title = "") 
    base_title = "In_Short"
    
    if page_title.empty?
      base_title
    else
      page_title + "_page"
    end
  end
end

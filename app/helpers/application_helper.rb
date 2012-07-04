module ApplicationHelper

  # Returns the full title on a per-page basis.
  def full_title(page_title)
    base_title = "Sohei Okamoto's Home"
    if page_title.empty?
      base_title
    else
      "#{base_title} | #{page_title}"
    end
  end
  
  def check_box_image(boolean)
    image_tag "check-box-#{boolean}.png", class: "check-box-image", alt: boolean
  end
  
end

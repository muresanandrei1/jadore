module ApplicationHelper
  def add_page_class(path, page)
    if current_page?(path)
      return page
    end
  end
end

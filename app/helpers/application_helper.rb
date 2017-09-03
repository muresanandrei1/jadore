module ApplicationHelper
  def add_pool_class
    if current_page?(pools_path)
      return 'pool-page'
    end
  end
end

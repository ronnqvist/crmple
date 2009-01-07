module LayoutHelper
  def masthead(content)
    content_for(:masthead) { content }
  end
  
  def navigation(content = nil)
    if block_given?
      content_for(:navigation) { yield }
    else
      content_for(:navigation) { content } unless content.nil?
    end
  end
end
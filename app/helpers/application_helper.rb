module ApplicationHelper
  def render_markdown(message)
    Kramdown::Document.new(message, input: 'GFM', syntax_highlighter: "rouge").to_html
  end
end

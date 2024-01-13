require 'redcarpet'

class WikiToStorage
  def self.retrieve_wiki_pages
    # Logic to retrieve wiki pages from Redmine
    WikiPage.all
  end

  def self.format_content_for_storage(content)
    # Logic to format the content, for example, converting HTML to Markdown
    markdown = Redcarpet::Markdown.new(Redcarpet::Render::HTML, autolink: true, tables: true)
    formatted_content = markdown.render(content)
    # Any additional formatting or processing can be done here
    formatted_content
  end
end

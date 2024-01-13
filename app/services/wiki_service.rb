class WikiService
  def self.create_or_update_wiki_page(title, content)
    markdown_content = Redcarpet::Markdown.new(Redcarpet::Render::HTML, autolink: true, tables: true).render(content)
    ObjectStorageService.create_or_update_wiki_page(title, markdown_content)
    # Additional logic if needed, e.g., updating Redmine's wiki index
  end
end

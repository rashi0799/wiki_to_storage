# Example in WikiController (app/controllers/wiki_controller.rb)

class WikiController < ApplicationController
  def create
    # Logic to create a new wiki page
    title = params[:title]
    content = params[:content]

    WikiToStorage.create_or_update_wiki_page(title, content)

    # Additional logic if needed, e.g., rendering a view or redirecting
  end

  def update
    # Logic to update an existing wiki page
    title = params[:title]
    content = params[:content]

    WikiToStorage.create_or_update_wiki_page(title, content)

    # Additional logic if needed, e.g., rendering a view or redirecting
  end
end


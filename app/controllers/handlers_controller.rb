class HandlersController < ApplicationController
  def index
    @urban_terms = []
    @urban_terms << UrbanTerms.new(title: 'Da Vinci Code', description: 'Dan Brown')
    @urban_terms << UrbanTerms.new(title: 'Name of the Rose', description: 'Umberto Eco')
  end
end

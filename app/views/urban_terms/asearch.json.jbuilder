json.array!(@urban_terms) do |urban_term|
  json.title        urban_term.title
  json.urban_term      urban_term.description
  json.inaction         urban_term.inaction
  json.url urban_term_url(urban_term, format: :html)
  json.id   urban_term.id

  #json.published_at post.published_at.strftime('%B %Y')
  json.image_url    urban_term.urbantermcover.url(:small)



end

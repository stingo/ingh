json.hows do
  json.array!(@hows) do |how|
    json.title how.title
    json.url how_path(how)
  end
end

json.urban_terms do
  json.array!(@urban_terms) do |urban_term|
    json.title urban_term.title
    json.url urban_term_path(urban_term)
  end
end




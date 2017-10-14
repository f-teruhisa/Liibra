# Top
crumb :root do
  link "Home", root_path
end

# Genre
crumb :genre do
  link "Genre",genres_path
  parent :root
end

# User
crumb :user do
  link "User Page"
  parent :root
end

crumb :user_edit do
  link "User Edit"
  parent :root
end

# Theme
crumb :theme_index do
  link "Theme",genre_themes_path
  parent :genre
end

crumb :theme_choose do
  link "Choose","/genres/#{params[:genre_id]}/themes/show"
  parent :theme_index
end

crumb :theme_registration do
  link "Registration", new_genre_theme_path
  parent :theme_index
end

crumb :theme_search do
  link "Search", search_genre_themes_path
  parent :theme_index
end

# Rate
crumb :rate do
  link "Rate",genre_theme_rates_path
  parent :theme_choose
end

def select_books_titles_and_years_in_first_series_order_by_year
  query = <<-SQL
      SELECT books.title, books.year
      FROM books
      JOIN series
      ON books.series_id = series.id
      WHERE series_id = 1
      ORDER BY books.year;
      SQL
    query
  end

def select_name_and_motto_of_char_with_longest_motto
  query = <<-SQL
      SELECT name, motto
      FROM characters
      ORDER BY LENGTH(motto) DESC
      LIMIT 1;
      SQL
    query
end

def select_value_and_count_of_most_prolific_species
  query = <<-SQL
      SELECT species, COUNT(species)
      FROM characters
      GROUP BY species
      ORDER BY species DESC
      LIMIT 1;
      SQL
    query
end

def select_name_and_series_subgenres_of_authors
  query = <<-SQL
      SELECT authors.name, subgenres.name
      FROM (authors JOIN series ON series.author_id = authors.id)
      JOIN subgenres ON series.subgenre_id = subgenres.id;
      SQL
    query
end

def select_series_title_with_most_human_characters
  query = <<-SQL
      SELECT series.title
      FROM characters
      JOIN series ON series.id = characters.series_id
      WHERE characters.species = "human"
      ORDER BY characters.species DESC
      LIMIT 1;
      SQL
    query
end

def select_character_names_and_number_of_books_they_are_in
  query = <<-SQL
      SELECT characters.name, COUNT(*)
      FROM characters
      JOIN character_books
      ON character_books.character_id = characters.id
      GROUP BY characters.name
      ORDER BY COUNT(*) DESC;
      SQL
    query
end

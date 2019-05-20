if @smallCategories.present?
  json.array! @smallCategories do |smallCategory|
    json.id smallCategory.id
    json.name smallCategory.name
    json.ancestry smallCategory.ancestry
  end
elsif @midCategories.present?
  json.array! @midCategories do |midCategory|
    json.id midCategory.id
    json.name midCategory.name
    json.ancestry midCategory.ancestry
  end
end


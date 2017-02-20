json.array! @companies do |company|
  json.id       company.id
  json.logo     company.logo.url
  json.name     company.name
  json.status   company.status
  json.website  company.website
  json.location company.location_info
  json.coordinates company.get_coordinates
  if params[:with_locations_near]
    json.distance company.get_distance(params[:with_locations_near][0])
  end
end

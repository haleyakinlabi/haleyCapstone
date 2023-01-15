# frozen_string_literal: true

json.links do
  json.self pagy_url_for(pagy, pagy.page)
  json.next pagy_url_for(pagy, pagy.next) if pagy.next
  json.prev pagy_url_for(pagy, pagy.prev) if pagy.prev
  json.first pagy_url_for(pagy, 1)
  json.last pagy_url_for(pagy, pagy.last)
end
json.page pagy.page
json.per_page pagy.items
json.total_pages pagy.pages
json.total_items pagy.count

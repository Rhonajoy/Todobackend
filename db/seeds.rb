puts "🌱 Seeding spices..."

# Seed your database here
ids = 1..9
ids.each do |id|
  response = RestClient.get "https://jsonplaceholder.typicode.com/posts/#{id}"
  post_hash = JSON.parse(response)

  Note.create(
    title: post_hash["title"],
    description: post_hash["body"],
  )
end

puts "✅ Done seeding!"

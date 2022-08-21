def generate_items
  puts 'generate keywords...'
  titles = ["포켓몬 빵", "맥북프로16인치", "형광등", "향수"]
  titles.each do |title|
    Item.create(name: title, count: 100, price: rand(1000..10000))
    puts "create #{title}"
  end
end



generate_items if Item.first.blank?
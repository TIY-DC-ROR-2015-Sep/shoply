namespace :fake do

  desc "Generate fake products"
  task :products => :environment do
    10.times do
      Product.create!(
        name: Faker::Commerce.product_name,
        price_in_cents: rand(1 .. 1_000_000),
        description: Faker::Lorem.paragraph
      )
    end
    puts "There are now #{Product.count} products"
  end

  desc "Generate users"
  task :users => :environment do
    5.times do
      User.create!(
        email: Faker::Internet.email,
        password: "password"
      )
    end
    puts "There are now #{User.count} users"
  end

  desc "Generate purchases"
  task :purchases => [:users, :products] do
    products = Product.all
    users    = User.all

    10.times do
      u = users.sample
      purchase = u.purchases.create!

      product_count = rand(1..5)
      bought_products = products.sample product_count
      bought_products.each do |p|
        purchase.product_purchases.create!(
          product:  p,
          quantity: rand(1..3)
        )
      end
    end
  end

  task :clear => :environment do
    [User, Product, ProductPurchase, Purchase].each do |klass|
      klass.delete_all
    end
  end

  desc "Generate new fake data for everything"
  task :all => [:clear, :purchases] do
  end

end

task :fake => "fake:all"

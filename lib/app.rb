require 'json'

  # Grabs info from JSON file and sets up report file to export to.
def setup_files
path = File.join(File.dirname(__FILE__), '../data/products.json')
file = File.read(path)
# Made products_hash a global variable.
$products_hash = JSON.parse(file)
# Made report_file a global variable.
$report_file = File.new("report.txt", "w+")
end

def create_report
  print_product_data
  print_brand_data
end

# Print today's date
def print_todays_date
  t = Time.now
  return "#{t.month}/#{t.day}/#{t.year}"
end

  # Print "Sales Report" in ascii art
  def print_sales_title
    $report_file.puts "  _____       _             _____                       _"
    $report_file.puts " / ____|     | |           |  __ \\                     | |"
    $report_file.puts "| (___   __ _| | ___  ___  | |__) |___ _ __   ___  _ __| |_ "
    $report_file.puts " \\___ \\ / _` | |/ _ \\/ __| |  _  // _ \\ '_ \\ / _ \\| '__| __|"
    $report_file.puts " ____) | (_| | |  __/\\__ \\ | | \\ \\  __/ |_) | (_) | |  | |_"
    $report_file.puts "|_____/ \\__,_|_|\\___||___/ |_|  \\_\\___| .__/ \\___/|_|   \\__|"
    $report_file.puts "                                      | |                   "
    $report_file.puts "                                      |_|                   "
  end

def line
  "*" * 40
end

def space
  puts
end

# Gathers product data
def product_data(product)
  print_toy_name(product) + "\n" +
  print_retail_price(product) + "\n" +
  print_total_purchases(product) + "\n" +
  print_total_sales(product) + "\n" +
  average_price(product) + "\n" +
  print_average_discount_dollar(product) + "\n" +
  print_average_discount_percent(product)
end

# Prints product data
def print_product_data
  print_sales_title
  $report_file.puts print_todays_date
  print_product_title
  $report_file.puts space
  $products_hash["items"].each do |product|
    $report_file.puts line
    $report_file.puts product_data(product)
    $report_file.puts line
    $report_file.puts space
  end
end
  # Print "Products" in ascii art
  def print_product_title
    $report_file.puts " _____               _            _"
    $report_file.puts "|  __ \\             | |          | |"
    $report_file.puts "| |__) | __ ___   __| |_   _  ___| |_ ___"
    $report_file.puts "|  ___/ '__/ _ \\ / _` | | | |/ __| __/ __|"
    $report_file.puts "| |   | | | (_) | (_| | |_| | (__| |_\\__ \\"
    $report_file.puts "|_|   |_|  \\___/ \\__,_|\\__,_|\\___|\\__|___/"
  end

  # For each product in the data set:
  	# Get the name of the toy
    def print_toy_name(product)
      product["title"]
    end

    # Get the retail price of the toy
    def retail_price(product)
      product["full-price"].to_f
    end

    def print_retail_price(product)
      "Retail Price: $#{retail_price(product)}"
    end
  	# Calculate and print the total number of purchases
    def total_purchases(product)
      product["purchases"].length
    end

    def print_total_purchases(product)
      "Total Purchases: #{total_purchases(product)}"
    end

  	# Calculate and print the total amount of sales
    def total_sales(product)
      total = 0
      product["purchases"].each do |sale|
        sale_price = sale["price"].to_f
        total = sale_price + total
      end
      return total
    end

    def print_total_sales(product)
      return "Total Sales: $#{total_sales(product)}"
    end

    def print_total_sales(product)
      return "Total Sales: $#{total_sales(product)}"
    end

  	# Calculate and print the average price the toy sold for
    def average_price_calulator(product)
      total = 0
      product["purchases"].each do |sale|
        sale_price = sale["price"].to_f
        total = sale_price + total
      end
      purchases = product["purchases"].length
      total / purchases
    end

    def average_price(product)
      return "Average Price: #{average_price_calulator(product)}"
    end

  	# Calculate and print the average discount (% or $) based off the average sales price
    def average_discount_dollar_calculator(product)
      return ((retail_price(product) * total_purchases(product)) - total_sales(product)) / total_purchases(product)
    end

    def average_discount_percent_calculator(product)
      avergae_discount_percent = average_discount_dollar_calculator(product) / (retail_price(product) / 100)
      avergae_discount_percent = avergae_discount_percent.round(2)
    end

    def print_average_discount_dollar(product)
      return "Average Discount $#{average_discount_dollar_calculator(product)}"
    end

    def print_average_discount_percent(product)
      return "Average Discount Percentage: #{average_discount_percent_calculator(product)}%"
    end


  # Print "Brands" in ascii art
  def print_brands_title
  $report_file.puts "|  _ \\                    | |"
  $report_file.puts "| |_) |_ __ __ _ _ __   __| |___"
  $report_file.puts "|  _ <| '__/ _` | '_ \\ / _` / __|"
  $report_file.puts "| |_) | | | (_| | | | | (_| \\__ \\"
  $report_file.puts "|____/|_|  \\__,_|_| |_|\\__,_|___/"
  end

  def brand_data(brand)
    print_brand_name(brand)
    print_stock(brand)
  end

  def print_brand_data
    print_brands_title
    $products_hash["items"].each do |brand|
      $report_file.puts line if brand["stock"] > 0
      $report_file.puts brand_data(brand)
      $report_file.puts line if brand["stock"] > 0
      $report_file.puts space if brand["stock"] > 0
    end
  end

  # For each brand in the data set:
  # Print the name of the
  def get_brand_name(brand)
    brand["brand"]
  end

  def print_brand_name(brand)
    if brand["stock"] > 0
      $report_file.puts get_brand_name(brand)
    end
  end

  # Count and print the number of the brand's toys we stock
  def get_stock(brand)
    current_brand = brand["brand"]
    stock = []
    total_brand_stock = 0
    $products_hash["items"].each do |same|
      if current_brand == same["brand"]
        stock << same["stock"].to_i
      end
    end
    stock.each do |add|
      total_brand_stock += add
    end
    return stock
  end

  # def count_stock(brand)
  #   stock = get_stock(brand)
  #   total_brand_stock = 0
  #   stock.each do |add|
  #     total_brand_stock += add
  #   end
  # end

  def print_stock(brand)
    $report_file.puts "Number of Products: #{get_stock(brand)}"
  end

  	# Calculate and print the average price of the brand's toys
  	# Calculate and print the total sales volume of all the brand's toys combined

    def start
      setup_files
      create_report
    end

start

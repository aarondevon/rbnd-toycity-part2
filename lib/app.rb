require 'json'
def start

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
    # Print today's date
    def print_todays_date
      t = Time.now
      puts "#{t.month}/#{t.day}/#{t.year}"
    end
    # Print "Sales Report" in ascii art
    def print_sales_title
      puts "  _____       _             _____                       _"
      puts " / ____|     | |           |  __ \\                     | |"
      puts "| (___   __ _| | ___  ___  | |__) |___ _ __   ___  _ __| |_ "
      puts " \\___ \\ / _` | |/ _ \\/ __| |  _  // _ \\ '_ \\ / _ \\| '__| __|"
      puts " ____) | (_| | |  __/\\__ \\ | | \\ \\  __/ |_) | (_) | |  | |_"
      puts "|_____/ \\__,_|_|\\___||___/ |_|  \\_\\___| .__/ \\___/|_|   \\__|"
      puts "                                      | |                   "
      puts "                                      |_|                   "
    end
    # Print "Products" in ascii art
    def print_product_title
      puts " _____               _            _"
      puts "|  __ \\             | |          | |"
      puts "| |__) | __ ___   __| |_   _  ___| |_ ___"
      puts "|  ___/ '__/ _ \\ / _` | | | |/ __| __/ __|"
      puts "| |   | | | (_) | (_| | |_| | (__| |_\\__ \\"
      puts "|_|   |_|  \\___/ \\__,_|\\__,_|\\___|\\__|___/"
    end
    # For each product in the data set:
    	# Print the name of the toy
    	# Print the retail price of the toy
    	# Calculate and print the total number of purchases
    	# Calculate and print the total amount of sales
    	# Calculate and print the average price the toy sold for
    	# Calculate and print the average discount (% or $) based off the average sales price


    # Print "Brands" in ascii art
    def print_brands_title
    puts "|  _ \\                    | |"
    puts "| |_) |_ __ __ _ _ __   __| |___"
    puts "|  _ <| '__/ _` | '_ \\ / _` / __|"
    puts "| |_) | | | (_| | | | | (_| \\__ \\"
    puts "|____/|_|  \\__,_|_| |_|\\__,_|___/"
    end
    # For each brand in the data set:
    	# Print the name of the brand
    	# Count and print the number of the brand's toys we stock
    	# Calculate and print the average price of the brand's toys
    	# Calculate and print the total sales volume of all the brand's toys combined

      print_sales_title
      print_product_title
      print_brands_title
  end
  create_report
end

start

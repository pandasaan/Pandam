module ItemsHelper

  def stock_array_maker(stock)

    current_stock_array = []
    stocks.current_stock.times do |quantity|
      if quantity < 10
        current_stock_array += quantity + 1
      else
        break
      end
    end
    current_stock_array

  end
end

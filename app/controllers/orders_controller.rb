class OrdersController < ApplicationController
  def create
    # begin
    #   item = Item.find(params[:item_id])
    #   block_result = $lock_manager.lock!("items#{item.id}", 2000) do
    #     if item.count > 0
    #       puts "Item #{item.id} remain #{item.count}"
    #       item.decrement!(:count)
    #       item.save          
    #     else
    #       puts "Item #{item.id} is out of stock"
    #     end
    #   end
    # rescue Redlock::LockError
    #   puts "lock error"
    # end

    item = Item.find(params[:item_id])
    if item.count > 0
      puts "item.count #{item.count}"
      item.decrement!(:count)
      item.save
    else
      puts "item.count 0"
    end
    render json: item
  end
end

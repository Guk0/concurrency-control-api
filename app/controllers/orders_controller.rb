class OrdersController < ApplicationController
  def create
    # begin
    #   block_result = $lock_manager.lock!("items#{params[:item_id]}", 2000) do
    #     item = Item.find(params[:item_id])
    #     item.decrement!(:count)
    #     item.save
    #   end
    # rescue Redlock::LockError
      
    # end

    item = Item.find(params[:item_id])
    item.decrement!(:count)
    item.save
    render json: item
  end
end

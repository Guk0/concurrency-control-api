class OrdersController < ApplicationController
  def create
    $redlock_logger.info "get request"
    begin
      block_result = $lock_manager.lock!("items#{params[:item_id]}", 2000) do
        item = Item.find(params[:item_id])
        if item.count > 0          
          item.update(count: item.count - 1)
          $redlock_logger.info "Item #{item.id} remain #{item.count}"
        else
          $redlock_logger.info "Item #{item.id} is out of stock"
        end
      end
    rescue Redlock::LockError => e
      $redlock_logger.info "lock error"
    end

    # item = Item.find(params[:item_id])
    # if item.count > 0
    #   $redlock_logger.info "Item #{item.id} remain #{item.count}"
    #   item.update(count: item.count - 1)
    # else
    #   $redlock_logger.info "Item #{item.id} is out of stock"
    # end
    # render json: item
  end
end

module CartsHelper
    def init(cart)
      cookies.permanent[:cart_id] = cart.id
       @current_cart = cart
    end
    def delete
        cookies.delete(:cart_id)
        @current_cart = nil
    end
    def current_cart
        @current_cart = cart_from_id 
    end
private
	def cart_from_id
		Cart.find_by_id(cookies[:cart_id])
	end
end

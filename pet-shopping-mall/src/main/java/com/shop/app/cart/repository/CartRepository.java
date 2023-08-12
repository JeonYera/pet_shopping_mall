package com.shop.app.cart.repository;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;

import com.shop.app.cart.dto.CartDto;
import com.shop.app.cart.entity.CartItem;

@Mapper
public interface CartRepository {

	@Select("select * from cart_item i left join cart c on i.cartitem_id = c.cartitem_id where c.member_id = #{memberId}")
	List<CartItem> getCartList(String memberId);

}
package com.leo.ssmschoolshop.service;


import com.leo.ssmschoolshop.entity.ShopCart;
import com.leo.ssmschoolshop.entity.ShopCartExample;
import com.leo.ssmschoolshop.entity.ShopCartKey;

import java.util.List;

public interface ShopCartService {
    public void addShopCart(ShopCart shopCart);

    public List<ShopCart> selectByExample(ShopCartExample shopCartExample);

    public void deleteByKey(ShopCartKey shopCartKey);

    public void updateCartByKey(ShopCart shopCart);

    public ShopCart selectCartByKey(ShopCartKey shopCartKey);
}

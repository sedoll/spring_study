package kr.ed.haebeop.service;

import kr.ed.haebeop.domain.CartVO;
import kr.ed.haebeop.persistence.CartMapper;
import org.springframework.beans.factory.annotation.Autowired;

import java.util.List;

public class CartServiceImpl implements CartService {
    @Autowired
    private CartMapper cartMapper;
    public List<CartVO> getCartListByCustomerId(String cid) throws Exception {
        return cartMapper.getByIdCartList(cid);
    }

    @Override
    public int getCountCart(String cid) throws Exception {
        return cartMapper.cartCnt(cid);
    }

    @Override
    public void addCart(String cid, int pno) throws Exception {
        cartMapper.cartInsert(cid, pno);
    }

    @Override
    public void deleteCart(int cartno) throws Exception {
        cartMapper.cartDelete(cartno);
    }
}

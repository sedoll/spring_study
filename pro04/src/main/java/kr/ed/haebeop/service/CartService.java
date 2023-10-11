package kr.ed.haebeop.service;

import kr.ed.haebeop.domain.CartVO;
import kr.ed.haebeop.persistence.CartMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

public interface CartService {

    public List<CartVO> getCartListByCustomerId(String cid) throws Exception;

    public int getCountCart(String cid) throws Exception;

    public void addCart(String cid, int pno) throws Exception;

    public void deleteCart(int cartno) throws Exception;
}

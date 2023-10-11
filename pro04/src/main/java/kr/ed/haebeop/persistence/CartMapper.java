package kr.ed.haebeop.persistence;

import kr.ed.haebeop.domain.Cart;
import kr.ed.haebeop.domain.CartVO;
import org.apache.ibatis.annotations.*;

import java.util.List;

@Mapper
public interface CartMapper {
    @Select("SELECT * FROM cart WHERE cid = #{cid} AND pno = #{pno}")
    public Cart cartDetail(Cart cart);
    @Insert("INSERT INTO cart (cid, pno, amount) VALUES (#{cid}, #{pno}, 1)")
    @Options(useGeneratedKeys=true, keyProperty="cartno")
    public void cartInsert(String cid, int pno);
    @Delete("DELETE FROM cart WHERE cartno = #{cartno}")
    public void cartDelete(int cartno);
    @Select("SELECT * FROM cart WHERE cart.cid = #{cid}")
    public List<CartVO> getByIdCartList(String cid);
    @Select("SELECT COUNT(*) FROM cart WHERE cid = #{id}")
    public int cartCnt(String id);
    public String getCusName(String id);
    public String getPname(String id);
}

package kr.ed.haebeop.persistence;

import kr.ed.haebeop.domain.Product;
import org.apache.ibatis.annotations.*;

import java.util.List;

@Mapper
public interface ProductMapper {
    @Select("SELECT * FROM product")
    public List<Product> getProductList();
    @Select("SELECT * FROM product WHERE cate IN (#{cate1}, #{cate2}, #{cate3}, #{cate4})")
    public List<Product> getCateProductListSchool(String cate1, String cate2, String cate3, String cate4);
    @Select("SELECT * FROM product WHERE cate = #{cate}")
    public List<Product> getCateProductList(String cate);
    @Select("SELECT * FROM product WHERE no = #{no}")
    public Product getProduct(int no);
    @Insert("INSERT INTO product (cate, cateno, pname, pcomment, plist, price, imgsrc1, imgsrc2, imgsrc3, resdate) VALUES (#{cate}, 1, #{pname}, #{pcomment}, #{plist}, #{price}, #{imgSrc1}, #{imgSrc2}, #{imgSrc3}, default)")
    @Options(useGeneratedKeys=true, keyProperty="no")
    public int addProduct(Product pro);
    @Update("UPDATE product SET cate = #{cate}, pname = #{pname}, pcomment = #{pcomment}, plist = #{plist}, price = #{price}, imgsrc1 = #{imgSrc1}, resdate = #{resdate} WHERE no = #{no}")
    public int updateProduct(Product pro);
    @Delete("DELETE FROM product WHERE no = #{no}")
    public int delProduct(int no);
    @Select("SELECT * FROM product ORDER BY price DESC")
    public List<Product> getProductListBest();
    @Select("SELECT * FROM product ORDER BY resdate DESC")
    public List<Product> getProductListNew();
}

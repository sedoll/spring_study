package kr.ed.haebeop.service;

import kr.ed.haebeop.domain.Product;
import kr.ed.haebeop.persistence.ProductMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class ProductServiceImpl {

    @Autowired
    private ProductMapper productMapper;
    public List<Product> getProductList() {
        return productMapper.getProductList();
    }

    public List<Product> getCateProductList(String cate) {
        return productMapper.getCateProductList(cate);
    }

    public List<Product> getCateProductListSchool(String cate1, String cate2, String cate3, String cate4) {
        return productMapper.getCateProductListSchool(cate1, cate2, cate3, cate4);
    }

    public Product getProduct(int no) {
        return productMapper.getProduct(no);
    }

    public int addProduct(Product pro) {
        return productMapper.addProduct(pro);
    }

    public int updateProduct(Product pro) {
        return productMapper.updateProduct(pro);
    }

    public int delProduct(int no) {
        return productMapper.delProduct(no);
    }

//    public List<RedirectView> getReviewList(int no) {
//        ReviewDAO dao = new ReviewDAO();
//        return dao.getReviewList(no);
//    }
//
//    public List<Integer> getLikedProductsByUser(String sid) {
//        LikeDAO likeDAO = new LikeDAO();
//        return likeDAO.getLikedProductsByUser(sid);
//    }
//
//    public int getCntCart(String sid) {
//        CartDAO cartDAO = new CartDAO();
//        return cartDAO.cntCart(sid);
//    }
}


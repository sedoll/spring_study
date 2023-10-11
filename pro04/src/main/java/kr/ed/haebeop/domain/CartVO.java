package kr.ed.haebeop.domain;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.ToString;

@Data
@AllArgsConstructor
@NoArgsConstructor
@ToString
public class CartVO {
    private int cartno;     //카트번호
    private String cid;     //고객아이디
    private String name;     //고객명
    private int pno;        //제품번호
    private String pname;   //제품번호
    private String img1; // 제품 이미지
    private int amount;     //제품수량
}

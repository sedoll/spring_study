package kr.ed.haebeop.domain;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.ToString;

@Data
@AllArgsConstructor
@NoArgsConstructor
@ToString
public class Cart {
    private int cartno;     //카트번호
    private String cid;     //고객아이디
    private int pno;        //제품번호
    private int amount;     //제품수량
}

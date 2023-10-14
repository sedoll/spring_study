<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri = "http://java.sun.com/jsp/jstl/functions"%>
<c:set var="path" value="<%=request.getContextPath() %>" />

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>수강 신청</title>
    <%@ include file="../include/head.jsp" %>

    <!-- 결제 api -->
    <script src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>
    <style>
        .hero {
            height: 250px;
            margin-top: 40px;
        }
    </style>
</head>
<body>
<div class="container is-fullhd">
    <!-- 헤더 부분 인클루드 -->
    <jsp:include page="../include/header.jsp"></jsp:include>
    <figure class="visual" id="vs1">
        <ul class="imgbox">
            <li class="hero is-medium is-white">
                <div class="hero-body has-text-centered">
                    <p class="title is-size-3">
                        수강
                    </p>
                    <p class="subtitle is-size-5">
                        신청
                    </p>
                </div>
            </li>
        </ul>
    </figure>
    <div class="content" id="contents">
        <div class="row column text-center">
            <div class="container">
                <form action="${path }/payment/addPayment.do" method="post">
                    <table id="table1">
                        <tbody>
                        <tr>
                            <th class="item1">강의 과목</th>
                            <input type="hidden" name="lec_no" id="no" value="${pro.no }" />
                            <td class="item2" colspan="2">${pro.cate }</td>
                        </tr>
                        <tr>
                            <th class="item1">강의 명</th>
                            <td class="item2" colspan="2">
                                ${pro.title }
                                <input type="hidden" name="lec_name" id="lec_name" value="${pro.title }">
<%--                                <input type="hidden" name="from" id="from" value="${from }">--%>
<%--                                <c:if test="${from.equals('cart')}">--%>
<%--                                    <input type="hidden" name="cartno" id="cartno" value="${cartno }">--%>
<%--                                </c:if>--%>
                            </td>
                        </tr>
                        <tr>
                            <th>강사</th>
                            <td colspan="2">
                                ${inst.name }
                            </td>
                        </tr>
                        <tr>
                            <th>강의 설명</th>
                            <td colspan="2">
                                ${pro.content }
                            </td>
                        </tr>
                        <tr>
                            <th>가격</th>
                            <td colspan="2">
                                <fmt:parseNumber var="price" integerOnly="true" value="${pro.price}" />
                                ${price}
                                <input type="hidden" name="price" id="price" value="${price}">
                            </td>
                        </tr>
                        <tr>
                            <th>남은 수강인원 : ${pro.lec_max - pro.lec}</th>
                            <td colspan="2">
                                <input type="number" name="lec" id="lec" value="1" readonly />
                            </td>
                        </tr>
                        </tbody>
                    </table>
                    <table id="table1">
                        <thead>
                        <tr>
                            <th><h3>결제 정보</h3></th>
                            <input type="hidden" name="id" id="id" value="${member.id }"> <%-- 결제자 id --%>
                            <input type="hidden" name="name" id="name" value="${member.name }">
                            <input type="hidden" name="email" id="email" value="${member.email }">
                            <input type="hidden" name="tel" id="tel" value="${member.tel }">
                        </tr>
                        </thead>
                        <tbody>
                        <tr>
                            <th class="item1">결제 수단</th>
                            <td class="item2" colspan="2">
                                <select name="pmethod" id="pmethod" required>
                                    <option value="신용카드">신용카드</option>
                                    <option value="체크카드">체크카드</option>
                                    <option value="계좌이체">계좌이체</option>
                                </select>
                            </td>
                        </tr>
                        <tr>
                            <th>결제사</th>
                            <td colspan="2">
                                <select name="pcom" id="pcom">
                                    <option value="선택안함">선택안함</option>
                                </select>
                                <input type="hidden" name="pcom2" id="pcom2" value="">
                            </td>
                        </tr>
                        <tr>
                            <th>결제 번호</th>
                            <td colspan="2">
                                <input type="text" name="cnum" id="cnum" required>
                                <input type="hidden" name="payAmount" id="payAmount">
                                <input type="hidden" name="payCk" id="payCk" value="no">
                            </td>
                        </tr>
                        <tr>
                            <td colspan="2">
                                <input type="button" id="pay" value="결제" class="button is-link is-outlined">
                                <c:if test="${not empty sid }">
                                    <input type="submit" class="button is-link is-outlined" value="구매">
                                </c:if>
                                <p id="paymentResult" style="color:red; font-size: 20px;"></p>
                            </td>
                        </tr>
                        </tbody>
                    </table>
                </form>
            </div>
        </div>
    </div>
</div>
<script>
    $(document).ready(function(){
        var cardArr1 = ["현대카드","농협카드","BC카드","KB카드"];
        var cardArr2 = ["하나카드","농협카드","BC카드"];
        var bankArr = ["카카오뱅크","농협은행","신한은행","기업은행","국민은행"];
        $("#pmethod").change(function(){
            var th = $(this).val();
            if(th==="신용카드"){
                for(var i=0;i<cardArr1.length;i++) {
                    $("#pcom").append("<option value='" + cardArr1[i] + "'>" + cardArr1[i] + "</option>");
                }
            } else if(th==="체크카드"){
                for(var i=0;i<cardArr2.length;i++) {
                    $("#pcom").append("<option value='"+cardArr2[i]+"'>"+cardArr2[i]+"</option>");
                }
            } else {
                for(var i=0;i<bankArr.length;i++) {
                    $("#pcom").append("<option value='"+bankArr[i]+"'>"+bankArr[i]+"</option>");
                }
            }
        }).change();
        $("#pcom").change(function(){
            $("#pcom2").val($(this).val());
        });
    });
</script>
<script>
    //주소 연동 API
    function findAddr() {
        new daum.Postcode({
            oncomplete: function(data) {
                console.log(data);
                var roadAddr = data.roadAddress;
                var jibunAddr = data.jibunAddress;
                document.getElementById("postcode").value = data.zonecode;
                if(roadAddr !== '') {
                    document.getElementById("address1").value = roadAddr;
                } else if(jibunAddr !== ''){
                    document.getElementById("address1").value = jibunAddr;
                }
                document.getElementById("address2").focus();
            }
        }).open();
    }
</script>
<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
    //결제모듈 API 연동
    $(document).ready(function(){
        var totalPay=0;
        var proName;
        $("#pay").click(function(){
            var email = $("#email").val();
            var cname = $("#name").val();
            var tel = $("#tel").val();
            var postcode = $("#postcode").val();
            proName = $("#proName").val();
            if($("#amount").val()!="") {
                totalPay = parseInt($("#price").val());
            } else {
                alert("구매할 수량을 입력하지 않으셨습니다.");
                $("#amount").focus();
                return;
            }
            alert("결제할 금액 : "+totalPay);
            //상품명_현재시간
            var d = new Date();
            var date = d.getFullYear()+''+(d.getMonth()+1)+''+d.getDate()+''+d.getHours()+''+d.getMinutes()+''+d.getSeconds();
            var IMP = window.IMP; // 생략가능
            IMP.init('imp85122075'); // 결제 API를 사용하기 위한 코드 입력!
            IMP.request_pay({		//결제 요청
                pg: "T5102001",
                merchant_uid : '상품명_' + date, //상점 거래 ID
                name : proName,				// 결제 명
                amount : totalPay,					// 결제금액
                buyer_email : email, // 구매자 email
                buyer_name : cname,				// 구매자 이름
                buyer_tel : tel,		// 구매자 전화번호
                buyer_postcode : postcode			// 구매자 우편번호
            }, function(rsp){
                if(rsp.success){
                    console.log(rsp);
                    var msg = '결제가 완료 되었습니다.';
                    var r1 = '고유 아이디 : ' +rsp.imp_uid;
                    var r2 = '상점 거래 아이디 : ' +rsp.merchant_uid;
                    var r3 = '결제 금액 : ' +rsp.paid_amount;
                    var r4 = '카드 승인 번호 : '+rsp.apply_num;

                    // 실제 결제 창
                    // $("#payCk").val("yes");
                    // $("#payAmount").val(rsp.paid_amount);
                    // $("#pmethod").val(rsp.pay_method);
                    // $("#pcom").val(rsp.pg_provider);
                    // $("#cnum").val(rsp.apply_num);
                    // alert(msg);
                    // $("#paymentResult").html(r1+"<br>"+r2+"<br>"+r3+"<br>"+r4);
                } else{
                    //$("#paymentResult").html('결제실패<br>'+'에러내용 : ' +rsp.error_msg);
                }
                //테스트용이므로 실패시에도 그냥 통과시킴
                $("#payCk").val("yes");
                $("#payAmount").val(totalPay);
                // $("#pmethod").val("신용카드");
                // $("#pcom").val("삼성카드");
                // $("#cnum").val("123-1234-1234-1278");
                $("#paymentResult").text("결제 완료 : "+totalPay);
            });
        });
    });
</script>
<script>
    function payCheck(f){
        var payCk = f.payCk.value;
        console.log(payCk);
        if(payCk!="yes"){
            alert("아직 결제 전 입니다.");
            return false;
        }
    }
</script>
<!-- footer imclude -->
<jsp:include page="../include/footer.jsp"></jsp:include>
</body>
</html>
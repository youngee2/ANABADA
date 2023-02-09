

# Web Team Project
<br>

## 🌱ANABADA_환경을 생각하는 중고 거래 사이트

### 💸JSP로 만든 중고 거래 사이트입니다.

  **Java, JSP & Servlet, Javascript, HTML5, CSS3**을 이용한 프로젝트입니다. 
  자신에게 필요 없는 물품을 1대 1 쪽지 혹은 댓글을 통해 판매하고, 물물교환이 가능합니다.


😊자세한 전체 내용은 아래 파일을 다운받아 보실 수 있습니다.<br>
[ANABADA_프로젝트.pdf](https://github.com/IrisNamu/ANABADA/files/9945931/ANABADA_.pdf) <br>



### 🛠️ 사용 기술 및 라이브러리

- Java
- JSP & Servlet
- Javascript (jQury, 
-  HTML5, CSS3
- Oracle
- Apache Tomcat 9.0

## 📱 핵심 기능

1. 회원가입시 **욕설 필터링**을 통해 사용자의 편안함을 추구합니다.
2.  **판매 및 물물교환 거래 기능 ( 1대 1 쪽지 혹은 댓글**을 통해  거래가 가능합니다.)
3. **신고 기능**을 통해 불량회원을 신고할 수 있습니다.
4. **클라이언트(관리자)가 불량 회원을 관리하기 쉽도록** 하였습니다. 
5. 자유게시판을 통해 회원들 간의 **소통을 도모**합니다.


## 📆 개발 기간
-2022.09.13. ~ 2022.10.25.

---


## 📌핵심기능 1 - 거래 기능(쪽지 및 댓글)

거래게시판은 판매게시판과 교환게시판으로 나눠집니다.<br>
카테고리별 분류 조회가 가능하며 검색기능을 지원합니다.


- **판매게시판** : 물건을 판매하고 쪽지로 거래 ( 판매금액 0원이면 무료나눔으로 등록)
- **교환게시판** : 거래를 희망하는 물품을 쪽지와 댓글로 거래 
![거래](https://user-images.githubusercontent.com/106574819/202632139-b7e17969-8381-4001-bd0c-19cc84111cac.gif)




- **1대 1 쪽지 및 댓글 기능**

![교환 쪽지](https://user-images.githubusercontent.com/106574819/202619314-de0b3d0c-e474-46a4-83d0-4817ebd8c1ab.gif)

 
## 📌 핵심기능 2 - 신고 기능
![신고](https://user-images.githubusercontent.com/106574819/202619318-95cf7b61-e9e2-4872-90d1-712a75b9c6dd.gif)

**게시글 작성자 혹은 댓글 작성자를 신고**할 수 있는 기능입니다.<br>
이는 클라이언트(관리자) 계정으로 접속 후 게시글을 삭제하거나, 댓글을 삭제할 수 있습니다.


## 📌 핵심기능 3 - 클라이언트 편리성 고려: 회원 관리 페이지
![관리자 회원관리](https://user-images.githubusercontent.com/106574819/202619302-587383e6-c323-4097-a7b6-89da309c0226.gif)
<br>
jQuery를 이용하여 클라이언트가 불량 회원을 관리하기 쉽게 하도록 만들었습니다.<br>
한 회훤이 **신고를 받을 때마다 회원의 총 신고수도 같이 증가**하게 됩니다. <br>
**클라이언트가 불량 회원을 한 눈에 알아보기 쉽도록** 테이블 맨 오른쪽에는 **받은 신고수가 높은 회원 순으로 배치**하였습니다.<br>

- 회원 정지 및 정지 해제 기능(**정지된 회원은 로그인이 불가한 계정으로 바뀝니다**.)
- 회원 탈퇴 기능
- 검색기능
- 신고 내역 삭제 기능
- 관리자 권한으로 일반 회원이 쓴 게시글 및 댓글 삭제 가능

## 📌 핵심기능 4 - 커뮤니티 기능
자유게시판을 통해 회원들간의 소통을 도모합니다.
Javascript 라이브러리인 **Summernote**를 이용하여 원하는대로 글을 꾸밀 수 있습니다.<br>
관리자 계정으로 로그인 시 모든 댓글과 게시글을 삭제할 수 있는 권한을 가집니다.

![자유게시판](https://user-images.githubusercontent.com/106574819/202703815-4fbc250b-b53f-4bb7-bc44-6f0cea6309f0.gif)


---


### 이외 페이지 소개

- 소개페이지 (클라이언트 회사 소개 페이지, 후원 소개 페이지, 개발자 소개페이지)<br>
![소개](https://user-images.githubusercontent.com/106574819/202625073-3719e1a7-fb74-484b-b85c-8f2b7e35f938.gif)
<br>
<br>

- 자주 묻는 질문<br>

![자주묻는질문](https://user-images.githubusercontent.com/106574819/202703737-00e6b1a5-11d4-43ed-82b8-8513f148ddd2.gif)
<br>
<br>

- 공지사항 게시판(관리자 권한으로 공지사항 글쓰기, 수정, 삭제)<br>

![공지사항](https://user-images.githubusercontent.com/106574819/202703810-7dd7bdbd-3aac-498b-adeb-4a11102e7291.gif)
<br>
<br>

- 로그인 및 회원가입(중복확인) 과 회원 정보 수정 및 탈퇴<br>
![회원가입](https://user-images.githubusercontent.com/106574819/202619308-22501d98-c7c6-4285-920e-43ae8d80a60e.gif)

<br>
<br>


### ⛓️팀원 구성

![003](https://user-images.githubusercontent.com/106574819/200172958-324f80ef-5c39-4f2e-a442-a7159b833649.png)
✨팀원 깃허브 주소
- 강지은 https://github.com/6868x88
- 송유진 https://github.com/IrisNamu
- 장아영 https://github.com/youngee2

---

***

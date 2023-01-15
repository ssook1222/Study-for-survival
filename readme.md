
# 🌟 Study for survival

 📍 개발 초보의 spring, jsp 적응기

----

## 목차

### - [1128 설명](#1128)    
###  - [1208 설명](#1208)    
### - [Sign_up_backup 설명](#sign_up_backup)    
### - [동적게시판 프로젝트 설명](#Dynamic-Board-Project)
### - [CMS 프로젝트 설명](#CMS_Project)

---

#### 1128

[해당 레포지토리로 이동](https://github.com/ssook1222/Study-for-survival/tree/master/1128)

`진행기간`     
22년 11월 28일 ~ 12월 7일     

`학습내용` 
- jquery
- servlet과 jdbc
- jsp 구조
- html / css 기초 지식

`학습내용 정리목록`

|주제|링크|
|------|---|
|jquery|[jquery - sibling selector](https://github.com/ssook1222/Study-for-survival/tree/master/1128/jquery/jquery_selector.md)|
|servlet|[redirect / forward / include](https://github.com/ssook1222/Study-for-survival/tree/master/1128/servlet/servlet_redirect_forward_include.md)|
|servlet|[jdbc](https://github.com/ssook1222/Study-for-survival/tree/master/1128/servlet/jdbc.md)|
|servlet|[jsp_tag](https://github.com/ssook1222/Study-for-survival/tree/master/1128/servlet/jsp_tag.md)
|servlet|[request / session / application](https://github.com/ssook1222/Study-for-survival/tree/master/1128/servlet/req_session_app.md)
|servlet|[usebean / web-xml /custom tag / Dynamic Attribute](https://github.com/ssook1222/Study-for-survival/tree/master/1128/servlet/usebean_webXml_customTag_DynamicAttr.md)


---

#### 1208

[해당 레포지토리로 이동](https://github.com/ssook1222/Study-for-survival/tree/master/1208)

`진행기간`     
22년 12월 8일 ~ 12월 22일

`학습내용`
- maven 기초    
- STS / Spring & maven / Mybatis 기초
- spring 특징 및 작동 방식
- JSTL / EL / AJAX
- Json과 파일 업로드

|주제|링크|
|------|---|
|maven 기초|[maven_basic](https://github.com/ssook1222/Study-for-survival/tree/master/1208/spring/maven_basic.md)|
|STS / Spring & maven / Mybatis 기초|[STS / Spring & maven / Mybatis](https://github.com/ssook1222/Study-for-survival/tree/master/1208/spring/STS_springMaven_Mybatis.md)|
|Spring 기초|[Spring_basic](https://github.com/ssook1222/Study-for-survival/tree/master/1208/spring/spring_basic.md)|
|JSTL / EL / AJAX|[JSTL_EL_AJAX](https://github.com/ssook1222/Study-for-survival/blob/master/1208/spring/JSTL_EL_AJAX.md)|
|JSON / FILE_UPLOAD|[JSON/FILE_UPLOAD](https://github.com/ssook1222/Study-for-survival/blob/master/1208/spring/JSON_FileUpload.md)|

---

#### sign_up_backup

[해당 레포지토리로 이동](https://github.com/ssook1222/Study-for-survival/tree/master/sign_up_backup)

`소개`    
회원가입, 로그인 기능을 구현했던 과제

`참고 사항`
- 1인 Full Stack 개발이지만, 기능 1~2개를 구현한 것으로 굉장히 작은 규모의 과제
- 구현 내용
    - 회원가입 기능
        - 유효성 검사
        - 회원 DB에서 사용자 입력 값 Create 진행
        - 아이디 중복체크 
        - 비밀번호 재확인 검사
    - 로그인 기능
        - 유효성 검사
        - 비밀번호와 아이디가 있는 경우 글 작성 페이지로 이동
        - 없는 경우 없다는 `Alert` 창을 띄움
    
`개발 기간`   
2022.12.14

`사용 기술스택`    

| 담당 |기술스택|
|------|---|
|Front-end | JSP/JQuery |
|Back-end|Spring(Java)/Mybatis|
|Database|Oracle|

---

#### Dynamic Board Project

[해당 레포지토리로 이동](https://github.com/ssook1222/Study-for-survival/tree/master/Dynamic_Board)


`소개`
게시판을 자유롭게 생성할 수 있고, 그 생성된 게시판에 게시글을 작성할 수 있게끔 하는 동적게시판 구현 과제

`참고사항`
- 1인 Full Stack 개발
- 구현 내용
    - 게시판 생성 / 삭제 / 이름 수정
        - 이름 수정의 경우 특정 버튼을 누르면 모달 창을 띄워 수정하는 방식으로 진행
        - 게시판 삭제 시 게시글 전부가 삭제 되도록 구현
    
    - 게시글 생성 / 삭제 / 수정
        - 게시글 수정 및 삭제의 경우 작성자 본인이 아니면 버튼이 보이지 않게끔 구현
        - 게시글 생성은 현재 존재하는 게시판 중 한 곳을 지정해야만 작성 가능

`개발기간` 2022.12.19~12.20    

`사용 기술스택`

| 담당 |기술스택|
|------|---|
|Front-end | JSP/JQuery |
|Back-end|Spring(Java)/Mybatis|
|Database|Oracle|

---

#### CMS_Project

[해당 레포지토리로 이동](https://github.com/ssook1222/Study-for-survival/tree/master/CMS_Project/src/main)

`소개`    
Contents Management System 개발 프로젝트


`참고사항`
- 1인 Full Stack 개발
- 구현 내용
    - 회원가입 / 로그인
    - 게시판 생성 / 삭제 / 이름 수정
    - 게시글 생성 / 삭제 / 수정
    - 회원 그룹 수정 / 삭제
    - 회원 닉네임 수정 / 삭제

`개발기간` 2022.12.21~12.27

`사용 기술스택`

| 담당 |기술스택|
|------|---|
|Front-end | JSP/JQuery |
|Back-end|Spring(Java)/Mybatis|
|Database|Oracle|

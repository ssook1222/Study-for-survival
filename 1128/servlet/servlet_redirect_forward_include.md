# Redirect / Forward / Include

`redirect`

redirect는 클라이언트의 요청에 대한 HTTP 응답을 나타내는 객체인 reponse의 메소드이다.

redirect 방법으로 이동한 페이지는 이전 페이지와 전혀 데이터를 공유하거나 주고받는 것이 없다.

실제로 데이터를 공유할 수도 없다. 리다이렉트 하게 되면 이동할 페이지로 **요청과 응답 객체를 새로 생성**하여 전송하기 때문이다.

리다이렉트는 페이지를 **재요청**하는 것이며, **URL**을 보면 리다이렉트 시 해당 jsp 파일의 이름으로 **변경**되어 있을 것이다.

---

`forward와 include`

forward와 include는 다른 내장 객체를 얻어내거나

현재 페이지의 요청과 응답의 제어권을 다른 페이지로 넘겨주는데 사용하는 pageContext객체의 메소드다.

**이전의 페이지에 작성 된 데이터를 이동할 페이지로** 보내야 할 때 pageContext객체의 forword와 include 메소드를 사용한다.

---

`forward`

**forward**는 현재 페이지의 요청과 응답에 관한 **제어권**을 URL로 지정된 주소( 매개변수)로 **영구적으로 넘긴다.**

포워드된 페이지의 요청 처리가 종료 되면 응답도 종료 된다.

```java
protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		.
		.
		.
		RequestDispatcher disp = request.getRequestDispatcher("/Forward052");
		disp.forward(request, response);
		.
		.
		.
}
```

`include`

include는 해당 URL로 포워드처럼 제어권을 넘기지만 영구적으로 넘기는 것이 아니라 
**include된 페이지의 처리가 끝나면 다시 제어권은 원래의 페이지로** 돌아온다.

include된 페이지의 내용을 원래 페이지에 **삽입**하는 것과 같다.
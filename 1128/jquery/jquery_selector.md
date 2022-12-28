## Jquery Selectors

---

### Siblings selector

`("*parent* > *child*")`

("부모 > 자식") 선택자는 부모에서 지정된 요소의 직계 자식인 모든 요소를 선택합니다.

- 지정 요소의 직접 자식 요소만 선택

```jsx
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
<script>
.
.
.
<script>
$(document).ready(function(){
  $("div > span").css("background-color", "yellow");
});
</script>
// div 안에 있는 span들의 색상을 변경

```

![img.png](img.png)

---

`*$("parent child")*`

<부모> 요소의 자손인 모든 요소를 선택합니다.

요소의 자손은 해당 요소의 자식, 손자, 증손자 등이 될 수 있습니다.

= 부모 하위에 있는 요소들 중 자식 요소가 있으면 보여줌.

![img_1.png](img_1.png)

```jsx
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
		<script> 
				$("div span").css("background-color", "yellow");
			});
		</script>
```


<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="EUC-KR"%>
    
<%
   //%���� : java�ڵ带 �����ϴ� ���� (Back��)
   // acation="Ex11_loginok.jsp"
   
   //Ŭ���̾�Ʈ���� ������ ������ �ޱ�
   //<input type="text" name="id"
   //<input type="password" name="pwd"
   
   String userid   = request.getParameter("id");
   String pwd      = request.getParameter("pwd");
   //Ŭ���̾�Ʈ�� �Է��� id, pwd �������� �޴� ��
   
   //�ʿ��ϴٸ�
   //insert into member(id, pwd) values(userid, pwd);

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

      <h3>����� �Է��� ������</h3>
      ID: <%= userid %><br>
      PWD: <%= pwd %>

</body>
</html>
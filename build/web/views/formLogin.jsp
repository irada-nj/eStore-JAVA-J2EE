<%-- 
    Document   : formLogin
    Created on : 18 mars 2022, 11:21:52
    Author     : IRADA
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <jsp:include page="header.jsp"></jsp:include>
        
        <section id="form"><!--form-->
		<div class="container">
			<div class="row">
				<div class="col-sm-4 col-sm-offset-1">
					<div class="login-form"><!--login form-->
                                            <%
                                            if(request.getAttribute("msg")!=null){
                                                
                                                %>
                                                <h3 style="color: red"><%=request.getAttribute("msg")%></h3>
                                                <%
                                            }
                                            %>
                                            
						<h2>Login to your account</h2>
						<form action="/eStore/Login" method="post">
						<input type="email" name="email" placeholder="Email Address" required=""/>
                                                <input type="password" name="mdp" placeholder="password" required=""/>
							<span>
								<input type="checkbox" class="checkbox"> 
								Keep me connected
							</span>
							<button type="submit" class="btn btn-default">Login</button>
						</form>
					</div><!--/login form-->
				</div>
				<div class="col-sm-1">
					<h2 class="or">OR</h2>
				</div>
				<div class="col-sm-4">
					<div class="signup-form"><!--sign up form-->
						<h2>New User Signup!</h2>
						<form action="/eStore/Inscription" method="post">
							<input type="text" name="nom" placeholder="Name" required=""/>
                                                        <input type="text" name="prenom" placeholder="LastName" required=""/>
							<input type="email" name="email" placeholder="Email Address" required=""/>
							<input type="password" name="mdp" placeholder="Password" required=""/>
							<button type="submit" class="btn btn-default">Signup</button>
                                                       
						</form>
					</div><!--/sign up form-->
				</div>
			</div>
		</div>
	</section><!--/form-->
        
        <jsp:include page="footer.jsp"></jsp:include>
    </body>
</html>

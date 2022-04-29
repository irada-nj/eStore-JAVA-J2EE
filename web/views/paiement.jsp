<%-- 
    Document   : paiement
    Created on : 19 mars 2022, 04:31:53
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
        
        <section id="cart_items">
		<div class="container">
			<div class="breadcrumbs">
				<ol class="breadcrumb">
				  <li><a href="#">Home</a></li>
				  <li class="active">Check out</li>
				</ol>
			</div><!--/breadcrums-->

			<div class="step-one">
				<h2 class="heading">Step 2: Payment</h2>
			</div>
			

			<div class="register-req">
				<p>Pay your order safely</p>
			</div><!--/register-req-->

			<div class="shopper-informations">
				<div class="row">
					<div class="col-sm-3">
						<div class="shopper-info">
                                                    <%
                                                    if(request.getAttribute("msg")!=null){
                                                        %>
                                                        <h3 style="color: red"><%=request.getAttribute("msg")%></h3>
                                                        <%
                                                    }
                                                    %>
							<p>Visa card details</p>
							<form action="/eStore/Paiement" method="post">
							 <input type="text" placeholder="Card number" name="nocarte">
								<input type="text" placeholder="validity date" name="datecarte">
								<input type="text" placeholder="crypto" name="crypto">
                                                                
                                                                 <input type="hidden" name="adresse1" value="<%=request.getParameter("adresse1")%>">
                                                                <input type="hidden" name="adresse2" value="<%=request.getParameter("adresse2")%>">
                                                                <input type="hidden" name="ville" value="<%=request.getParameter("ville")%>">
                                                                <input type="hidden" name="pays" value="<%=request.getParameter("pays")%>">
                                                                <input type="hidden" name="codepostale" value="<%=request.getParameter("codepostale")%>">
							
							  <button  type="submit"  class="btn btn-primary" href="">Pay</button>
                                                        </form>
						</div>
					</div>
					
										
				</div>
			</div>
			

	</div>
	</section> <!--/#cart_items-->
        
        <jsp:include page="footer.jsp"></jsp:include>
    </body>
</html>

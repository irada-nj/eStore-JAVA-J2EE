<%-- 
    Document   : checkout
    Created on : 18 mars 2022, 17:56:12
    Author     : IRADA
--%>

<%@page import="ma.estore.models.Produit"%>
<%@page import="ma.estore.models.LignePanier"%>
<%@page import="ma.estore.models.Panier"%>
<%@page import="ma.estore.models.Client"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
   <jsp:include page="header.jsp"></jsp:include>
   <%
            if(session.getAttribute("clt")==null){
                request.setAttribute("msg","You must login or register to pass your order!");
                request.getRequestDispatcher("/views/formLogin.jsp").forward(request, response);
            }
            Client c=(Client)session.getAttribute("clt");
            %>
            
	<section id="cart_items">
		<div class="container">
			<div class="breadcrumbs">
				<ol class="breadcrumb">
				  <li><a href="#">Home</a></li>
				  <li class="active">Check out</li>
				</ol>
			</div><!--/breadcrums-->

			<div class="step-one">
				<h2 class="heading">Step1</h2>
			</div>
<form action="/eStore/views/paiement.jsp" method="post">
			

			<div class="shopper-informations">
				<div class="row">
					<div class="col-sm-3">
						<div class="shopper-info">
							<p>Customer information</p>
                                                      
							<input type="text" value="<%=c.getNom()%>">
                                                        <input type="text" value="<%=c.getPrenom()%>">
                                                        
						
						</div>
					</div>
					<div class="col-sm-5 clearfix">
						<div class="bill-to">
							<p>Bill To</p>
							<div class="form-one">
                                                          
								<input type="text" placeholder="Address 1 *" required name="adresse1">
								<input type="text" placeholder="Address 2" name="adresse2">
                                                                 
							</div>
							<div class="form-two">
								
									<input type="text" placeholder="Zip / Postal Code *" name="codepostale">
									<select name="pays">
										<option value="Tunisia">Tunisia</option>
										<option value="United States">United States</option>
										<option value="Bangladesh">Bangladesh</option>
										<option value="UK">UK</option>
										<option value="India">India</option>
										<option value="Pakistan">Pakistan</option>
										<option value="Ucrane">Ucrane</option>
										<option value="Canada">Canada</option>
										<option value="Dubai">Dubai</option>
									</select>
									<select name="ville">
										<option>-- State / Province / Region --</option>
										<option value="tunis">Tunis</option>
										<option value="sousse">Sousse</option>
										<option value="sfax">Sfax</option>
										<option value="tozeur">Tozeur</option>
									</select>
									
							</div>
						</div>
					</div> 
					<div class="col-sm-4">
						<div class="order-message">
							<p>Note to the seller</p>
							<textarea name="message"  placeholder="Notes about your order, Special Notes for Delivery" rows="16"></textarea>
							<label><input type="checkbox"> Shipping to bill address</label>
						</div>		
					</div>					
				</div>
			</div>
			<div class="review-payment">
				<h2>Reviewing your cart & Payment</h2>
			</div>

			<div class="table-responsive cart_info">
				<table class="table table-condensed">
					<thead>
						<tr class="cart_menu">
							<td class="image">Product</td>
							<td class="description"></td>
							<td class="price">Price</td>
							<td class="quantity">Quantity</td>
							<td class="total">Total</td>
							<td></td>
						</tr>
					</thead>
					<tbody>
                                            <%
                                             Panier panier=(Panier)session.getAttribute("panier");
                                             for(LignePanier lp:panier.getItems()){
                                                
                                            Produit p=lp.getProduit();
                                           %>
                                           
						<tr>
							<td class="cart_product">
                                                            	  <a href=""><img src="/eStore/images/cart/<%=p.getImages().get(0).getUrl()%>" height="50px" width="50px"alt=""></a> 
							</td>
							<td class="cart_description">
								<h4><a href=""><%=p.getLibelle()%></a></h4>
							</td>
							<td class="cart_price">
								<p>$<%=p.getPrix()%></p>
							</td>
							<td class="cart_quantity">
								<div class="cart_quantity_button">
									<a class="cart_quantity_up" href=""> + </a>
									<input class="cart_quantity_input" type="text" name="quantity" value="<%=lp.getQte()%>" autocomplete="off" size="2">
									<a class="cart_quantity_down" href=""> - </a>
								</div>
							</td>
							<td class="cart_total">
								<p class="cart_total_price">$<%=p.getPrix()*lp.getQte()%></p>
							</td>
							<td class="cart_delete">
								<a class="cart_quantity_delete" href=""><i class="fa fa-times"></i></a>
							</td>
						</tr>
                                                <%}%>

						
						
					</tbody>
				</table>
			</div>
			<div class="payment-options">
					<span>
						<label><input type="checkbox"> Visa card</label>
					</span>
					
                            
                             <button type="submit" class="btn btn-primary" href="">Continue</button>
                         
                        </div>
		</div>
                                               
	</section> <!--/#cart_items-->
 </form>
	
    <jsp:include page="footer.jsp"></jsp:include>

    </body>
</html>

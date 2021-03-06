<%-- 
    Document   : panier
    Created on : 20 mars 2022, 14:23:38
    Author     : IRADA
--%>

<%@page import="ma.estore.models.Lignecommande"%>
<%@page import="ma.estore.models.Commande"%>
<%@page import="org.hibernate.Session"%>
<%@page import="ma.estore.dao.MyHibernateUtil"%>
<%@page import="ma.estore.models.Produit"%>
<%@page import="ma.estore.models.LignePanier"%>
<%@page import="ma.estore.models.Panier"%>
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
                        int idcmd=Integer.parseInt(request.getParameter("idcmd"));
                        Session s=MyHibernateUtil.getSession();
                                           Commande cmd=(Commande)s.get(Commande.class,idcmd);
                                            
                                            %>
        
        <section id="do_action">
		<div class="container">
                    <div class="breadcrumbs">
				<ol class="breadcrumb">
				  <li><a href="#">Home</a></li>
				  <li class="active">Order detail</li>
				</ol>
			</div>
			
			<div class="row">
				<div class="col-sm-6">
					<div class="chose_area">
						<ul class="user_option">
							<li>
								<label>No cmd :</label>
								<label><%=cmd.getIdcmd()%></label>
							</li>
							<li>
								<label>Date : </label>
								<label><%=cmd.getDatecmd()%></label>
							</li>
                                                        <li>
								<label>State : </label>
								<label><%=cmd.getEtat()%></label>
							</li>
							<li>
								<label>Method of payment</label>
								<label><%=cmd.getMethodePay()%></label>
							</li>
						</ul>
						<ul class="user_info">
							<li class="single_field">
								<label>Follow-up information:</label>
								
								
							</li>
                                                        <% if(cmd.getExpedition()==null){
                                                            %>
                                                            <h5 style="color: red">No follow-up information is available</h5>
							<%}else{
                                                                
                                                                %>
                                                            <li class="single_field">
								<label>Shipping way:</label>
								<label><%=cmd.getExpedition().getMoyenExpedition()%></label>
							
							</li>
							<li class="single_field">
								<label>Tracking number:</label>
								<label><%=cmd.getExpedition().getNumeroSuivi()%></label>
							
							</li>
                                                        <li class="single_field">
								<label>State :</label>
								<label><%=cmd.getExpedition().getEtat()%></label>
							
							</li>
                                                        <%}%>
						</ul>
						
					</div>
				</div>
				
			</div>
		</div>
	</section><!--/#do_action-->
        
        <section id="cart_items">
		<div class="container">
			                     
			<div class="table-responsive cart_info">
				<table class="table table-condensed">
					<thead>
						<tr class="cart_menu">
							<td class="image">Product</td>
							<td class="description"></td>
							<td class="price">Price</td>
							<td class="quantity">quantity</td>
							<td class="total">Total</td>
							
						</tr>
					</thead>
					<tbody>
                                            <%for(Lignecommande lc:cmd.getLignecommandes()){
                                                
                                            Produit p=lc.getProduit();
                                           %>
						<tr>
							<td class="cart_product">
                                                     <img src="/eStore/images/produit/<%=p.getImages().get(0).getUrl()%>" width="50px" height="50px" alt=""> 
							</td>
							<td class="cart_description">
								<h4><a href=""><%=p.getLibelle()%></a></h4>
								
							</td>
							<td class="cart_price">
								<p>$<%=p.getPrix()%></p>
							</td>
							<td class="cart_quantity">
								<div class="cart_quantity_button">
									<input class="cart_quantity_input" type="text" name="quantity" value="<%=lc.getQte()%>" autocomplete="off" size="2">
									
								</div>
							</td>
							<td class="cart_total">
								<p class="cart_total_price">$<%=lc.getQte()*p.getPrix()%></p>
							</td>
							
						</tr>

						<%}%>
					</tbody>
				</table>
			</div>
		</div>
	</section> <!--/#cart_items-->

	<section id="do_action">
		<div class="container">
			
			<div class="row">
				<div class="col-sm-6">
					
				</div>
				<div class="col-sm-6">
					<div class="total_area">
						<ul>
							<li>the total of the order <span>$<%=cmd.total()%></span></li>
							
						</ul>
							
							<a href="/eStore/Recu?idcmd=?<%=cmd.getIdcmd()%>"class="btn btn-default check_out" href="">Confirm receipt !</a>
					</div>
				</div>
			</div>
		</div>
	</section><!--/#do_action-->

        
        
        <jsp:include page="footer.jsp"></jsp:include>
    </body>
</html>
<%-- 
    Document   : mescommandes
    Created on : 19 mars 2022, 08:35:00
    Author     : IRADA
--%>

<%@page import="ma.estore.models.Panier"%>
<%@page import="ma.estore.models.Produit"%>
<%@page import="ma.estore.models.LignePanier"%>
<%@page import="java.util.List"%>
<%@page import="ma.estore.models.Commande"%>
<%@page import="org.hibernate.Query"%>
<%@page import="ma.estore.dao.MyHibernateUtil"%>
<%@page import="org.hibernate.Session"%>
<%@page import="ma.estore.models.Client"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
            if(session.getAttribute("clt")==null){
                request.setAttribute("msg","You must login or register to pass your order!");
                request.getRequestDispatcher("/views/formLogin.jsp").forward(request, response);
            }
            Client c=(Client)session.getAttribute("clt");
            
                                                    %>
                                                    
            <jsp:include page="header.jsp"></jsp:include>
            <%
             if(request.getAttribute("msg")!=null){
            %>
            <h3 style="color: red"><%=request.getAttribute("msg")%></h3>
           <%
            }
            %>
                                             
              <%
      
           Session s=MyHibernateUtil.getSession();
           Query q=s.createQuery("Select c from Commande c where c.client.idc=:idc");
           q.setInteger("idc", c.getIdc());
           List<Commande> cmds=q.list();
           %>
           
           
           
           
           <section id="cart_items">
		<div class="container">
			<div class="breadcrumbs">
				<ol class="breadcrumb">
				  <li><a href="#">Home</a></li>
				  <li class="active">List of my orders</li>
				</ol>
			</div>
                   
                   
			<div class="table-responsive cart_info">
				<table class="table table-condensed">
					<thead>
						<tr class="cart_menu">
							<td class="image">Order number</td>
							
							<td class="price">Date</td>
							<td class="quantity">state</td>
							<td class="total">Total</td>
							<td></td>
						</tr>
					</thead>
					<tbody>
                                            
                                              <%for(Commande cmd:cmds){
                                                
                                            
                                           %>
						<tr>
							<td class="cart_product">
                                                            <%=cmd.getIdcmd()%>
							</td>
							
							<td class="cart_price">
								<%=cmd.getDatecmd()%>
							</td>
							<td class="cart_quantity">
								<div class="cart_quantity_button">
                                                                   <p><%=cmd.getEtat()%></p>
								</div>
							</td>
							<td class="cart_total">
								<p class="cart_total_price">$<%=cmd.total()%></p>
							</td>
							<td class="cart_delete">
								<a class="cart_quantity_delete" href="/eStore/views/detailCmd.jsp?idcmd=<%=cmd.getIdcmd()%>"><i class="fa fa-eye"></i></a>
							</td>
						</tr>

						<%}%>
						
					</tbody>
				</table>
			</div>
		</div>
	</section> <!--/#cart_items-->
           
            <jsp:include page="footer.jsp"></jsp:include>
      
    </body>
</html>

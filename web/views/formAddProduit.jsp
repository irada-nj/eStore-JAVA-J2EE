<%-- 
    Document   : formAddProduit
    Created on : 21 mars 2022, 13:43:04
    Author     : IRADA
--%>

<%@page import="ma.estore.models.Categorie"%>
<%@page import="java.util.List"%>
<%@page import="ma.estore.dao.MyHibernateUtil"%>
<%@page import="org.hibernate.Session"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        
        
      <jsp:include page="header.jsp"></jsp:include>
        
        <div class="container">
            
            
        <%
            if(request.getAttribute("msg")!=null){
                %>
                <h3><%=request.getAttribute("msg")%></h3>
                <%
            }
            %>
            <form class="was-validated"  action="/eStore/AddProduit" method="post" enctype="multipart/form-data">
            
            <div class="mb-3">
    <label for="validationTextarea">Libelle</label>
    <input type="text" name="libelle" required="" class="form-control">
  </div>
             <div class="mb-3">
    <label for="validationTextarea">brand</label>
    <input type="text" name="marque" required="" class="form-control">
  </div>
             <div class="mb-3">
    <label for="validationTextarea">price</label>
    <input type="text" name="prix" required="" class="form-control">
  </div>
                <div class="mb-3">
    <label for="validationTextarea">shipping cost</label>
    <input type="text" name="frais" required="" class="form-control">
  </div>
            
  <div class="mb-3">
    <label for="validationTextarea">Description</label>
    <textarea class="form-control is-invalid" name="description" id="validationTextarea" placeholder="Required example textarea" required></textarea>
    <div class="invalid-feedback">
      Please enter a message in the textarea.
    </div>
  </div>

  <div class="custom-control custom-checkbox mb-3">
    <input type="checkbox" class="custom-control-input" name="disponible">
    <label class="custom-control-label" for="customControlValidation1">available</label>
    
  </div>
 <div class="mb-3">
    <label for="validationTextarea">Quantity in stock</label>
    <input type="text" name="qte" required="" class="form-control">
  </div>
 
 

  <div class="mb-3">
      <select class="custom-select" required name="cat">
      <option value="">Choose a category...</option>
      
      <%
          Session s=MyHibernateUtil.getSession();
          List<Categorie> cats=s.createQuery("From Categorie").list();
          for(Categorie c:cats){
          %>
            <option value="<%=c.getIdcat()%>"><%=c.getLibelle()%></option>
      <%}%>
    </select>
   
  </div>

  <div class="custom-file mb-3">
    <input type="file" class="custom-file-input" name="img1" id="validatedCustomFile" required>
    <label class="custom-file-label" for="validatedCustomFile">Choose the main image of your product...</label>
   
  </div>

 

  

  <div class="input-group is-invalid">
    <div class="custom-file">
      <input type="file" class="custom-file-input" id="validatedInputGroupCustomFile" name="img2">
      <label class="custom-file-label" for="validatedInputGroupCustomFile">Choose Image 2 (optional)...</label>
    </div>
       <div class="custom-file">
      <input type="file" class="custom-file-input" id="validatedInputGroupCustomFile" name="img3">
      <label class="custom-file-label" for="validatedInputGroupCustomFile">Choose Image 3 (optional)...</label>
    </div>
       <div class="custom-file">
      <input type="file" class="custom-file-input" id="validatedInputGroupCustomFile" name="img4">
      <label class="custom-file-label" for="validatedInputGroupCustomFile">Choose Image 4 (optional)...</label>
    </div>
    <div class="input-group-append">
        <button class="btn btn-outline-secondary" type="submit">save</button>
    </div>
  </div>
 
</form>
        </div>
        <jsp:include page="footer.jsp"></jsp:include>  
        
        
    </body>
</html>

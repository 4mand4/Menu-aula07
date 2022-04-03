<%-- 
    Document   : index
    Created on : 02/04/2022, 23:41:03
    Author     : Amanda
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">  
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Aplicação JavaEE</title>
    </head>
    <body>
        <%@include file = "WEB-INF/jspf/navbar.jspf"%>
        <h3>Juros Simples</h3>
        <form action="pag1.jsp" method="post">
            <div>
                <div>Valor: </div>
                <label for="valor"></label>
                <input type="number" value="" name="valor" class="col-sm col-form-label" />
            </div>      
            <div>
                <div>Juros em % :  </div>
                <label for="juros"></label>
                <input type="number" value="" name="juros" step="any" class="col-sm col-form-label"/>
            </div>
            <div>
                <div>Tempo(meses):</div>
                <label for="tempo"></label>
                <input type="number" value="" name="tempo" class="col-sm col-form-label"/>
            </div>
            <br>
            <input name="simples" type="submit" value= "Juros Simples" class="btn btn-dark"/>
        </form>
        <%
            String error = null;
            double n1 = 0;
            double n2 = 0;
            double n3 = 0;
            double n4 = 0;

            try {
                String v = request.getParameter("valor");
                String j = request.getParameter("juros");
                String t = request.getParameter("tempo");

                n1 = Double.parseDouble(j);
                n2 = Double.parseDouble(t);
                n3 = Double.parseDouble(v);

            } catch (Exception e) {
                error = e.getMessage();
            }
            if (error != null) {
                out.println("<span style='color:red'>Erro ao tentar ler parâmetros</span>");
            } else {
                double jurosSimples;
                jurosSimples = (n3 * n2 * n1) / 100;
        %> 
        <br>
        <h3>Resultado: <% out.print(String.format("%.2f", jurosSimples));%><h3
                <%}%>
            <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
                </body>
                </html>

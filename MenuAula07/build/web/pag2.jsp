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
        <h3>Juros Compostos</h3>
        <form action="pag2.jsp" method="post">
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
            <input name="simples" type="submit" value= "Juros Composto" class="btn btn-dark"/>
        </form>
        <br>
        <table class="table table-dark table-striped">
            <thead>
                <tr>
                    <th scope="col">MÊS</th>
                    <th scope="col">CAPITAL</th>
                    <th scope="col">JUROS</th>
                    <th scope="col">MONTANTE</th>
                </tr>
            </thead>
            <tbody>
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
                        String n = request.getParameter("numero");

                        n1 = Double.parseDouble(j);
                        n2 = Double.parseDouble(t);
                        n3 = Double.parseDouble(v);
                        n4 = Double.parseDouble(n);
                    } catch (Exception e) {
                        error = e.getMessage();
                    }

                    if (error != null) {
                        out.println("<span style='color:red'>Erro ao tentar ler parâmetros</span>");
                    } else {
                        double ant = 0;
                        double cap = n3;
                        for (int i = 1; i <= n2; i++) {
                            double montante = n3 * Math.pow((1 + n1 / 100), i);
                            double juros = montante - n3 - ant;
                            ant += juros;
                            cap = montante - juros;
                %>
                <tr>
                    <td><%=i%></td>
                    <td><%out.print(String.format("R$: " + "%.2f", cap)); %></td>
                    <td><%out.print(String.format("R$: " + "%.2f", juros)); %></td>
                    <td><%out.print(String.format("R$: " + "%.2f", montante)); %></td>
                    <%}%>
                    <%}%>
                </tr>
            </tbody>
        </table>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
    </body>
</html>

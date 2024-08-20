<%@ page import="mx.edu.utez.pruebaf.dao.HistorialUsuarioDao"%>
<%@ page import="mx.edu.utez.pruebaf.model.HistorialUsuario"%>
<%@ page import="java.util.ArrayList"%>
<%@ page contentType="text/html;charset=UTF-8"%>
<html>

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Historial de Usuarios</title>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/CSS/bootstrap.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/CSS/datatables.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/CSS/styles.css">
    <link rel="icon" href="img/logo_mini.png" type="image/x-icon">
</head>

<body>
<div class="d-flex-wrapper">
    <header>
        <div class="header-content">
            <button class="menu-btn" id="menu-btn">&#9776;</button>
            <h1 class="scad-font">Historial de Usuarios</h1>
            <img src="img/headerWave.png" alt="Header Waves" class="img-fluid">
        </div>
    </header>

    <div class="flex-grow-1 container-xl table-responsive p-2 text-center" style="width: 82rem">
        <table id="example" class="table table-striped table-hover table-bordered mt-3" style="width: 100%">
            <thead>
            <tr style="background-color: #615DFD; color: white">
                <th>ID Cambio</th>
                <th>ID Usuario</th>
                <th>Usuario</th>
                <th>Correo</th>
                <th>Acción</th>
                <th>ID Usuario 2</th>
                <th>Usuario 2</th>
                <th>Correo 2</th>
                <th>Fecha</th>
                <th>Hora</th>
            </tr>
            </thead>
            <tbody class="table-group-divider">
            <%
                HistorialUsuarioDao dao = new HistorialUsuarioDao();
                ArrayList<HistorialUsuario> lista = dao.getAll();
                for(HistorialUsuario h : lista){
            %>
            <tr style="text-align: left">
                <td><%=h.%></td>
                <td><%=h.%></td>
                <td><%=h.%></td>
                <td><%=h.%></td>
                <td><%=h.%></td>
                <td><%=h.%></td>
                <td><%=h.%></td>
                <td><%=h.%></td>
                <td><%=h.%></td>
                <td><%=h.%></td>
            </tr>
            <% } %>
            </tbody>
        </table>
    </div>

    <footer>
        <img src="img/footerWaves.png" alt="Footer waves" class="img-fluid">
    </footer>
</div>

<script src="${pageContext.request.contextPath}/JS/jquery-3.7.0.js"></script>
<script src="${pageContext.request.contextPath}/JS/bootstrap.js"></script>
<script src="${pageContext.request.contextPath}/JS/datatables.js"></script>
<script src="${pageContext.request.contextPath}/JS/dataTables.bootstrap5.js"></script>
<script src="${pageContext.request.contextPath}/JS/es-MX.json"></script>

<script>
    document.addEventListener('DOMContentLoaded', () => {
        const table = document.getElementById('example');
        new DataTable(table, {
            language: {
                url: '${pageContext.request.contextPath}/JS/es-MX.json'
            }
        });
    });
</script>
</body>
</html>

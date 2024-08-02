<%@ page import="mx.edu.utez.pruebaf.dao.UserDao"%>
<%@ page import="mx.edu.utez.pruebaf.model.User"%>
<%@ page import="java.util.ArrayList"%>
<%@ page contentType="text/html;charset=UTF-8"%>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Gestion de Activos</title>
    <link rel="stylesheet" href="CSS/bootstrap.css">
    <link rel="stylesheet" href="CSS/styles.css">
    <link rel="icon" href="img/logo_mini.png" type="image/x-icon">
</head>
<body>

<div class="d-flex-wrapper">
    <header>
        <div class="header-content">
            <button class="menu-btn" id="menu-btn">&#9776;</button>
            <h1 class="scad-font">Gestion de Activos</h1>
            <img src="img/headerWave.png" alt="Header Waves" class="img-fluid">
        </div>
    </header>


    <!-- AQUI INICIA CONTENIDO DE LA PAGINA -->

    <div class="flex-grow-1 container-md table-responsive-xxl p-2 text-center">
        <table id="example" class="table table-striped table-hover table-bordered caption-top mt-3" style="width: 100%">
            <!-- <caption style="font-size: 1.7rem">Activos</caption> -->
            <thead class="table-light">
            <tr>
                <th>ID</th>
                <th>Descripcion</th>
                <th>Observaciones</th>
                <th>Edificio</th>
                <th>Habitacion</th>
                <th>Actualizar</th>
                <th>Eliminar</th>
                <th>Mas Detalles</th>
            </tr>
            </thead>

            <tbody class="table-group-divider">

            <%
            UserDao dao = new UserDao();
            ArrayList<User> lista = dao.getAll();
                for(User u : lista){ %>
                <tr>
                    <td><%=u.getId()%></td>
                    <td><%=u.getNombre()%></td>
                    <td><%=u.getCorreo()%></td>
                    <td><%=u.isEstado() ? "Activo":"Inactivo"%></td>
                    <td><a href="login?id=<%=u.getId()%>">Actualizar</a></td>
                    <td><a href="delete?id=<%=u.getId()%>">Eliminar</a></td>
                </tr>
                <% } %>
            </tbody>
        </table>
    </div>

    <!-- AQUI TERMINA EL CONTENIDO DE LA PAGINA -->


    <footer>
        <img src="img/footerWaves.png" alt="Footer waves" class="img-fluid">
    </footer>
</div>



<script src="JS/menuHamb.js"></script>

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
<%@ page import="mx.edu.utez.pruebaf.dao.UserDao"%>
<%@ page import="mx.edu.utez.pruebaf.model.User"%>
<%@ page import="java.util.ArrayList"%>
<%@ page contentType="text/html;charset=UTF-8"%>
<html>

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Gestion de Usuarios</title>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/CSS/bootstrap.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/CSS/datatables.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/CSS/styles.css">
</head>

<body>
<div class="d-flex-wrapper">
    <header>
        <div class="header-content">
            <button class="menu-btn" id="menu-btn">&#9776;</button>
            <h1 class="scad-font">Gestion de Usuarios</h1>
            <img src="img/headerWave.png" alt="Header Waves" class="img-fluid">
        </div>
    </header>
    <!-- AQUI INICIA CONTENIDO DE LA PAGINA -->


    <div class="flex-grow-1 container-xl table-responsive p-2 text-center" style="width: 82rem">
        <table id="example" class="table table-striped table-hover table-bordered mt-3" style="width: 100%">
            <thead>
            <tr style="background-color: #615DFD; color: white">
                <th>Id</th>
                <th>Nombre</th>
                <th>Apellido</th>
                <th>Correo</th>
                <th>Puesto</th>
                <th>Admin</th>
                <th>Estado</th>
                <th>Actualizar</th>
                <th>Inhabilitar</th>
                <th>Eliminar</th>
            </tr>
            </thead>
            <tbody class="table-group-divider">
                <%
                    UserDao dao = new UserDao();
                    ArrayList<User> lista = dao.getAll();
                    for(User u : lista){
                %>
                <tr>
                    <td><%=u.getId()%></td>
                    <td><%=u.getNombre()%></td>
                    <td><%=u.getApellido()%></td>
                    <td><%=u.getCorreo()%></td>
                    <td><%=u.getPuesto()%></td>
                    <td><%=u.isAdmin()  ? "Si":"No"%></td>
                    <td><%=u.isEstado() ? "Activo":"Inactivo"%></td>
                    <td><a href="login?id=<%=u.getId()%>">Actualizar</a></td>
                    <td><a href="login?id=<%=u.getId()%>">Inhabilitar</a></td>
                    <td><a href="delete?id=<%=u.getId()%>">Eliminar</a></td>
                </tr>
                <% } %>
            </tbody>
        </table>
    </div>


    <!-- AQUI TERMINA CONTENIDO DE LA PAGINA -->
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
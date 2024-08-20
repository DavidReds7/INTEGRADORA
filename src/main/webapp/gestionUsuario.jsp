<%@ page import="mx.edu.utez.pruebaf.dao.UserDao"%>
<%@ page import="mx.edu.utez.pruebaf.model.User"%>
<%@ page import="java.util.ArrayList"%>
<%@ page contentType="text/html;charset=UTF-8"%>
<html>

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Gestión de Usuarios</title>
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
            <h1 class="scad-font">Gestion de Usuarios</h1>
            <img src="img/headerWave.png" alt="Header Waves" class="img-fluid">
        </div>
    </header>

    <div class="flex-grow-1 container-xl table-responsive p-2 text-center" style="width: 82rem">
        <table id="example" class="table table-striped table-hover table-bordered mt-3" style="width: 100%">
            <thead>
            <tr style="background-color: #615DFD; color: white">
                <th>ID</th>
                <th>Nombre</th>
                <th>Apellido</th>
                <th>Correo</th>
                <th>Puesto</th>
                <th>Admin</th>
                <th>RFC</th>
                <th>Estado</th>
                <th>Actualizar</th>
                <th>Inhabilitar</th>
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
                <td><%=u.isEsAdmin() ? "Sí" : "No"%></td>
                <td><%=u.getRfc()%></td>
                <td><%=u.isEstatus() ? "Activo" : "Inactivo"%></td>
                <td class="text-center">
                    <a onclick="openModal(<%=u.getId()%>)">
                        <img src="img/edit.png" style="width: 2rem; height: auto; cursor: pointer" alt="Actualizar">
                    </a>
                </td>
                <td>
                    <div class="form-check form-switch">
                        <input class="form-check-input" type="checkbox" role="switch" id="switch_<%=u.getId()%>" <%=u.isEstatus() ? "checked" : ""%> onchange="toggleStatus(<%=u.getId()%>)">
                        <label class="form-check-label" style="cursor: pointer" for="switch_<%=u.getId()%>"></label>
                    </div>
                </td>
            </tr>
            <% } %>
            </tbody>
        </table>
    </div>

    <!-- Modal para actualizar usuario -->
    <div class="modal fade" id="updateModal" tabindex="-1" aria-labelledby="updateModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <form id="updateForm" action="ActualizarUsuarioServlet" method="post">
                    <div class="modal-header">
                        <h5 class="modal-title fs-3 ms-2" id="updateModalLabel">Actualizar Usuario</h5>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <div class="modal-body">
                        <input type="hidden" name="id" id="userId">
                        <input type="hidden" name="codigo" id="codigoU">
                        <div class="mb-3">
                            <label for="nombre" class="form-label">Nombre</label>
                            <input type="text" class="form-control" id="nombre" name="nombre" required>
                        </div>
                        <div class="mb-3">
                            <label for="apellido" class="form-label">Apellido</label>
                            <input type="text" class="form-control" id="apellido" name="apellido" required>
                        </div>
                        <div class="mb-3">
                            <label for="correo" class="form-label">Correo</label>
                            <input type="email" class="form-control" id="correo" name="correo" required>
                        </div>
                        <div class="mb-3">
                            <label for="puesto" class="form-label">Puesto</label>
                            <input type="text" class="form-control" id="puesto" name="puesto" required>
                        </div>
                        <div class="mb-3">
                            <label for="esAdmin" class="form-label">Administrador</label>
                            <select class="form-select" id="esAdmin" name="esAdmin" required>
                                <option value="true">Sí</option>
                                <option value="false">No</option>
                            </select>
                        </div>

                        <div class="mb-3">
                            <label for="contra" class="form-label">Contraseña</label>
                            <input type="password" class="form-control" id="contra" name="contra" required>
                        </div>
                        <div class="mb-3">
                            <label for="rfc" class="form-label">RFC</label>
                            <input type="text" class="form-control" id="rfc" name="rfc" required>
                        </div>
                    </div>
                    <div class="modal-footer">
                        <button type="submit" class="btn btn-secondary gradient-button">Actualizar</button>
                    </div>
                </form>
            </div>
        </div>
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
    function openModal(id) {
        fetch('ActualizarUsuarioServlet?id=' + id)
            .then(response => response.json())
            .then(data => {
                document.getElementById('userId').value = data.id;
                document.getElementById('nombre').value = data.nombre;
                document.getElementById('apellido').value = data.apellido;
                document.getElementById('correo').value = data.correo;
                document.getElementById('puesto').value = data.puesto;
                document.getElementById('esAdmin').value = data.esAdmin;
                document.getElementById('rfc').value = data.rfc;

                var modal = new bootstrap.Modal(document.getElementById('updateModal'));
                modal.show();
            })
            .catch(error => console.error('Error al cargar los datos del usuario:', error));
    }

    function toggleStatus(id) {
        const switchElement = document.getElementById('switch_' + id);
        const newStatus = switchElement.checked ? "Activo" : "Inactivo";

        fetch('cambiarEstadoUsuarioServlet', {
            method: 'POST',
            headers: {
                'Content-Type': 'application/json'
            },
            body: JSON.stringify({ id: id, estatus: newStatus })
        })
            .then(response => response.json())
            .then(data => {
                if (data.success) {

                } else {
                    alert('Error al cambiar el estado');
                    switchElement.checked = !switchElement.checked; // Revertir cambio
                }
            })
            .catch(error => {
                console.error('Error al cambiar el estado del usuario:', error);
                switchElement.checked = !switchElement.checked; // Revertir cambio
            });
    }

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

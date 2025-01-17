<%@ page import="mx.edu.utez.pruebaf.dao.ActivoDao"%>
<%@ page import="mx.edu.utez.pruebaf.model.Activo"%>
<%@ page import="java.util.ArrayList"%>
<%@ page contentType="text/html;charset=UTF-8"%>
<%@ page import="mx.edu.utez.pruebaf.model.User"%>
<%@ page import="jakarta.servlet.http.HttpSession"%>
<%@ page import="jakarta.servlet.http.HttpSession"%>
<%@ page import="mx.edu.utez.pruebaf.model.User"%>
<%@ page import="mx.edu.utez.pruebaf.dao.UserDao" %>
<html>

<!DOCTYPE html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Gestion de Activos</title>
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
            <h1 class="scad-font">Gestion de Activos</h1>
            <img src="img/headerWave.png" alt="Header Waves" class="img-fluid">
        </div>
    </header>
    <!-- AQUI INICIA CONTENIDO DE LA PAGINA -->

    <div class="flex-grow-1 container-xl table-responsive p-2 text-center" style="width: 82rem">
        <div class="row justify-content-end" style="width: 100%;">
            <a href="registrarActivo.jsp" type="button" class="btn gradient-button mb-0 fs-6 me-3" style="width: 12rem; height: 2.5rem">Agregar Activo</a>
        </div>
        <div class="row" style="width: 100%;">
            <table id="example" class="table table-striped table-hover table-bordered mt-3" style="width: 100%">
                <thead>
                <tr class="text-center" style="background-color: #615DFD; color: white">
                <th>ID</th>
                <th>Codigo</th>
                <th>Nombre</th>
                <th>Descripcion</th>
                <th>Observaciones</th>
                <th>Edificio</th>
                <th>Habitacion</th>
                <th>Actualizar</th>
                <th>Eliminar</th>
                <th>Detalles</th>
            </tr>
            </thead>

            <tbody class="table-group-divider">
                <%
                    ActivoDao dao = new ActivoDao();
                    ArrayList<Activo> lista = dao.getAll();
                    for(Activo a : lista){
                %>
                <tr>
                    <td><%=a.getIdActivo()%></td>
                    <td><%=a.getCodigo()%></td>
                    <td><%=a.getNombre_activo()%></td>
                    <td><%=a.getDescripcion()%></td>
                    <td><%=a.getObservaciones()%></td>
                    <td><%=a.getEdificio()%></td>
                    <td><%=a.getHabitacion()%></td>
                    <td class="text-center"><a href="ActualizarActivo?codigo=<%=a.getCodigo()%>">
                        <img src="img/edit.png" style="width: 2rem; height: auto" alt="Actualizar"></a>
                    </td>
                    <td class="text-center"><a href="deleteActivo?codigo=<%=a.getCodigo()%>">
                        <img src="img/botonEliminar.png" style="width: 2rem; height: auto" alt="Eliminar"></a>
                    </td>
                    <td class="text-center">
                        <button type="button" style="border: none; background-color: transparent;"  id="boton_detalles" onclick="pedir_detalles('<%=a.getCodigo()%>')">
                        <img src="img/info.png" style="width: 2rem; height: auto; cursor: pointer" alt="Mas Detalles"
                             data-bs-toggle="modal" data-bs-target="#infoModal" >
                        </button>
                    </td>
                </tr>
                <% } %>
            </tbody>
        </table>
        </div>



        <!-- Modal para mas informacion del activo -->
        <div class="modal fade" id="infoModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog modal-dialog-centered modal-xl" style="max-width: 72rem">
                <div class="modal-content">
                    <div class="modal-header">
                        <h1 class="modal-title fs-3 ms-2" id="exampleModalLabel">Detalles</h1>
                        <button type="button" class="btn-close me-3" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <div class="modal-body">

                        <table id="tablaModal" class="table table-striped table-hover table-bordered caption-top mt-3" style="width: 100%">
                            <thead>
                            <tr style="background-color: #615DFD; color: white">
                                <th>Codigo</th>
                                <th>Nombre</th>
                                <th>Especificaciones</th>
                                <th>Marca</th>
                                <th>Modelo</th>
                                <th>No. Serie</th>
                            </tr>
                            </thead>
                            <tbody class="table-group-divider">
                            <tr id="detalles">
                            </tr>
                            </tbody>
                        </table>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary gradient-button me-3" style="width: 9rem" data-bs-dismiss="modal">Cerrar</button>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <div class="flex-shrink-0 p-3 menu" id="menu">
        <button class="close-btn" id="close-btn">&#9776;</button>
        <a href="menuPrincipal.jsp" class="mb-0 fs-2 menu-tt scad-font" style="text-decoration: none; color: white; font-size: 1.2rem">SCAD</a>
        <ul class="list-unstyled ps-0">
            <li class="border-top mt-5 mb-3"></li>
            <li class="mb-4">
                <button class="btn btn-toggle d-inline-flex align-items-center rounded border-0 collapsed" data-bs-toggle="collapse" data-bs-target="#home-collapse" aria-expanded="false">
                    Gestion de Activos
                </button>
                <div class="collapse" id="home-collapse">
                    <ul class="btn-toggle-nav list-unstyled fw-normal pb-1 small">
                        <li><a href="registrarActivo.jsp" class="link-light d-inline-flex text-decoration-none rounded">Agregar activo</a></li>
                        <li><a href="gestionActivos.jsp" class="link-light d-inline-flex text-decoration-none rounded">Mostrar activos</a></li>
                    </ul>
                </div>
            </li>
            <li class="mb-4">
                <button class="btn btn-toggle d-inline-flex align-items-center rounded border-0 collapsed" data-bs-toggle="collapse" data-bs-target="#dashboard-collapse" aria-expanded="false">
                    Reportes
                </button>
                <div class="collapse" id="dashboard-collapse">
                    <ul class="btn-toggle-nav list-unstyled fw-normal pb-1 small">
                        <li><a href="pdf" class="link-light d-inline-flex text-decoration-none rounded">Generar reporte PDF</a></li>
                        <li><a href="revActivos.jsp" class="link-light d-inline-flex text-decoration-none rounded">Revision de activos</a></li>
                        <li><a href="historialActivos.jsp" class="link-light d-inline-flex text-decoration-none rounded">Historial de cambios</a></li>
                    </ul>
                </div>
            </li>
            <li class="mb-4">
                <button class="btn btn-toggle d-inline-flex align-items-center rounded border-0 collapsed" data-bs-toggle="collapse" data-bs-target="#orders-collapse" aria-expanded="false">
                    Administracion de Usuarios
                </button>
                <div class="collapse" id="orders-collapse">
                    <ul class="btn-toggle-nav list-unstyled fw-normal pb-1 small">
                        <li><a href="registrarUsuario.jsp" class="link-light d-inline-flex text-decoration-none rounded">Agregar usuario</a></li>
                        <li><a href="gestionUsuario.jsp" class="link-light d-inline-flex text-decoration-none rounded">Mostrar usuarios</a></li>
                    </ul>
                </div>
            </li>
            <li class="border-top my-3"></li>
        </ul>



        <div class="dropdown">
            <a href="#" class="d-flex align-items-center link-light text-decoration-none dropdown-toggle" data-bs-toggle="dropdown" aria-expanded="false">
                <img src="img/scad.png" alt="" width="32" height="32" class="rounded-circle me-2">
                <%
                    HttpSession sesion = request.getSession();
                    User u = (User) sesion.getAttribute("usuario");
                %>
                <strong class="ms-2 fs-5" style="color: white"><%= u.getNombre() %> | <%= u.getPuesto() %></strong>

            </a>
            <ul class="dropdown-menu text-small shadow ms-5" style="text-align: center; background-color: rgba(232, 245, 255, 0.5)">
                <li><a class="dropdown-item" href="<%= request.getContextPath() %>/CerrarSesion">Cerrar sesión</a></li>
            </ul>
        </div>
    </div>

    <!-- AQUI TERMINA EL CONTENIDO DE LA PAGINA -->

    <footer>
        <img src="img/footerWaves.png" alt="Footer waves" class="img-fluid">
    </footer>
</div>



<script src="JS/menuHamb.js"></script>
<script src="JS/bootstrap.bundle.js"></script>
<script src="JS/bootstrap.js"></script>

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

<script>
    function pedir_detalles(codi){
        //Es un tr
        var detalles = document.getElementById("detalles");
        detalles.innerHTML = "";

        fetch('getActivoDetalles?codigo='+codi,{
            method: 'GET'
        }).then(response => {
            return response.text();
        }).then(data => {
            data = JSON.parse(data);
            //console.log(data);

            //Coigo Activo
            var cod = document.createElement("td");
            cod.innerText = data.codigo;
            detalles.appendChild(cod);

            //Nombre
            var nom = document.createElement("td");
            nom.innerText = data.nombre_activo;
            detalles.appendChild(nom);

            //Especificaciones
            var esp = document.createElement("td");
            esp.innerText = data.especificaciones;
            detalles.appendChild(esp);

            //Marca
            var marc = document.createElement("td");
            marc.innerText = data.marca;
            detalles.appendChild(marc);

            //Modelo
            var mod = document.createElement("td");
            mod.innerText = data.modelo;
            detalles.appendChild(mod);

            //No. Serie
            var numS = document.createElement("td");
            numS.innerText = data.num_serie;
            detalles.appendChild(numS);


        }).catch(error =>{
            console.log("Ocurrio un error: ", error)
        });
    }


</script>


<script src="JS/bootstrap.bundle.js"></script>
<script src="JS/menuHamb.js"></script>

</body>
<html>
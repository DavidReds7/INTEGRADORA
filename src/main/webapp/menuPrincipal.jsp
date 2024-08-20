<%@ page contentType="text/html;charset=UTF-8"%>
<%@ page import="mx.edu.utez.pruebaf.model.User"%>
<%@ page import="jakarta.servlet.http.HttpSession"%>
<%@ page import="jakarta.servlet.http.HttpSession"%>
<%@ page import="mx.edu.utez.pruebaf.model.User"%>
<%@ page import="mx.edu.utez.pruebaf.dao.UserDao" %>

<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Menu principal</title>
    <link rel="stylesheet" href="CSS/bootstrap.css">
    <link rel="stylesheet" href="CSS/styles.css">
    <link rel="icon" href="img/logo_mini.png" type="image/x-icon">
</head>
<body>

<div class="d-flex-wrapper">
    <header>
        <div class="header-content">
            <button class="menu-btn" id="menu-btn">&#9776;</button>
            <h1 class="scad-font">Menu Principal</h1>
            <img src="img/headerWave.png" alt="Header Waves" class="img-fluid">
        </div>
    </header>
    <!-- AQUI INICIA CONTENIDO DE LA PAGINA -->

    <!-- CONTENIDO DEL MENU PRINCIPAL (3 BOTONES) -->
    <div class="container-fluid flex-grow-1 pt-5" style="background-color: #E8F5FF; text-align: center">
        <div class="row pb-5">
            <div class="col" style="text-align: center">
                <a class="menuButtons gradient-button" href="gestionActivos.jsp" role="button">Gestion de Activos</a>
            </div>
            <div class="col">
                <a class="menuButtons gradient-button" href="menuReportes.jsp" type="button">Reportes</a>
            </div>
            <div class="col">
                <a class="menuButtons gradient-button" href=gestionUsuario.jsp type="button">Administracion de Usuarios</a>
            </div>
        </div>
    </div>

    <!-- AQUI TERMINA EL MENU PRINCIPAL, EL CODIGO QUE SIGUE ES PARA EL MENU DE HAMBURGUESA -->

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
                <img src="img/user.png" alt="" width="32" height="32" class="rounded-circle me-2">
                <%
                    HttpSession sesion = request.getSession();
                    User u = (User) sesion.getAttribute("usuario");
                %>
                <strong style="color: white"><%= u.getPuesto() %> | <%= u.getNombre() %></strong>

            </a>
            <ul class="dropdown-menu text-small shadow ms-5" style="text-align: center; background-color: rgba(232, 245, 255, 0.5)">
                <li><a class="dropdown-item" href="<%= request.getContextPath() %>/CerrarSesion">Cerrar sesión</a></li>
            </ul>
        </div>
    </div>

    <!-- AQUI TERMINA CONTENIDO DE LA PAGINA -->
    <footer>
        <img src="img/footerWaves.png" alt="Footer waves" class="img-fluid">
    </footer>
</div>

<script src="JS/bootstrap.bundle.js"></script>
<script src="JS/menuHamb.js"></script>


</body>
</html>
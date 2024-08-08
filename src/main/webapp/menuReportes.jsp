<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Reportes</title>
    <link rel="stylesheet" href="CSS/bootstrap.css">
    <link rel="stylesheet" href="CSS/styles.css">
    <link rel="icon" href="img/logo_mini.png" type="image/x-icon">
</head>
<body>

<div class="d-flex-wrapper">
    <header>
        <div class="header-content">
            <button class="menu-btn" id="menu-btn">&#9776;</button>
            <h1 class="scad-font">Reportes</h1>
            <img src="img/headerWave.png" alt="Header Waves" class="img-fluid">
        </div>
    </header>

    <!-- CONTENIDO DEL MENU REPORTES (2 BOTONES) -->
    <div class="container-fluid flex-grow-1 pt-5" style="background-color: #E8F5FF; text-align: center">
        <div class="row pb-5 gx-5">
            <div class="col" style="text-align: center">
                <a class="menuButtons gradient-button" href="revActivos.jsp" role="button">Revisión de Activos</a>
            </div>
            <div class="col">
                <a class="menuButtons gradient-button" href="pdf" type="button">Generar Reporte</a>
            </div>
        </div>
    </div>

    <footer>
        <img src="img/footerWaves.png" alt="Footer waves" class="img-fluid">
    </footer>
</div>

<!-- <script src="JS/menuHamb.js"></script> -->

</body>
</html>
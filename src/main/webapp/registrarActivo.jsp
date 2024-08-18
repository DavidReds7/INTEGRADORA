<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Agregar Activo</title>
    <link rel="stylesheet" href="CSS/bootstrap.css">
    <link rel="stylesheet" href="CSS/styles.css">
    <link rel="icon" href="img/logo_mini.png" type="image/x-icon">
</head>
<body>

<div class="d-flex-wrapper">
    <header>
        <div class="header-content">
            <button class="menu-btn" id="menu-btn">&#9776;</button>
            <h1 class="scad-font">Agregar Activo</h1>
            <img src="img/headerWave.png" alt="Header Waves" class="img-fluid">
        </div>
    </header>
    <!-- AQUI INICIA CONTENIDO DE LA PAGINA -->


    <div class="flex-grow-1 container-sm mt-3">
        <form class="needs-validation" action="registrarActivo" novalidate>
            <div class="row mb-3"> <!-- Fila 1 -->
                <div class="col"> <!-- Columna 2 -->
                    <label for="codigoAct" class="form-label">Codigo</label>
                    <input type="text" class="form-control" id="codigoAct" name="codigoAct" required>
                    <div class="invalid-feedback">Ingresa un codigo</div>
                </div>

                <div class="col"> <!-- Columna 1 -->
                    <label for="nombreAct" class="form-label">Nombre del Activo</label>
                    <input type="text" class="form-control" id="nombreAct" name="nombreAct" required>
                    <div class="invalid-feedback">Ingresa el nombre del activo, ó sin numeros</div>
                </div>



                <div class="col"> <!-- Columna 3 -->
                    <label for="espeAct" class="form-label">Especificaciones</label>
                    <input type="text" class="form-control" id="espeAct" name="espeAct" required>
                    <div class="invalid-feedback">Ingresa las especificaciones</div>
                </div>
            </div>

            <div class="row mb-3"> <!-- Fila 2 -->
                <div class="col"> <!-- Columna 1 -->
                    <label for="marcaAct" class="form-label">Marca</label>
                    <input type="text" class="form-control" id="marcaAct" name="marcaAct" required>
                    <div class="invalid-feedback">Ingresa la marca</div>
                </div>

                <div class="col"> <!-- Columna 2 -->
                    <label for="modAct" class="form-label">Modelo</label>
                    <input type="text" class="form-control" id="modAct" name="modAct" required>
                    <div class="invalid-feedback">Ingresa el modelo</div>
                </div>

                <div class="col"> <!-- Columna 3 -->
                    <label for="numAct" class="form-label">No. Serie</label>
                    <input type="text" class="form-control" id="numAct" name="numAct" required>
                    <div class="invalid-feedback">Ingresa el número de serie</div>
                </div>
            </div>

            <div class="row mb-3"> <!-- Fila 3 -->
                <div class="col mb-3"> <!-- Columna 1 -->
                    <label for="obsAct" class="form-label">Observaciones</label>
                    <input type="text" class="form-control" id="obsAct" name="obsAct">
                </div>

                <div class="col"> <!-- Columna 2 -->
                    <label for="edifAct" class="form-label">Edificio</label>
                    <select class="form-select" aria-label="seleccionar edificio" id="edifAct" name="edifAct" required>
                        <option value="" selected>Seleccionar...</option>
                        <option value="1">Docencia 1</option>
                        <option value="2">Docencia 2</option>
                        <option value="3">Cecadec</option>
                    </select>
                    <div class="invalid-feedback">Selecciona un edificio</div>
                </div>

                <div class="col"> <!-- Columnna 3 -->
                    <label for="habAct" class="form-label">Habitación</label>
                    <select class="form-select" aria-label="seleccionar edificio" id="habAct" name="habAct" required>
                        <option value="" selected>Seleccionar...</option>
                        <option value="1">A11</option>
                        <option value="2">A13</option>
                        <option value="3">A15</option>
                    </select>
                    <div class="invalid-feedback">Selecciona una habitación</div>
                </div>
                <div class="col">
                    <div class="col"> <!-- Columna 2 -->
                        <label for="descripAct" class="form-label">Descripción</label>
                        <input type="text" class="form-control" id="descripAct" name="descripAct" required>
                        <div class="invalid-feedback">Ingresa una descripción</div>
                    </div>
                </div>

            </div>
            <div class="row justify-content-end me-1"> <!-- Fila 4 -->
                <input type="hidden" name="operacion" value="registar">
                <button type="submit" class="btn gradient-button mb-0" style="width: 22rem;">Agregar</button>
            </div>
        </form>
    </div>


    <!-- AQUI TERMINA EL CONTENIDO DE LA PAGINA -->
    <footer>
        <img src="img/footerWaves.png" alt="Footer waves" class="img-fluid">
    </footer>
</div>

<script>
    (() => {
        'use strict'

        const forms = document.querySelectorAll('.needs-validation')

        Array.from(forms).forEach(form => {
            form.addEventListener('submit', event => {

                const selects = form.querySelectorAll('select[required]');
                let allSelectsValid = true;
                selects.forEach(select => {
                    if (select.value === "") {
                        select.classList.add('is-invalid');
                        allSelectsValid = false;
                    } else {
                        select.classList.remove('is-invalid');
                        select.classList.add('is-valid');
                    }
                });

                const nombreAct = form.querySelector('#nombreAct');
                const nombreActValue = nombreAct.value;
                const nombreActValid = /^[a-zA-Z\s]+$/.test(nombreActValue);

                if (!nombreActValid) {
                    nombreAct.classList.add('is-invalid');
                } else {
                    nombreAct.classList.remove('is-invalid');
                    nombreAct.classList.add('is-valid');
                }

                if (!form.checkValidity() || !allSelectsValid || !nombreActValid) {
                    event.preventDefault()
                    event.stopPropagation()
                }

                form.classList.add('was-validated')
            }, false)
        })
    })()
</script>

<!--
<script src="JS/bootstrap.bundle.min.js"></script>
<script src="JS/menuHamb.js"></script> -->

</body>
</html>
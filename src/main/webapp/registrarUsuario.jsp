<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Agregar Usuario</title>
    <link rel="stylesheet" href="CSS/bootstrap.css">
    <link rel="stylesheet" href="CSS/styles.css">
    <link rel="icon" href="img/logo_mini.png" type="image/x-icon">
</head>
<body>

<div class="d-flex-wrapper">
    <header>
        <div class="header-content">
            <button class="menu-btn" id="menu-btn">&#9776;</button>
            <h1 class="scad-font">Agregar Usuario</h1>
            <img src="img/headerWave.png" alt="Header Waves" class="img-fluid">
        </div>
    </header>
    <!-- AQUI INICIA CONTENIDO DE LA PAGINA -->

    <div class="flex-grow-1 container-sm mt-3">
        <form class="needs-validation" action="registrarUsuario" method="post" novalidate>
            <div class="row mb-5 mt-2"> <!-- Fila 1 -->
                <div class="col"> <!-- Columna 1 -->
                    <label for="nombreUs" class="form-label">Nombre:</label>
                    <input type="text" class="form-control" id="nombreUs" name="nombreUs" maxlength="20" required>
                    <div class="invalid-feedback">Ingresa el nombre del usuario o ingrésalo sin números</div>
                </div>

                <div class="col"> <!-- Columna 2 -->
                    <label for="apellidoUs" class="form-label">Apellido:</label>
                    <input type="text" class="form-control" id="apellidoUs" name="apellidoUs" maxlength="20" required>
                    <div class="invalid-feedback">Ingresa el apellido</div>
                </div>

                <div class="col"> <!-- Columna 3 -->
                    <label for="correoInsti" class="form-label">Correo:</label>
                    <input type="email" class="form-control" id="correoInsti" name="correoInsti" maxlength="50" required>
                    <div class="invalid-feedback">Ingresa un correo válido</div>
                </div>
            </div>

            <div class="row mb-5"> <!-- Fila 2 -->
                <div class="col"> <!-- Columna 1 -->
                    <label for="PuestUs" class="form-label">Puesto:</label>
                    <input type="text" class="form-control" id="PuestUs" name="PuestUs" maxlength="30" required>
                    <div class="invalid-feedback">Ingresa el puesto</div>
                </div>

                <div class="col"> <!-- Columna 2 -->
                    <label for="rfc" class="form-label">RFC:</label>
                    <input type="text" class="form-control" id="rfc" name="rfc" maxlength="15" required>
                    <div class="invalid-feedback">Ingresa tu RFC</div>
                </div>

                <div class="col"> <!-- Columna 3 -->
                    <label for="adminUs" class="form-label">Administrador:</label>
                    <select class="form-select" id="adminUs" name="adminUs" required>
                        <option value="" selected>Seleccionar...</option>
                        <option value="true">Sí</option>
                        <option value="false">No</option>
                    </select>
                    <div class="invalid-feedback">Selecciona una opción</div>
                </div>

            </div>

            <div class="row mb-5"> <!-- Fila 3 -->
                <div class="col"> <!-- Columna 1 -->
                    <label for="contra1" class="form-label">Contraseña:</label>
                    <input type="password" class="form-control" id="contra1" name="contra1" maxlength="20" required>
                    <div class="invalid-feedback">Ingresa una contraseña</div>
                </div>

                <div class="col"> <!-- Columna 2 -->
                    <label for="contra2" class="form-label">Confirmar Contraseña:</label>
                    <input type="password" class="form-control" id="contra2" name="contra2" maxlength="20" required>
                    <div class="invalid-feedback">Confirma tu contraseña</div>
                </div>

                <div class="col mt-4"> <!-- Columna 3 -->
                    <div class="row justify-content-end me-1"> <!-- Fila 4 -->
                        <button type="submit" class="btn gradient-button mb-0" style="width: 22rem;">Agregar</button>
                    </div>
                </div>
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

                const nombreUs = form.querySelector('#nombreUs');
                const nombreUsValue = nombreUs.value;
                const nombreUsValid = /^[a-zA-Z\s]+$/.test(nombreUsValue);

                if (!nombreUsValid) {
                    nombreUs.classList.add('is-invalid');
                } else {
                    nombreUs.classList.remove('is-invalid');
                    nombreUs.classList.add('is-valid');
                }

                const contra1 = form.querySelector('#contra1');
                const contra2 = form.querySelector('#contra2');
                let contrasenasValidas = true;

                if (contra1.value !== contra2.value) {
                    contra2.classList.add('is-invalid');
                    contrasenasValidas = false;
                } else {
                    contra2.classList.remove('is-invalid');
                    contra2.classList.add('is-valid');
                }

                if (!form.checkValidity() || !allSelectsValid || !nombreUsValid || !contrasenasValidas) {
                    event.preventDefault();
                    event.stopPropagation();
                }

                form.classList.add('was-validated');
            }, false);
        });
    })();
</script>

</body>
</html>
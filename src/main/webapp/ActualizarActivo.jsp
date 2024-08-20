<%@ page import="mx.edu.utez.pruebaf.model.Activo"%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>

<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Actualizar Activo</title>
    <link rel="stylesheet" href="CSS/bootstrap.css">
    <link rel="stylesheet" href="CSS/styles.css">
    <link rel="icon" href="img/logo_mini.png" type="image/x-icon">
</head>
<body>

<div class="d-flex-wrapper">
    <header>
        <div class="header-content">
            <button class="menu-btn" id="menu-btn">&#9776;</button>
            <h1 class="scad-font">Actualizar Activo</h1>
            <img src="img/headerWave.png" alt="Header Waves" class="img-fluid">
        </div>
    </header>
    <!-- AQUI INICIA CONTENIDO DE LA PAGINA -->

    <%
        HttpSession sesion = request.getSession();
        Activo ac = (Activo) sesion.getAttribute("activo");
        if (ac != null) { %>

    <div class="flex-grow-1 container-sm mt-4">
        <form class="needs-validation" action="registrarActivo" novalidate>
            <div class="row mb-3"> <!-- Fila 1 -->
                <div class="col mb-3"> <!-- Columna 1 -->
                    <label for="codigoAct" class="form-label">Código:</label>
                    <input type="text" class="form-control" id="codigoAct" name="codigoAct" maxlength="20" required value="<%=ac.getCodigo()%>">
                    <div class="invalid-feedback">Ingresa un código</div>
                </div>

                <div class="col"> <!-- Columna 2 -->
                    <label for="nombreAct" class="form-label">Nombre del Activo:</label>
                    <input type="text" class="form-control" id="nombreAct" name="nombreAct" maxlength="20" required value="<%=ac.getNombre_activo()%>">
                    <div class="invalid-feedback">Ingresa el nombre del activo, ó ingrésalo sin números</div>
                </div>

                <div class="col"> <!-- Columna 3 -->
                    <label for="espeAct" class="form-label">Especificaciones:</label>
                    <input type="text" class="form-control" id="espeAct" name="espeAct" maxlength="50" required value="<%=ac.getEspecificaciones()%>">
                    <div class="invalid-feedback">Ingresa las especificaciones</div>
                </div>
            </div>

            <div class="row mb-3"> <!-- Fila 2 -->
                <div class="col mb-3"> <!-- Columna 1 -->
                    <label for="marcaAct" class="form-label">Marca:</label>
                    <input type="text" class="form-control" id="marcaAct" name="marcaAct" maxlength="20" required value="<%=ac.getMarca()%>">
                    <div class="invalid-feedback">Ingresa la marca</div>
                </div>

                <div class="col"> <!-- Columna 2 -->
                    <label for="modAct" class="form-label">Modelo:</label>
                    <input type="text" class="form-control" id="modAct" name="modAct" maxlength="20" required value="<%=ac.getModelo()%>">
                    <div class="invalid-feedback">Ingresa el modelo</div>
                </div>

                <div class="col"> <!-- Columna 3 -->
                    <label for="numAct" class="form-label">No. Serie:</label>
                    <input type="text" class="form-control" id="numAct" name="numAct" maxlength="50" required value="<%=ac.getNum_serie()%>">
                    <div class="invalid-feedback">Ingresa el número de serie</div>
                </div>
            </div>

            <div class="row mb-3"> <!-- Fila 3 -->
                <div class="col mb-3"> <!-- Columna 1 -->
                    <label for="obsAct" class="form-label">Observaciones:</label>
                    <input type="text" class="form-control" id="obsAct" name="obsAct" maxlength="100" value="<%=ac.getObservaciones()%>">
                </div>

                <div class="col"> <!-- Columna 2 -->
                    <label for="descripAct" class="form-label">Descripción:</label>
                    <input type="text" class="form-control" id="descripAct" name="descripAct" maxlength="100" required value="<%=ac.getDescripcion()%>">
                    <div class="invalid-feedback">Ingresa una descripción</div>
                </div>
            </div>


            <div class="row mb-3"> <!-- Fila 4 -->
                <div class="col mb-3"> <!-- Columna 1 -->
                    <label for="edifAct" class="form-label">Edificio:</label>
                    <select class="form-select" aria-label="seleccionar edificio" id="edifAct" name="edifAct" required>
                        <option value="" selected>Seleccionar...</option>
                        <option value="1">Docencia 1</option>
                        <option value="2">Docencia 2</option>
                        <option value="3">Docencia 4</option>
                        <option value="4">CEDIM</option>
                        <option value="5">CECADEC</option>
                        <option value="6">Taller Pesado 2</option>
                    </select>
                    <div class="invalid-feedback">Selecciona un edificio</div>
                </div>

                <div class="col"> <!-- Columna 2 -->
                    <label for="habAct" class="form-label">Habitación:</label>
                    <select class="form-select" aria-label="seleccionar habitación" id="habAct" name="habAct" required disabled>
                        <option value="" selected>Seleccionar...</option>
                    </select>
                    <div class="invalid-feedback">Selecciona una habitación</div>
                </div>

                <!-- Campo oculto para enviar el número entero -->
                <input type="hidden" id="combinacionId" name="combinacionId" value="">

                <script>
                    var habitaciones = {
                        '1': { 'A1': 1, 'A2': 2, 'A3': 3, 'A4': 4, 'A5': 5, 'A6': 6, 'A7': 7, 'A8': 8, 'A9': 9,
                            'A14': 10, 'A15': 11, 'A16': 12, 'A17': 13, 'Taller Modelado': 14, 'Aula Tutorías': 15, 'S1': 16,
                            'S2': 17, 'Cubículos': 18, 'Dirección': 19 }, // Docencia 1

                        '2': { 'S16': 20, 'S17': 21 }, // Docencia 2

                        '3': { 'CA1': 22, 'CA2': 23, 'CA3': 24, 'CC4': 25, 'CC11': 26,
                            'Taller Dibujo': 27, 'Set Foto y Video': 28},  // Docencia 4

                        '4': { 'Taller Patronaje': 29, 'Taller Dibujo': 30, 'Taller Confección': 31,
                            'Lab. Textiles y Acabados': 32, 'CC1': 33, 'CC2': 34, 'Cubículos': 35, }, // Cedim

                        '5': { 'Cubículos': 36, 'Person View': 37, 'CC10': 38, 'Aula Doble': 39, 'A1': 40,
                            '6Ti': 41, 'Cableado Estructurado': 42, }, // Cecadec

                        '6': { 'Taller Proyectos 2': 43 }  // Taller pesado 2

                    };

                    document.getElementById('edifAct').addEventListener('change', function() {
                        var edificioSeleccionado = this.value;
                        var habSelect = document.getElementById('habAct');

                        habSelect.innerHTML = '<option value="" selected>Seleccionar...</option>';

                        if (edificioSeleccionado) {
                            habSelect.disabled = false;
                            for (var habitacion in habitaciones[edificioSeleccionado]) {
                                var option = document.createElement('option');
                                option.value = habitacion;
                                option.text = habitacion;
                                habSelect.add(option);
                            }
                        } else {
                            habSelect.disabled = true;
                        }
                    });

                    document.getElementById('habAct').addEventListener('change', function() {
                        var edificioSeleccionado = document.getElementById('edifAct').value;
                        var habitacionSeleccionada = this.value;
                        var combinacionId = habitaciones[edificioSeleccionado][habitacionSeleccionada];

                        // Establecer el valor del input oculto
                        document.getElementById('combinacionId').value = combinacionId || '';
                    });
                </script>

                <div class="col mt-2 text-center align-content-center"> <!-- Columna 3 -->
                    <button type="submit" class="btn gradient-button mb-0" style="width: 24rem;">Actualizar</button>
                </div>
            </div>


        </form>
    </div>
    <% } %>
    <%
        sesion.removeAttribute("activo");
    %>


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
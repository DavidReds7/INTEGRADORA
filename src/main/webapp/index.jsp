<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>SCAD</title>
    <link rel="stylesheet" href="CSS/styles.css">
    <link rel="stylesheet" href="CSS/bootstrap.css">
    <link rel="icon" href="img/logo_mini.png" type="image/x-icon">
</head>
<body>

<div class="d-flex-wrapper">
    <header>
        <img src="img/headerWave.png" alt="Header Waves" class="img-fluid">
    </header>
    <!-- INICIO DEL CONTENIDO DE LA PAGINA -->

    <div class="flex-grow-1 modal position-static d-block pt-0 pb-0 position-relative" style="background-color: #E8F5FF; height: 5px" tabindex="-1" role="dialog" id="modalSignin">
        <div class="modal-dialog" role="document" style="max-width: 55rem">
            <div class="modal-content rounded-4 shadow">
                <div class="row">
                    <div class="col rounded-start-4" style="background: linear-gradient(45grad, #4D49FD, #0dcaf0)">
                        <div class="row justify-content-center">
                            <img src="img/nombreScad.png" class="pt-3 mt-5 mb-4" alt="nombreSCAD" style="width: 15rem; height: auto">
                            <hr class="hrInicio" style="width: 19rem">
                            <img src="img/descripScad.png" alt="descripcionSCAD" class="mb-4 pb-2" style="width: max-content; height: auto">
                        </div>
                        <div class="row justify-content-center">
                            <div class="col text-center">
                                <img src="img/utezLogo.png" alt="descripcionSCAD" style="width: 8rem; height: auto">
                            </div>
                            <div class="col text-center align-content-center">
                                <img src="img/mpLogo.png" alt="descripcionSCAD" style="width: 12rem; height: auto">
                            </div>
                        </div>
                    </div>
                    <div class="col-7">
                        <div class="modal-header px-5 py-4 border-bottom-0">
                            <h1 class="fw-bold mb-0 fs-3">Inicio de sesión</h1>
                        </div>

                        <div class="modal-body px-5 pt-0 pb-3">
                            <form method="post" action="login" class="needs-validation" novalidate style="text-align: center">
                                <div class="form-floating mb-3">
                                    <input type="email" name="correoU" class="form-control rounded-3" id="floatingInput" placeholder="nombre@utez.edu.com" required>
                                    <label for="floatingInput">Correo electrónico</label>
                                    <div class="invalid-feedback">Ingrese su correo electrónico</div>
                                </div>
                                <div class="form-floating mb-3">
                                    <input type="password" name="contra" class="form-control rounded-3" id="floatingPassword" placeholder="Contraseña" required>
                                    <label for="floatingPassword">Contraseña</label>
                                    <div class="invalid-feedback">Ingrese su contraseña</div>
                                </div>

                                <%
                                    HttpSession sesion = request.getSession();
                                    if(sesion.getAttribute("mensaje")==null){
                                        // Significa que aun no existe un atributo mensaje
                                    } else {
                                        String mensaje = (String) sesion.getAttribute("mensaje");
                                %>
                                <p style="color: red"><%=mensaje%></p>
                                <%
                                    }
                                %>

                                <button class="w-100 gradient-button mb-3" type="submit">Ingresar</button>
                                <a href="recuperarContra.html" class="text-decoration-none" style="color: #0c63e4">¿Olvidaste tu contraseña?</a>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <!-- FIN DEL CONTENIDO DE LA PAGINA -->
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


                if (!form.checkValidity() || !allSelectsValid) {
                    event.preventDefault()
                    event.stopPropagation()
                }

                form.classList.add('was-validated')
            }, false)
        })
    })()
</script>


</body>
</html>
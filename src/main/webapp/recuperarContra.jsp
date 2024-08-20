<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Recuperar Cuenta</title>
    <link rel="stylesheet" href="CSS/styles.css">
    <link rel="stylesheet" href="CSS/bootstrap.css">
    <link rel="icon" href="img/logo_mini.png" type="image/x-icon">
</head>
<body>

<div class="d-flex-wrapper">
    <header>
        <div class="header-content">
            <h1 class="scad-font">Recuperar Cuenta</h1>
            <img src="img/headerWave.png" alt="Header Waves" class="img-fluid">
        </div>
    </header>
    <!-- INICIO DEL CONTENIDO DE LA PAGINA -->


    <div class="flex-grow-1 modal position-static d-block pt-5 pb-0 position-relative" style="background-color: #E8F5FF; height: 5px; text-align: center" tabindex="-1" role="dialog" id="modalSignin">
        <div class="modal-dialog pt-3" role="document" style="max-width: 40rem">
            <div class="modal-content rounded-4 shadow">
                <div class="row">
                    <div class="col" >
                        <div class="modal-header px-5 py-4 border-bottom-0">
                            <h1 class="fw-bold mb-2 fs-3">Ingrese su correo electrónico</h1>
                        </div>

                        <div class="modal-body px-5 pt-0 pb-3">
                            <form method="post" action="recuContra" class="needs-validation" novalidate style="text-align: center">

                                <div class="form-floating mb-4">
                                    <input type="email" name="correo" class="form-control rounded-3" id="floatingInput" placeholder="nombre@utez.edu.com" required>
                                    <label for="floatingInput" style="color: gray">Correo electrónico</label>
                                    <div class="invalid-feedback">Ingrese su correo electrónico</div>
                                </div>

                                <button class="w-100 gradient-button mb-3" type="submit">Enviar enlace de recuperación</button>

                                <%
                                    HttpSession sesion = request.getSession();
                                    if(sesion.getAttribute("mensaje")==null){
                                        // Significa que aun no existe un atributo mensaje
                                    } else {
                                        String mensaje = (String) sesion.getAttribute("mensaje");
                                %>
                                <p style="color: #0c63e4"><%=mensaje%></p>
                                <%
                                    }
                                %>

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
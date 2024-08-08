<%@ page import="mx.edu.utez.pruebaf.dao.ActivoDao"%>
<%@ page import="mx.edu.utez.pruebaf.model.Activo"%>
<%@ page import="java.util.ArrayList"%>
<%@ page contentType="text/html;charset=UTF-8"%>

<!DOCTYPE html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Revision de Activos</title>
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
        <table id="example" class="table table-striped table-hover table-bordered mt-3" style="width: 100%">
            <thead>
            <tr style="background-color: #615DFD; color: white">
                <th>Codigo</th>
                <th>Nombre</th>
                <th>Descripcion</th>
                <th>Observaciones</th>
                <th>Edificio</th>
                <th>Habitacion</th>
                <th >Actualizar</th>
                <th >Eliminar</th>
                <th >Observaciones</th>
            </tr>
            </thead>

            <tbody class="table-group-divider">
            <%
                ActivoDao dao = new ActivoDao();
                ArrayList<Activo> lista = dao.getAll();
                for(Activo a : lista){
            %>
            <tr>
                <td><%=a.getCodigo()%></td>
                <td><%=a.getNombre_activo()%></td>
                <td><%=a.getDescripcion()%></td>
                <td><%=a.getObservaciones()%></td>
                <td><%=a.getEdificio()%></td>
                <td><%=a.getHabitacion()%></td>
                <td>
                    <a href="#" class="btn-aceptar" data-codigo="<%=a.getCodigo()%>">
                        <button class="aceptarButton">
                            <img src="img/x_rev-removebg-preview.png" style="width: 2rem; height: auto" alt="ActivoCorrecto">
                        </button>
                    </a>
                </td>
                <td>
                    <a href="#" class="btn-no" data-codigo="<%=a.getCodigo()%>">
                        <button class="noButton">
                            <img src="img/p_rev-removebg-preview.png" style="width: 2rem; height: auto" alt="ActivoIncorrecto">
                        </button>
                    </a>
                </td>

                <td class="text-center">

                    <input type="text" id="obs">
                    <!--<button type="button" id="boton_detalles" onclick="pedir_detalles('')">
                        <img src="img/info.png" style="width: 2rem; height: auto; cursor: pointer" alt="Observaciones"
                             data-bs-toggle="modal" data-bs-target="#infoModal" >
                    </button>-->
                </td>
            </tr>
            <% } %>
            </tbody>
        </table>



        <!-- Modal para mas informacion del activo -->
        <!-- <div class="modal fade" id="infoModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
             <div class="modal-dialog modal-dialog-centered modal-xl" style="max-width: 72rem">
                 <div class="modal-content">
                     <div class="modal-header">
                         <h1 class="modal-title fs-3 ms-2" id="exampleModalLabel">Observaciones</h1>
                         <button type="button" class="btn-close me-3" data-bs-dismiss="modal" aria-label="Close"></button>
                     </div>
                     <div class="modal-body">

                         <table id="tablaModal" class="table table-striped table-hover table-bordered caption-top mt-3" style="width: 100%">
                             <thead>
                             <tr style="background-color: #615DFD; color: white">
                                 <th>Codigo</th>
                                 <th>Nombre</th>
                                 <th>Observaciones</th>

                             </tr>
                             </thead>
                             <tbody class="table-group-divider">
                             <tr id="detalles">
                             </tr>
                             </tbody>
                         </table>
                     </div>
                     <div class="modal-footer">
                         <button type="button" class="btn btn-secondary gradient-button me-3"
                                 style="width: 12rem" data-bs-dismiss="modal"  >Aceptar</button>-->
        <!-- <script>

             document.addEventListener("DOMContentLoaded", function() {
                 var button = document.getElementById("aceptarButton");
                 button.addEventListener("click", function() {
                     var code = document.getElementById("code").value; // Asume que 'code' es un campo de entrada en tu HTML
                     Observaciones(code);


                     function enviarDatosAlServlet() {
                         // Obtener la tabla
                         const table = document.getElementById('example');

                         // Recorrer las filas de la tabla

                         // Obtener los datos de la fila
                         const codigo = row.querySelector('.codigo').innerText;
                         const descripcion = row.querySelector('.descripcion').innerText;
                         const estado=true;

                         // Crear un objeto con los datos
                         const datos = {
                             codigo: codigo,
                             descripcion: descripcion,
                             activo: activo
                         };

                         // Enviar los datos al servlet usando fetch
                         fetch('revActivo', {
                             method: 'POST',
                             headers: {
                                 'Content-Type': 'application/json'
                             },
                             body: JSON.stringify(datos)
                         })
                             .then(response => response.json())
                             .then(data => {
                                 console.log('Respuesta del servidor:', data);
                             })
                             .catch(error => {
                                 console.error('Error al enviar los datos:', error);
                             });
                     }


                     // Llamar a la función para enviar los datos
                     enviarDatosAlServlet();



                 });
             });
         </script>-->
    </div>
</div>
</div>
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


<!--
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
    function pedir_detalles(codi) {
        //Es un tr
        var detalles = document.getElementById("detalles");
        detalles.innerHTML = "";

        fetch('getActivoDetalles?codigo=' + codi, {
            method: 'GET'
        }).then(response => {
            return response.text();
        }).then(data => {
            data = JSON.parse(data);
            //console.log(data);

            //Coigo Activo
            var cod = document.createElement("td");
            cod.id = "code";
            cod.innerText = data.codigo;
            detalles.appendChild(cod);

            //Nombre
            var nom = document.createElement("td");
            nom.innerText = data.nombre_activo;
            detalles.appendChild(nom);

            //Especificaciones
            var esp = document.createElement("td");

// Crear un elemento <input>
            var input = document.createElement("input");
            input.type = "text";
            input.maxLength = 100;
            input.style.width = "20rem";

// Añadir el <input> dentro de la celda <td>
            esp.appendChild(input);

// Añadir la celda <td> dentro del elemento 'detalles' (suponiendo que es una fila <tr>)
            detalles.appendChild(esp);


        }).catch(error => {
            console.log("Ocurrio un error: ", error)
        });
    }


    function enviarDatosAlServlet() {
        // Obtener la tabla
        const table = document.getElementById('myTable');

        // Obtener los datos de la fila
        const codigo = row.querySelector('.codigo').innerText;
        const descripcion = row.querySelector('.descripcion').innerText;
        const activo = row.querySelector('.activo').innerText.toLowerCase() === 'true';

        // Crear un objeto con los datos
        const datos = {
            codigo: codigo,
            descripcion: descripcion,
            activo: activo
        };

        // Enviar los datos al servlet usando fetch
        fetch('revActivo', {
            method: 'POST',
            headers: {
                'Content-Type': 'application/json'
            },
            body: JSON.stringify(datos)
        })
            .then(response => response.json())
            .then(data => {
                console.log('Respuesta del servidor:', data);
            })
            .catch(error => {
                console.error('Error al enviar los datos:', error);
            });
    }


    // Llamar a la función para enviar los datos
    enviarDatosAlServlet();
</script>-->


<script>

    document.addEventListener('DOMContentLoaded', () => {
        // Función para enviar datos al servlet
        function enviarDatos(codigo, observacion, estado) {
            const datos = {
                codigo: codigo,
                observacion: observacion,
                estado: estado
            };

            fetch('revActivo', {
                method: 'POST',
                headers: {
                    'Content-Type': 'application/json'
                },
                body: JSON.stringify(datos)
            })
                .then(response => response.json())
                .then(data => {
                    console.log('Respuesta del servidor:', data);
                })
                .catch(error => {
                    console.error('Error al enviar los datos:', error);
                });
        }

        // Manejador de clic para los botones de aceptación
        document.querySelectorAll('.btn-aceptar').forEach(button => {
            button.addEventListener('click', function(event) {
                event.preventDefault();
                const codigo = this.getAttribute('data-codigo');
                const observacion = this.closest('tr').querySelector('#obs').value; // Obtener la observación desde el input
                enviarDatos(codigo, observacion, true);
                console.log(codigo,observacion);
            });
        });

        // Manejador de clic para los botones de rechazo
        document.querySelectorAll('.btn-no').forEach(button => {
            button.addEventListener('click', function(event) {
                event.preventDefault();
                const codigo = this.getAttribute('data-codigo');
                const observacion = this.closest('tr').querySelector('#obs').value; // Obtener la observación desde el input
                enviarDatos(codigo, observacion, false);
                console.log(codigo,observacion);
            });
        });
    });

</script>


</body>
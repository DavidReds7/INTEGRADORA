<%@ page import="mx.edu.utez.pruebaf.dao.ActivoDao"%>
<%@ page import="mx.edu.utez.pruebaf.model.Activo"%>
<%@ page import="java.util.ArrayList"%>
<%@ page contentType="text/html;charset=UTF-8"%>
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
        <table id="example" class="table table-striped table-hover table-bordered mt-3" style="width: 100%">
            <thead>
            <tr style="background-color: #615DFD; color: white">
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
                    <td><%=a.getCodigo()%></td>
                    <td><%=a.getNombre_activo()%></td>
                    <td><%=a.getDescripcion()%></td>
                    <td><%=a.getObservaciones()%></td>
                    <td><%=a.getEdificio()%></td>
                    <td><%=a.getHabitacion()%></td>
                    <td class="text-center"><a href="login?id=<%=a.getCodigo()%>">
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

</body>
<html>
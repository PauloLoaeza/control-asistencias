<!doctype html>
<html>
<head>
    <meta name="layout" content="adminLte" />
    <asset:stylesheet src="dataTables.bootstrap.min.css" />
    <asset:stylesheet src="bootstrap-datepicker.min.css" />
</head>

<body>
<content tag="nav">
    <g:render template="/menu/menu" model="${[current: 'empleados']}"/>
</content>

<content tag="header">
    <h1>
        Asistencias
        <small>Últimas asistencias de empleados</small>
    </h1>
    <ol class="breadcrumb">
        <li><a href="${createLink(uri: '/')}"><i class="fa fa-home"></i>Inicio</a></li>
        <li><a href="${createLink(uri: '/asistencias')}"><i class="fa fa-check-square-o"></i>Asistencias</a></li>
    </ol>
</content>

    <g:if test="${flash.message}">
        <div class="alert alert-${flash.messageType} alert-dismissable">
            <button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>
            <h4><i class="icon fa fa-${flash.icon}"></i>${flash.title}</h4>
            ${flash.message}
        </div>
    </g:if>

    <div class="box box-danger">
        <div class="box-header with-border">
            <h3 class="box-title">Asistencias del día</h3>
        </div>
        <div class="box-body">

            <g:form class="form-inline" action="home" method="post">
                <div class="form-group">
                    <label for="fecha">Fecha:</label>
                    <input type="text" name="fecha" id="fecha" class="form-control" placeholder="Fecha"
                           value="<g:if test="${params.fecha}">${params.fecha}</g:if><g:else><g:formatDate date="${new Date()}" format="dd/MM/yyyy"/></g:else>"/>
                </div>
                <button type="submit" class="btn btn-default"><span class="fa fa-search"></span> Buscar</button>
            </g:form>
            <hr>
            <div class="table-responsive">
                <table id="asistencias" class="table table-bordered table-striped">
                    <thead>
                        <tr>
                            <th>Empleado</th>
                            <th>Fecha</th>
                            <th>Entrada</th>
                            <th>Salida</th>
                            <th>Tiempo realizado</th>
                        </tr>
                    </thead>
                    <tbody>
                    <g:each in="${asistencias}">
                        <tr>
                            <td><g:link action="index" id="${it.empleado.id}">${it.empleado.nombreCompleto}</td></g:link></td>
                            <td><g:formatDate date="${it.entrada}" format="dd/MM/yyyy"/> </td>
                            <td><g:formatDate date="${it.entrada}" format="hh:mm:ss a"/> </td>
                            <td><g:formatDate date="${it.salida}" format="hh:mm:ss a"/> </td>

                            <g:set var="realizadas" value="${it.horasRealizadas}" />
                            <td>${realizadas.hours} ${realizadas.minutes ? ":" + realizadas.minutes : ""}${realizadas.seconds ? ":" + realizadas.seconds : ""} hrs.</td>
                        </tr>
                        </g:each>
                    </tbody>
                </table>
            </div>
        </div>
    </div>

<content tag="scripts">
    <asset:javascript src="jquery.dataTables.min.js" />
    <asset:javascript src="dataTables.bootstrap.min.js"/>

    <asset:javascript src="bootstrap-datepicker.min.js" />
    <asset:javascript src="bootstrap-datepicker.es.min.js" />
    <script type="text/javascript">
        $(function() {
            $("#fecha").datepicker({
                "format": "dd/mm/yyyy",
                "language": "es",
                //"todayBtn": true,
                "todayHighlight": true
            });

            $(function () {
                $('#asistencias').dataTable({
                    //"lengthMenu": [[10, 30, -1], [10, 30, "Todos"]],
                    "lengthChange": false,
                    "paging": false,
                    "autoWidth": false,
                    "order": [[2, "desc"]],
                    "language": {
                        "emptyTable": "Sin registros",
                        "info": "Asistencias: _TOTAL_",
                        "infoEmpty": "Sin registros por mostrar",
                        "infoFiltered": "(_MAX_ registros filtrados)",
                        "lengthMenu": "Mostrar _MENU_ registros",
                        "loadingRecords": "Cargando...",
                        "processing": "Procesando...",
                        "search": "Buscar empleado:",
                        "zeroRecords": "No se encontraron resultados",
                        "paginate": {
                            "first": "Inicio",
                            "last": "Fin",
                            "next": "Siguiente",
                            "previous": "Anterior"
                        }
                    }
                });
            });
        })

    </script>
</content>
</body>
</html>
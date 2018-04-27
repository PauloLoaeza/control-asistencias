<!doctype html>
<html>
<head>
    <meta name="layout" content="adminLte" />
    <title>Administradores</title>

    <asset:stylesheet src="dataTables.bootstrap.min.css" />
</head>

<body>

<content tag="nav">
    <g:render template="/menu/menu" model="${[current: 'administradores']}"/>
</content>

<content tag="header">
    <h1>
        Administradores
        <small>Administradores del sistema</small>
    </h1>
    <ol class="breadcrumb">
        <li><a href="${createLink(uri: '/')}" ><i class="fa fa-home"></i>Inicio</a></li>
        <li><a href="${createLink(uri: '/administradores')}" class="active"><i class="fa fa-users"></i>Administradores</a></li>
    </ol>
</content>

<div class="box box-danger">
    <div class="box-header with-border">
        <h3 class="box-title">
            Lista de Administradores
        </h3>
    </div>
    <div class="box-body">
        <div class="table-responsive">
            <table id="table-admins" class="table table-bordered">
                <thead>
                <tr>
                    <th>Código</th>
                    <th>Desde</th>
                    <th>Nombre(s)</th>
                    <th>Apellido Paterno</th>
                    <th>Apellido Materno</th>
                </tr>
                </thead>
                <tbody>
                <g:each in="${administradores}">
                    <tr>
                        <td>${it.codigo}</td>
                        <td><g:formatDate date="${it.dateCreated}" format="dd/MM/yyyy" /> </td>
                        <td>${it.nombre}</td>
                        <td>${it.apellidoPaterno}</td>
                        <td>${it.apellidoMaterno}</td>
                    </tr>
                </g:each>
                </tbody>
            </table>
        </div>
    </div>
</div>

<content tag="scripts">
    <asset:javascript src="jquery.dataTables.min.js" />
    <asset:javascript src="dataTables.bootstrap.min.js" />

    <script type="text/javascript">
        $(function () {
            $('#table-admins').dataTable({
                "lengthMenu": [[10, 30, -1], [10, 30, "Todos"]],
                "autoWidth": false,
                "order": [[0, "desc"]],
                "language": {
                    "emptyTable": "Sin registros",
                    "info": "Registros _START_ a _END_. Total: _TOTAL_",
                    "infoEmpty": "Sin registros por mostrar",
                    "infoFiltered": "(_MAX_ registros filtrados)",
                    "lengthMenu": "Mostrar _MENU_ registros",
                    "loadingRecords": "Cargando...",
                    "processing": "Procesando...",
                    "search": "Buscar:",
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
    </script>
</content>
</body>
</html>
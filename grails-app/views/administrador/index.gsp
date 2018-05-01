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

<g:if test="${flash.message}">
    <div class="alert alert-${flash.messageType} alert-dismissable">
        <button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>
        <h4><i class="icon fa fa-${flash.icon}"></i>${flash.title}</h4>
        ${flash.message}
    </div>
</g:if>

<div class="box box-danger">
    <div class="box-header with-border">
        <h3 class="box-title">
            Lista de Administradores
        </h3>
        <p class="pull-right">
            <g:link action="nuevo" class="btn btn-primary"> Registrar administrador</g:link>
        </p>
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
                    <th></th>
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
                        <td style="width: 130px;">
                            <g:link action="mostrar" id="${it.id}" class="btn btn-primary"><i class="fa fa-eye"></i></g:link>
                            <g:link action="editar" id="${it.id}" class="btn btn-success"><i class="fa fa-edit"></i></g:link>
                            <g:link action="eliminar" id="${it.id}" class="btn btn-danger"><i class="fa fa-trash-o"></i></g:link>
                        </td>
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
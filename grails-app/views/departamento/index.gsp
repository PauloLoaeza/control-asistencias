<!doctype html>
<html>
<head>
    <meta name="layout" content="adminLte" />
    <title>Departamentos</title>
    <asset:stylesheet src="dataTables.bootstrap.min.css" />
</head>

<body>

<content tag="nav">
    <g:render template="/menu/menu" model="${[current: 'catalogos']}"/>
</content>

<content tag="header">
    <h1>
        Departamentos
        <small>Departamentos o áreas de la empresa</small>
    </h1>
    <ol class="breadcrumb">
        <li><a href="${createLink(uri: '/')}"><i class="fa fa-home"></i>Inicio</a></li>
        <li><a href="${createLink(uri: '/departamentos')}" class="active"><i class="fa fa-building"></i>Departamentos</a></li>
    </ol>
</content>

<g:if test="${flash.message}">
    <div class="alert alert-${flash.messageType} alert-dismissable">
        <button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>
        <h4><i class="icon fa fa-${flash.icon}"></i>${flash.title}</h4>
        ${flash.message}
    </div>
</g:if>

<div class="box box-primary">
    <div class="box-header with-border">
        <h3 class="box-title">Lista de departamentos</h3>
        <div class="pull-right">
            <a class="btn btn-primary" href="${createLink(uri: "/departamentos/nuevo")}">Agregar departamento</a>
        </div>

    </div>
    <div class="box-body">
        <div class="table-responsive">
            <table id="table-departamentos" class="table table-bordered">
                <thead>
                    <tr>
                        <th>Código</th>
                        <th>Nombre</th>
                        <th>Descripción</th>
                        <th></th>
                    </tr>
                </thead>
                <tbody>
                    <g:each in="${departamentos}">
                        <tr>
                            <td>${it.codigo}</td>
                            <td>${it.nombre}</td>
                            <td>${it.descripcion}</td>
                            <td>
                                <g:link action="editar" id="${it.id}" class="btn btn-default btn-block"><span class="fa fa-edit"></span> Editar</g:link>
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
            $('#table-departamentos').dataTable({
                //"lengthMenu": [[10, 30, -1], [10, 30, "Todos"]],
                "lengthChange": false,
                "paging": false,
                "searching": false,
                "length": false,
                "autoWidth": false,
                "order": [[0, "asc"]],
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
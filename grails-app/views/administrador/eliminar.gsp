<!doctype html>
<html>
<head>
    <meta name="layout" content="adminLte" />
    <title>Eliminar administrador</title>
</head>

<body>
<content tag="nav">
    <g:render template="/menu/menu" model="${[current: 'administradores']}"/>
</content>

<content tag="header">
    <h1>
        Eliminar administrador
        <small>Remover administrador del sistema</small>
    </h1>
    <ol class="breadcrumb">
        <li><a href="${createLink(uri: '/')}"><i class="fa fa-home"></i>Inicio</a></li>
        <li><a href="${createLink(uri: '/administradores/')}"><i class="fa fa-users"></i>Administradores</a></li>
        <li><g:link action="eliminar" id="${empleado.id}" class="active"><i class="fa fa-edit"></i>Eliminar administrador</g:link></li>
    </ol>
</content>


<div class="callout callout-danger">
    <h4><i class="fa fa-warning"></i> ¿Está seguro que desea eliminar este administrador?</h4>
    No se podrá recuperar la información del administrador
</div>

<div class="box box-info">
    <div class="box-header with-border">
        <h3 class="box-title">Datos del administrador</h3>
    </div>
    <div class="box-body">
        <ul class="list-group">
            <li class="list-group-item">
                <b>Nombre</b> <a class="pull-right">${empleado.nombre}</a>
            </li>
            <li class="list-group-item">
                <b>Apellido paterno</b> <a class="pull-right">${empleado.apellidoPaterno}</a>
            </li>
            <li class="list-group-item">
                <b>Apellido materno</b> <a class="pull-right">${empleado.apellidoMaterno}</a>
            </li>
            <li class="list-group-item">
                <b>Correo electrónico</b> <a class="pull-right">${empleado.usuario.username}</a>
            <li class="list-group-item">
                <b>Departamento</b> <a class="pull-right">${empleado.departamento.nombre}</a>
            </li>
            <li class="list-group-item">
                <b>Cargo</b> <a class="pull-right">${empleado.cargo}</a>
            </li>
        </ul>
    </div>
    <div class="box-footer">
        <g:form action="eliminar" method="post">
            <g:hiddenField name="id" value="${empleado.id}" />

            <button type="submit" class="btn btn-danger"><i class="fa fa-trash"></i> Eliminar</button>
        </g:form>
    </div>
</div>
</body>
</html>
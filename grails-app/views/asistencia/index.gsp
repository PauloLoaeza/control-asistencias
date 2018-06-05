<!doctype html>
<html>
<head>
    <meta name="layout" content="adminLte" />
    <title>Asistencias del empleado</title>
</head>

<body>

<content tag="nav">
    <g:render template="/menu/menu" model="${[current: "empleados"]}"></g:render>
</content>


<content tag="header">
    <h1>
        Asistencias
        <small>Asistencia del empleado</small>
    </h1>
    <ol class="breadcrumb">
        <li><a href="${createLink(uri: '/')}"><i class="fa fa-home"></i>Inicio</a></li>
        <li><a href="${createLink(uri: '/empleados')}"><i class="fa fa-users"></i>Empleados</a></li>
        <li><g:link controller="empleado" action="mostrar" id="${empleado.id}"><i class="fa fa-user"></i>${empleado.nombreCorto}</g:link></li>
        <li><g:link action="index" id="${empleado.id}" class="active"> <i class="fa fa-list-alt"></i>Asistencias</g:link></li>
    </ol>
</content>


<div class="row">
    <div class="col-md-3">
        <div class="box box-primary">
            <div class="box-body box-profile">
                <asset:image src="user.png" class="profile-user-img img-responsive img-circle" alt="imagen usuario" />

                <h3 class="profile-username text-center">${empleado.nombreCorto}</h3>

                <p class="text-muted text-center">${empleado.cargo}</p>

                <ul class="list-group">
                    <li class="list-group-item">
                        <b>Código</b> <a class="pull-right">${empleado.codigo}</a>
                    </li>
                    <li class="list-group-item">
                        <b>Desde</b> <a class="pull-right"><g:formatDate date="${empleado.dateCreated}" format="dd/MM/yyyy" /></a>
                    </li>
                </ul>
                <g:link controller="empleado" action="editar" id="${empleado.id}" class="btn btn-primary btn-block">Editar</g:link>
                <g:link controller="empleado" action="eliminar" id="${empleado.id}" class="btn btn-danger btn-block">Eliminar</g:link>
            </div>
        </div>
    </div>

    <div class="col-md-9">
        <div class="box box-primary">
            <div class="box-header with-border">
                <h3 class="box-title">Datos del empleado</h3>
            </div>
            <div class="box-body">
                <ul class="list-group">
                    <li class="list-group-item">
                        <b>Empleado</b> <a class="pull-right">${empleado.nombreCompleto}</a>
                    </li>
                    <li class="list-group-item">
                        <b>Departamento</b> <a class="pull-right">${empleado.departamento.nombre}</a>
                    </li>
                    <li class="list-group-item">
                        <b>Cargo</b> <a class="pull-right">${empleado.cargo}</a>
                    </li>
                </ul>
            </div>
        </div>
        <div class="box box-success">
            <div class="box-header with-border">
                <h3 class="box-title">Asistencias</h3>
            </div>
            <div class="box-body">
                <div class="table-responsive">
                    <table id="table-asistencias" class="table table-bordered table-hover">
                        <thead>
                            <tr>
                                <th>Fecha</th>
                                <th>Entrada</th>
                                <th>Salida</th>
                                <th>Tiempo realizado</th>
                            </tr>
                        </thead>
                        <tbody>
                            <g:each in="${empleado.asistencias}">
                                <tr>
                                    <td><g:formatDate date="${it.entrada}" format="dd/MM/yyyy" /></td>
                                    <td><g:formatDate date="${it.entrada}" format="hh:mm:ss a" /></td>
                                    <td><g:formatDate date="${it.salida}" format="hh:mm:ss a" /></td>
                                    <g:set var="realizadas" value="${it.horasRealizadas}" />

                                    <td>${realizadas.hours} ${realizadas.minutes ? ":" + realizadas.minutes : ""}${realizadas.seconds ? ":" + realizadas.seconds : ""} hrs.</td>
                                </tr>
                            </g:each>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </div>
</div>
</body>
</html>
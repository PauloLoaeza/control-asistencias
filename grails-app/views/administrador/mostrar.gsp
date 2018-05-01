<!doctype html>
<html>
<head>
    <meta name="layout" content="adminLte"/>
    <title>Detalles de administrador</title>
</head>
<body>

<content tag="nav">
    <g:render template="/menu/menu" model="${[current: "administradores"]}" />
</content>

<content tag="header">
    <h1>
        Administrador
        <small>Información del administrador</small>
    </h1>
    <ol class="breadcrumb">
        <li><a href="${createLink(uri: '/')}"><i class="fa fa-home"></i>Inicio</a></li>
        <li><a href="${createLink(uri: '/administradores')}" class="active"><i class="fa fa-users"></i>Administradores</a></li>
        <li><g:link action="mostrar" id="${empleado.id}"><i class="fa fa-user"></i> ${empleado.nombreCorto}</g:link></li>
    </ol>
</content>

<g:if test="${flash.message}">
    <div class="alert alert-${flash.messageType} alert-dismissable">
        <button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>
        <h4><i class="icon fa fa-${flash.icon}"></i>${flash.title}</h4>
        ${flash.message}
    </div>
</g:if>

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
                <g:link action="editar" id="${empleado.id}" class="btn btn-primary btn-block">Editar</g:link>
                <g:link action="eliminar" id="${empleado.id}" class="btn btn-danger btn-block">Eliminar</g:link>
            </div>
        </div>
    </div>

    <div class="col-md-9">
        <div class="nav-tabs-custom">
            <ul class="nav nav-tabs">
                <li class="active">
                    <a href="#personal" data-toggle="tab" aria-expanded="true">Información personal</a>
                </li>
                <g:if test="${empleado.domicilio}">
                    <li>
                        <a href="#domicilio" data-toggle="tab" aria-expanded="false">Domicilio</a>
                    </li>
                </g:if>
            </ul>
            <div class="tab-content">
                <div class="tab-pane active" id="personal">
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
                            <b>Género</b> <a class="pull-right">${empleado.genero.sexo}</a>
                        </li>
                        <li class="list-group-item">
                            <b>Correo electrónico</b> <a class="pull-right">${empleado.usuario.username}</a>
                        </li>
                        <li class="list-group-item">
                            <b>Teléfono local</b> <a class="pull-right">${empleado.telefonoCasa}</a>
                        </li>
                        <li class="list-group-item">
                            <b>Teléfono móvil</b> <a class="pull-right">${empleado.telefonoCelular}</a>
                        </li>
                        <li class="list-group-item">
                            <b>Departamento</b> <a class="pull-right">${empleado.departamento.nombre}</a>
                        </li>
                        <li class="list-group-item">
                            <b>Cargo</b> <a class="pull-right">${empleado.cargo}</a>
                        </li>
                    </ul>
                </div>
                <g:if test="${empleado.domicilio}">
                    <div class="tab-pane" id="domicilio">
                        <ul class="list-group">
                            <li class="list-group-item">
                                <b>Calle</b> <a class="pull-right">${empleado.domicilio?.calle}</a>
                            </li>
                            <li class="list-group-item">
                                <b>Colonia</b> <a class="pull-right">${empleado.domicilio?.colonia}</a>
                            </li>
                            <li class="list-group-item">
                                <b>Municipio</b> <a class="pull-right">${empleado.domicilio?.municipio}</a>
                            </li>
                            <li class="list-group-item">
                                <b>Entidad federativa</b> <a class="pull-right">${empleado.domicilio?.entidadFederativa}</a>
                            </li>
                            <li class="list-group-item">
                                <b>Número exterior</b> <a class="pull-right">${empleado.domicilio?.numeroExterior}</a>
                            </li>
                            <li class="list-group-item">
                                <b>Número interior</b> <a class="pull-right">${empleado.domicilio?.numeroInterior}</a>
                            </li>
                            <li class="list-group-item">
                                <b>Código postal</b> <a class="pull-right">${empleado.domicilio?.codigoPostal}</a>
                            </li>
                        </ul>
                    </div>
                </g:if>
            </div>
        </div>
    </div>
</div>

<content tag="scripts">
</content>

</body>
</html>

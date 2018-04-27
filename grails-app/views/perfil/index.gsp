<!doctype html>
<html>
<head>
    <meta name="layout" content="adminLte"/>
    <title>Mi perfil</title>
</head>
<body>

<content tag="nav">
    <g:render template="/menu/menu" />
</content>

<content tag="header">
    <h1>
        Mi perfil
        <small>Datos de usuario</small>
    </h1>
    <ol class="breadcrumb">
        <li><a href="${createLink(uri: '/')}"><i class="fa fa-home"></i>Inicio</a></li>
        <li><a href="${createLink(uri: '/perfil')}" class="active"><i class="fa fa-user"></i>Mi perfil</a></li>
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

                <h3 class="profile-username text-center">${usuario.nombreCorto}</h3>

                <p class="text-muted text-center">${usuario.cargo}</p>

                <ul class="list-group">
                    <li class="list-group-item">
                        <b>Código</b> <a class="pull-right">${usuario.codigo}</a>
                    </li>
                    <li class="list-group-item">
                        <b>Desde</b> <a class="pull-right"><g:formatDate date="${usuario.dateCreated}" format="dd/MM/yyyy" /></a>
                    </li>
                </ul>
                <a href="${createLink(uri: '/perfil/editar')}" class="btn btn-primary btn-block">Editar</a>
            </div>
        </div>
    </div>

    <div class="col-md-9">
        <div class="nav-tabs-custom">
            <ul class="nav nav-tabs">
                <li class="active">
                    <a href="#personal" data-toggle="tab" aria-expanded="true">Información personal</a>
                </li>
                <g:if test="${usuario.domicilio}">
                    <li>
                        <a href="#domicilio" data-toggle="tab" aria-expanded="false">Mi domicilio</a>
                    </li>
                </g:if>
                <li>
                    <a href="#cambiar" data-toggle="tab" aria-expanded="false">Cambiar contraseña</a>
                </li>
            </ul>
            <div class="tab-content">
                <div class="tab-pane active" id="personal">
                    <ul class="list-group">
                        <li class="list-group-item">
                            <b>Nombre</b> <a class="pull-right">${usuario.nombre}</a>
                        </li>
                        <li class="list-group-item">
                            <b>Apellido paterno</b> <a class="pull-right">${usuario.apellidoPaterno}</a>
                        </li>
                        <li class="list-group-item">
                            <b>Apellido materno</b> <a class="pull-right">${usuario.apellidoMaterno}</a>
                        </li>
                        <li class="list-group-item">
                            <b>Género</b> <a class="pull-right">${usuario.genero.sexo}</a>
                        </li>
                        <li class="list-group-item">
                            <b>Correo electrónico</b> <a class="pull-right">${usuario.usuario.username}</a>
                        </li>
                        <li class="list-group-item">
                            <b>Teléfono local</b> <a class="pull-right">${usuario.telefonoCasa}</a>
                        </li>
                        <li class="list-group-item">
                            <b>Teléfono móvil</b> <a class="pull-right">${usuario.telefonoCelular}</a>
                        </li>
                        <li class="list-group-item">
                            <b>Departamento</b> <a class="pull-right">${usuario.departamento.nombre}</a>
                        </li>
                        <li class="list-group-item">
                            <b>Cargo</b> <a class="pull-right">${usuario.cargo}</a>
                        </li>
                    </ul>
                </div>
                <g:if test="${usuario.domicilio}">
                    <div class="tab-pane" id="domicilio">
                        <ul class="list-group">
                            <li class="list-group-item">
                                <b>Calle</b> <a class="pull-right">${usuario.domicilio?.calle}</a>
                            </li>
                            <li class="list-group-item">
                                <b>Colonia</b> <a class="pull-right">${usuario.domicilio?.colonia}</a>
                            </li>
                            <li class="list-group-item">
                                <b>Municipio</b> <a class="pull-right">${usuario.domicilio?.municipio}</a>
                            </li>
                            <li class="list-group-item">
                                <b>Entidad federativa</b> <a class="pull-right">${usuario.domicilio?.entidadFederativa}</a>
                            </li>
                            <li class="list-group-item">
                                <b>Número exterior</b> <a class="pull-right">${usuario.domicilio?.numeroExterior}</a>
                            </li>
                            <li class="list-group-item">
                                <b>Número interior</b> <a class="pull-right">${usuario.domicilio?.numeroInterior}</a>
                            </li>
                            <li class="list-group-item">
                                <b>Código postal</b> <a class="pull-right">${usuario.domicilio?.codigoPostal}</a>
                            </li>
                        </ul>
                    </div>
                </g:if>
                <div class="tab-pane" id="cambiar">
                    <g:set var="command" value="${new com.tecnosalle.PerfilCommand() }" />
                    <g:form action="actualizarPassword" method="post">
                        <f:with bean="command">
                            <f:field property="password" label="Contraseña"/>
                            <f:field property="newPassword" label="Nueva contraseña"/>
                            <f:field property="confirmPassword" label="Confirmar contraseña"/>
                        </f:with>
                        <input type="submit" class="btn btn-primary btn-flat btn-block" value="Guardar cambios" />
                    </g:form>
                </div>
            </div>
        </div>
    </div>
</div>

<content tag="scripts">
</content>

</body>
</html>

<!doctype html>
<html>
<head>
    <meta name="layout" content="adminLte"/>
    <title>Editar perfil</title>
</head>
<body>

<content tag="nav">

</content>

<content tag="header">
    <h1>
        Editar perfil
        <small>Editar datos de usuario</small>
    </h1>
    <ol class="breadcrumb">
        <li><a href="${createLink(uri: '/')}"><i class="fa fa-home"></i>Inicio</a></li>
        <li><a href="${createLink(uri: '/perfil')}"><i class="fa fa-user"></i>Mi perfil</a></li>
        <li><a href="${createLink(uri: '/perfil/editar')}" class="active"><i class="fa fa-edit"></i>Editar perfil</a></li>
    </ol>
</content>

<div class="row">
    <div class="col-md-3">
        <div class="box box-primary">
            <div class="box-body box-profile">
                <asset:image src="user.png" class="profile-user-img img-responsive img-circle" alt="imagen usuario" />

                <h3 class="profile-username text-center">${empleado}</h3>

                <p class="text-muted text-center">${empleado.cargo}</p>

                <ul class="list-group">
                    <li class="list-group-item">
                        <b>Código</b> <a class="pull-right">${empleado.codigo}</a>
                    </li>
                    <li class="list-group-item">
                        <b>Desde</b>
                        <a class="pull-right"><g:formatDate date="${empleado.dateCreated}" format="dd/MM/yyyy" /></a>
                    </li>
                </ul>

                <input type="submit" form="guardarCambios" class="btn btn-primary btn-block" value="Guardar" />
            </div>
        </div>
    </div>

    <div class="col-md-9">
        <div class="nav-tabs-custom">
            <ul class="nav nav-tabs">
                <li class="active">
                    <a href="#personal" data-toggle="tab" aria-expanded="true">Información personal</a>
                </li>
                <li>
                    <a href="#domicilio" data-toggle="tab" aria-expanded="false">Mi domicilio</a>
                </li>
            </ul>

            <g:form name="guardarCambios" action="guardar" method="post">
                <g:hiddenField name="id" value="${empleado.id}" />
                <f:with bean="empleado">
                    <div class="tab-content">
                        <div class="tab-pane active" id="personal">
                            <div class="margin">
                                <f:field property="nombre" />
                                <f:field property="apellidoPaterno" />
                                <f:field property="apellidoMaterno" />
                                <f:field property="genero" label="Género"/>
                                <f:field property="usuario.username" label="Correo electrónico"/>
                                <f:field property="telefonoCasa" label="Teléfono local" />
                                <f:field property="telefonoCelular" label="Teléfono móvil"/>
                                <br>
                            </div>
                        </div>
                        <div class="tab-pane" id="domicilio">
                            <div class="margin">
                                <f:field property="domicilio.calle" />
                                <f:field property="domicilio.colonia" />
                                <f:field property="domicilio.municipio" />
                                <f:field property="domicilio.entidadFederativa" />
                                <f:field property="domicilio.numeroExterior" label="Número exterior"/>
                                <f:field property="domicilio.numeroInterior" label="Número interior" />
                                <f:field property="domicilio.codigoPostal" label="Código postal"/>
                                <br>
                            </div>
                        </div>
                    </div>
                </f:with>
            </g:form>
        </div>
    </div>
</div>




<content tag="scripts">

</content>
</body>
</html>

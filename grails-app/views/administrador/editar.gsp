<!doctype html>
<html>
<head>
    <meta name="layout" content="adminLte" />
    <title>Editar administrador</title>
</head>
<body>
<content tag="nav">
    <g:render template="/menu/menu" model="${[current: 'administradores']}"/>
</content>

<content tag="header">
    <h1>
        Editar administrador
        <small>Editar información del adminisrador</small>
    </h1>
    <ol class="breadcrumb">
        <li><a href="${createLink(uri: '/')}"><i class="fa fa-home"></i>Inicio</a></li>
        <li><a href="${createLink(uri: '/administradores/')}"><i class="fa fa-users"></i>Administradores</a></li>
        <li><g:link action="editar" id="${empleado.id}" class="active"><i class="fa fa-edit"></i>Editar administrador</g:link></li>
    </ol>
</content>

<g:hasErrors bean="${this.empleado}">

    <div class="alert alert-danger alert-dismissable">
        <button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>
        <h4><i class="icon fa fa-warning"></i>Error al editar administrador</h4>

        <g:eachError bean="${this.empleado}" var="error">
            <li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message error="${error}"/></li>
        </g:eachError>
    </div>
</g:hasErrors>

<div class="row">
    <g:form class="form" action="editar" method="post">
        <g:hiddenField name="id" value="${empleado.id}" />
        <f:with bean="empleado">
            <div class="col-md-6">
                <div class="box box-primary">
                    <div class="box-header with-border">
                        <h3 class="box-title">Datos del administrador</h3>
                    </div>
                    <div class="box-body">
                        <f:field property="codigo" label="Código de empleado"/>
                        <f:field property="nombre" label="Nombre" />
                        <f:field property="apellidoPaterno"/>
                        <f:field property="apellidoMaterno"  />
                        <f:field property="genero" label="Género" />
                        <f:field property="telefonoCelular" label="Teléfono móvil"/>
                        <f:field property="telefonoCasa" label="Teléfono local"/>
                        <f:field property="departamento" />
                        <f:field property="cargo" label="Puesto" />

                        <input type="submit" value="Guardar" class="btn btn-primary btn-block"/>
                    </div>
                </div>
            </div>

            <div class="col-md-6">
                <div class="box box-danger">
                    <div class="box-header with-border">
                        <h3 class="box-title">Datos de acceso</h3>
                    </div>
                    <div class="box-body">
                        <f:field property="usuario.username" label="Correo electrónico"/>
                    </div>
                </div>

                <div class="box box-success">
                    <div class="box-header with-border">
                        <h3 class="box-title">Datos del domicilio</h3>
                    </div>
                    <div class="box-body">
                        <f:field property="domicilio.calle" />
                        <f:field property="domicilio.colonia" />
                        <f:field property="domicilio.municipio" />
                        <f:field property="domicilio.entidadFederativa" />
                        <f:field property="domicilio.numeroExterior" label="Número exterior"/>
                        <f:field property="domicilio.numeroInterior" label="Número interior"/>
                        <f:field property="domicilio.codigoPostal" label="Código Postal"/>
                    </div>
                </div>
            </div>
        </f:with>
    </g:form>
</div>



</body>
</html>
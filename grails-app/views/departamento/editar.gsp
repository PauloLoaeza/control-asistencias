<!doctype html>
<html lang="en">
<head>
    <meta name="layout" content="adminLte" />
    <title>Agregar departamento</title>
</head>

<body>

<content tag="nav">
    <g:render template="/menu/menu" model="${[current: 'catalogos']}"/>
</content>

<content tag="header">
    <h1>
        Editar departamento
        <small></small>
    </h1>
    <ol class="breadcrumb">
        <li><a href="${createLink(uri: '/')}"><i class="fa fa-home"></i>Inicio</a></li>
        <li><a href="${createLink(uri: '/departamentos')}"><i class="fa fa-building"></i>Departamentos</a></li>
        <li><g:link action="editar" id="${departamento.id}" class="active"><i class="fa fa-edit"></i>Editar departamento</g:link></li>
    </ol>
</content>

<g:hasErrors bean="${this.departamento}">

    <div class="alert alert-danger alert-dismissable">
        <button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>
        <h4><i class="icon fa fa-warning"></i>Error al registrar departamento</h4>

        <g:eachError bean="${this.departamento}" var="error">
            <li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message error="${error}"/></li>
        </g:eachError>
    </div>
</g:hasErrors>

<div class="box box-primary">
    <div class="box-header with-border">
        <h3 class="box-title">Datos del departamento</h3>
    </div>
    <div class="box-body">
        <g:form action="editar" method="post">
            <input type="hidden" name="id" value="${departamento.id}" />
            <f:with bean="departamento">
                <f:field property="codigo" label="Código" />
                <f:field property="nombre" />
                <f:field property="descripcion" label="Descripción" />
            </f:with>

            <input type="submit" class="btn btn-primary btn-block" value="Guardar" />
        </g:form>
    </div>
</div>
</body>
</html>
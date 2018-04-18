<!doctype html>
<html>
<head>
    <meta name="layout" content="adminLte"/>
    <title>Inicio</title>
</head>
<body>

<content tag="nav">
    <li class="active"><a href="${createLink(uri: '/')}"><span class="fa fa-home"></span> Inicio</a></li>

    <sec:access expression="hasRole('ROLE_SUPERADMIN')">
    </sec:access>

    <sec:access expression="hasRole('ROLE_ADMIN')">
        <li class="dropdown">
            <a href="#" class="dropdown-toggle" data-toggle="dropdown">
                <span class="fa fa-users"></span> Empleados <span class="caret"></span>
            </a>
            <ul class="dropdown-menu" role="menu">
                <li><a href="${createLink(uri: '/')}"><span class="fa fa-eye"></span> Ver empleados</a></li>
                <li><a href="${createLink(uri: '/')}"><span class="fa fa-user-plus"></span> Registrar empleado</a></li>
            </ul>
        </li>
    </sec:access>

    <sec:access expression="hasRole('ROLE_CHECADOR')">
    </sec:access>
</content>

<content tag="header">
    <h1>
        Inicio
        <small>Sistema de control de asistencias</small>
    </h1>
    <ol class="breadcrumb">
        <li><a href="${createLink(uri: '/')}" class="active"><i class="fa fa-home"></i>Inicio</a></li>
    </ol>
</content>

<content tag="scripts">
</content>


</body>
</html>

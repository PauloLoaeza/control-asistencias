<!doctype html>
<html>
<head>
    <meta name="layout" content="adminLte"/>
    <title>Inicio</title>
</head>
<body>

<content tag="nav">
    <g:render template="/menu/menu" model="${[current: 'inicio']}"/>
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


<sec:access expression="hasRole('ROLE_ADMIN') || hasRole('ROLE_SUPERADMIN')">
    <div class="row">
        <div class="col-sm-6">
            <div class="small-box bg-aqua">
                <div class="inner">
                    <h3>Empleados</h3>
                    <p>Empleados registrados</p>
                </div>
                <div class="icon">
                    <i class="fa fa-users"></i>
                </div>
                <a href="${createLink(uri: '/empleado')}" class="small-box-footer">
                    Ver empleados <i class="fa fa-arrow-circle-right"></i>
                </a>
            </div>
        </div>
        <div class="col-sm-6">
            <div class="small-box bg-red">
                <div class="inner">
                    <h3>Reportes</h3>
                    <p>Reportes de asistencias</p>
                </div>
                <div class="icon">
                    <i class="fa fa-file-text"></i>
                </div>
                <a href="#" class="small-box-footer">
                    Generar reportes <i class="fa fa-arrow-circle-right"></i>
                </a>
            </div>
        </div>
    </div>
</sec:access>



<content tag="scripts">
</content>


</body>
</html>

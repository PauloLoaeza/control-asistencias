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
                <g:link controller="reporte" action="index" class="small-box-footer">
                    Generar reportes <i class="fa fa-arrow-circle-right"></i>
                </g:link>
            </div>
        </div>
    </div>
</sec:access>

<sec:access expression="hasRole('ROLE_CHECADOR')">
    <div class="row">
        <div class="col-md-8 col-md-offset-2">
            <g:if test="${flash.message}">
                <div id="mensaje" class="callout callout-${flash.messageType}">
                    <h4><i class="icon fa fa-${flash.icon}"></i> ${flash.title}</h4>
                    <p>
                        ${flash.message}
                    </p>
                </div>
            </g:if>

            <div class="box box-default box-solid">
                <div class="box-header">
                    <h3 class="box-title"><i class="fa fa-calendar"></i> Fecha y hora</h3>
                </div>
                <div class="box-body">
                    <h3 class="text-center">
                        <span id="fecha"></span> -
                        <span id="hora"></span>
                    </h3>
                </div>
            </div>
            <div class="box box-danger">
                <div class="box-header with-border">
                    <i class="fa fa-check-square-o"></i>
                    <h3 class="box-title">Registrar asistencia</h3>
                </div>
                <div class="box-body">
                    <g:form controller="checador" action="checar" method="post">
                        <div class="form-group">
                            <label for="codigo">Código de empleado</label>
                            <input class="form-control" type="text" name="codigo" id="codigo"
                                   placeholder="Código de empleado" autocomplete="off" required>
                        </div>
                        <button type="submit" class="btn btn-primary"><i class="fa fa-check"></i> Registrar</button>
                    </g:form>
                </div>
            </div>
        </div>
    </div>

</sec:access>

<content tag="scripts">

    <script type="text/javascript">
        setTimeout(function () {
            $("#mensaje").fadeOut()
        }, 5000)
    </script>

    <sec:access expression="hasRole('ROLE_CHECADOR')">
        <script type="text/javascript">
            $(function () {
                window.setInterval(function () {
                    var date = new Date()
                    document.getElementById("hora").innerHTML = date.toLocaleTimeString()
                    document.getElementById("fecha").innerHTML = date.toLocaleDateString()
                }, 1000);
            });

        </script>
    </sec:access>
</content>


</body>
</html>

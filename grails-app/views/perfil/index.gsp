<!doctype html>
<html>
<head>
    <meta name="layout" content="adminLte"/>
    <title>Mi perfil</title>
</head>
<body>

<content tag="nav">

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

<div class="row">
    <div class="col-md-3">
        <div class="box box-primary">
            <div class="box-body box-profile">
                <asset:image src="user.png" class="profile-user-img img-responsive img-circle" alt="imagen usuario" />

                <h3 class="profile-username text-center">Nombre Apellido</h3>

                <p class="text-muted text-center">Cargo</p>

                <ul class="list-group">
                    <li class="list-group-item">
                        <b>Código</b> <a class="pull-right">#156165</a>
                    </li>
                    <li class="list-group-item">
                        <b>Desde</b> <a class="pull-right">18/04/2018</a>
                    </li>
                </ul>
                <a href="#" class="btn btn-primary btn-block">Editar</a>
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
                <li>
                    <a href="#cambiar" data-toggle="tab" aria-expanded="false">Cambiar contraseña</a>
                </li>
            </ul>
            <div class="tab-content">
                <div class="tab-pane active" id="personal">
                    <ul class="list-group">
                        <li class="list-group-item">
                            <b>Nombre</b> <a class="pull-right">{nombre}</a>
                        </li>
                        <li class="list-group-item">
                            <b>Apellido paterno</b> <a class="pull-right">{ap_paterno}</a>
                        </li>
                        <li class="list-group-item">
                            <b>Apellido materno</b> <a class="pull-right">{ap_materno}</a>
                        </li>
                        <li class="list-group-item">
                            <b>Género</b> <a class="pull-right">{sexo}</a>
                        </li>
                        <li class="list-group-item">
                            <b>Correo electrónico</b> <a class="pull-right">${usuario.username}</a>
                        </li>
                        <li class="list-group-item">
                            <b>Teléfono local</b> <a class="pull-right">{tel_casa}</a>
                        </li>
                        <li class="list-group-item">
                            <b>Teléfono móvil</b> <a class="pull-right">{tel_celular}</a>
                        </li>
                        <li class="list-group-item">
                            <b>Departamento</b> <a class="pull-right">{departamento}</a>
                        </li>
                        <li class="list-group-item">
                            <b>Cargo</b> <a class="pull-right">{cargo}</a>
                        </li>
                    </ul>
                </div>
                <div class="tab-pane" id="domicilio">
                    <ul class="list-group">
                        <li class="list-group-item">
                            <b>Calle</b> <a class="pull-right">{calle}</a>
                        </li>
                        <li class="list-group-item">
                            <b>Colonia</b> <a class="pull-right">{colonia}</a>
                        </li>
                        <li class="list-group-item">
                            <b>Municipio</b> <a class="pull-right">{municipio}</a>
                        </li>
                        <li class="list-group-item">
                            <b>Entidad federativa</b> <a class="pull-right">{entidad_federativa}</a>
                        </li>
                        <li class="list-group-item">
                            <b>Número exterior</b> <a class="pull-right">{num_exterior}</a>
                        </li>
                        <li class="list-group-item">
                            <b>Número interior</b> <a class="pull-right">{num_interior}</a>
                        </li>
                        <li class="list-group-item">
                            <b>Código postal</b> <a class="pull-right">{cp}</a>
                        </li>
                    </ul>
                </div>
                <div class="tab-pane" id="cambiar">
                    <form role="form">
                        <div class="form-group">
                            <label for="actual">Contraseña actual</label>
                            <input type="password" class="form-control" id="actual" name="actual" placeholder="Contraseña actual">
                        </div>
                        <div class="form-group">
                            <label for="nueva">Nueva contraseña</label>
                            <input type="password" class="form-control" id="nueva" name="nueva" placeholder="Nueva contraseña">
                        </div>
                        <div class="form-group">
                            <label for="confirmar">Confirmar contraseña</label>
                            <input type="password" class="form-control" id="confirmar" name="confirmar" placeholder="Confirmar contraseña">
                        </div>

                        <input type="submit" class="btn btn-primary btn-flat btn-block" value="Guardar cambios" />
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>




<content tag="scripts">
</content>


</body>
</html>

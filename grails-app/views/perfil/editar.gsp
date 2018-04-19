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

                <input type="submit" form="datos" class="btn btn-primary btn-block" value="Guardar" />
            </div>
        </div>
    </div>

    <div class="col-md-9">
        <div class="box box-primary">
            <div class="box-header with-border">
                <h3 class="box-title">Editar información</h3>
            </div>
            <div class="box-body">
                <form id="datos" role="form" method="post">
                    <div class="form-group">
                        <label for="nombre">Nombre</label>
                        <input type="text" class="form-control" id="nombre" name="nombre" placeholder="Nombre">
                    </div>
                    <div class="form-group">
                        <label for="paterno">Apellido paterno</label>
                        <input type="text" class="form-control" id="paterno" name="paterno" placeholder="Apellido paterno">
                    </div>
                    <div class="form-group">
                        <label for="materno">Apellido materno</label>
                        <input type="text" class="form-control" id="materno" name="materno" placeholder="Apellido materno">
                    </div>
                    <div class="form-group">
                        <label for="genero">Género</label>
                        <input type="text" class="form-control" id="genero" name="genero" placeholder="Género">
                    </div>
                    <div class="form-group">
                        <label for="correo">Correo electrónico</label>
                        <input type="email" class="form-control" id="correo" name="correo" placeholder="Correo electrónico">
                    </div>
                    <div class="form-group">
                        <label for="local">Teléfono local</label>
                        <input type="text" class="form-control" id="local" name="local" placeholder="Teléfono local">
                    </div>
                    <div class="form-group">
                        <label for="movil">Teléfono móvil</label>
                        <input type="text" class="form-control" id="movil" name="movil" placeholder="Teléfono móvil">
                    </div>

                    <hr class="separator">

                    <div class="form-group">
                        <label for="calle">Calle</label>
                        <input type="text" class="form-control" id="calle" name="calle" placeholder="Calle">
                    </div>
                    <div class="form-group">
                        <label for="colonia">Colonia</label>
                        <input type="text" class="form-control" id="colonia" name="colonia" placeholder="Colonia">
                    </div>
                    <div class="form-group">
                        <label for="municipio">Municipio</label>
                        <input type="text" class="form-control" id="municipio" name="municipio" placeholder="Municipio">
                    </div>
                    <div class="form-group">
                        <label for="entidad">Entidad Federativa</label>
                        <input type="text" class="form-control" id="entidad" name="enotidad" placeholder="Entidad federativa">
                    </div>

                    <div class="row">
                        <div class="col-sm-6">
                            <div class="form-group">
                                <label for="exterior">Número exterior</label>
                                <input type="text" class="form-control" id="exterior" name="exterior" placeholder="# exterior">
                            </div>
                        </div>
                        <div class="col-sm-6">
                            <div class="form-group">
                                <label for="interior">Número interior</label>
                                <input type="text" class="form-control" id="interior" name="interior" placeholder="# interior">
                            </div>
                        </div>
                    </div>

                    <div class="form-group">
                        <label for="cp">Código postal</label>
                        <input type="text" class="form-control" id="cp" name="cp" placeholder="Código postal">
                    </div>

                </form>
            </div>
        </div>
    </div>
</div>




<content tag="scripts">
</content>


</body>
</html>

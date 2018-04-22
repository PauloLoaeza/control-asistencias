<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<title>Recuperar contraseña</title>
	<!-- Tell the browser to be responsive to screen width -->
	<meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
	<!-- Bootstrap 3.3.7 -->
	<asset:stylesheet src="bootstrap.min.css" />
	<!-- Font Awesome -->
	<asset:stylesheet src="font-awesome.min.css" />
	<!-- Ionicons -->
	<asset:stylesheet src="ionicons.min.css" />
	<!-- Theme style -->
	<asset:stylesheet src="AdminLTE.min.css" />
	<!-- Google Font -->
	<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,600,700,300italic,400italic,600italic">
</head>
<body class="hold-transition lockscreen">
<!-- Automatic element centering -->
<div class="lockscreen-wrapper">
	<div class="lockscreen-logo">
		<a href="${createLink(uri: '/')}"><b>Sistema de control de asistencias</b></a>
	</div>

	<g:if test='${emailSent}'>
		<div class="alert alert-success alert-dismissable">
			<button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>
			<h4><i class="icon fa fa-check"></i>Correo enviado</h4>
			Hemos enviado un correo con la información necesaria para recuperar su cuenta
		</div>
	</g:if>
	<g:else>
		<!-- User name -->
		<div class="lockscreen-name">Recuperar contraseña</div>

		<!-- START LOCK SCREEN ITEM -->
		<div class="lockscreen-item">
			<!-- lockscreen image -->
			<div class="lockscreen-image">
				<asset:image src="user.png" alt="imagen usuario" />
			</div>
		<!-- /.lockscreen-image -->
		<!-- /.lockscreen-image -->

		<!-- lockscreen credentials (contains the form) -->
			<g:form method="post" class="lockscreen-credentials" action="forgotPassword" name="forgotPasswordForm" id="forgotPasswordForm">
				<f:with bean="forgotPasswordCommand">
					<div class="input-group">
						<f:field property="username" label="Correo electrónico"></f:field>

						<div class="input-group-btn">
							<button type="submit" class="btn"><i class="fa fa-arrow-right text-muted"></i></button>
						</div>
					</div>
				</f:with>
			</g:form>
		<!-- /.lockscreen credentials -->

		</div>
		<!-- /.lockscreen-item -->

	</g:else>

	<div class="help-block text-center">
		Ingresa tu correo para recuperar tu cuenta
	</div>
	<div class="text-center">
		<a href="${createLink(uri: '/')}">O regresa a la página de iniciar sesión</a>
	</div>
	<div class="lockscreen-footer text-center">
		Copyright &copy; ${Calendar.getInstance().get(Calendar.YEAR)} <b>Tecnosalle</b><br>
		Todos los derechos reservados
	</div>
</div>

<!-- jQuery 3 -->
<asset:javascript src="jquery.min.js" />
<!-- Bootstrap 3.3.7 -->
<asset:javascript src="bootstrap.min.js" />
</body>
</html>
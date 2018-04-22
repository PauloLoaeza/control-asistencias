<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<title>Reestablcer contraseña</title>
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
	<!-- iCheck -->
	<asset:stylesheet src="iCheck/square/blue.css" />
	<!-- Google Font -->
	<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,600,700,300italic,400italic,600italic">
</head>
<body class="hold-transition login-page">
<div class="login-box">
	<div class="login-logo">
		<a href="${createLink(uri: '/')}"><strong>Sistema de control de asistencias</strong></a>
	</div>

	<g:if test="${flash.message}">
		<div class="alert alert-warning alert-dismissable">
			<button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>
			<h4><i class="icon fa fa-warning"></i>No se pudo iniciar sesión</h4>
			${flash.message}
		</div>
	</g:if>

	<div class="login-box-body">
		<p class="login-box-msg">Escriba su nueva contraseña</p>

		<g:form name="resetPasswordForm" action="resetPassword" method="POST">
			<g:hiddenField name="t" id="t" value="${token}" />
			<f:with bean="resetPasswordCommand">
				<f:field property="password" label="Nueva contraseña" theme="pass" />
				<f:field property="password2" label="Confirmar contraseña" theme="pass"/>
			</f:with>

			<button type="submit" class="btn btn-primary btn-block btn-flat">Actualizar contraseña</button>

		</g:form>

		<%--
		<s2ui:formContainer type='resetPassword' focus='password' width='475px'>
			<s2ui:form beanName='resetPasswordCommand'>
				<g:hiddenField name='t' value='${token}'/>
				<div class="sign_in">
					<br/>
					<h3><g:message code='spring.security.ui.resetPassword.description'/></h3>
					<table>
						<s2ui:passwordFieldRow name='password' labelCodeDefault='Password'/>
						<s2ui:passwordFieldRow name='password2' labelCodeDefault='Password (again)'/>
					</table>
					<s2ui:submitButton elementId='submit' messageCode='spring.security.ui.resetPassword.submit'/>
				</div>
			</s2ui:form>
		</s2ui:formContainer>
		--%>
	</div>
	<!-- /.login-box-body -->
</div>
<!-- /.login-box -->

<!-- jQuery 3 -->
<asset:javascript src="jquery.min.js" />
<!-- Bootstrap 3.3.7 -->
<asset:javascript src="bootstrap.min.js" />
</body>
</html>



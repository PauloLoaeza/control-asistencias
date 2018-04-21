<!doctype html>
<html>
<head>
</head>

<body>
    <h2>Hola ${usuario.empleado.nombre},</h2>

    <h3>
        Sabemos que has olvidado tu contraseña. Es por eso que te invitamos a cambiarla


        <form action="http://localhost:9595/sca/login/authenticate" method="post">
            <g:hiddenField name="username" value="${usuario.username}" />
            <g:hiddenField name="password" value="${usuario.password}" />

            <button type="submit">Aquí</button>
        </form>
    </h3>

</body>
</html>
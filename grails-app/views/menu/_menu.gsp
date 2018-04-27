<li class="${current == 'inicio' ? 'active' : ''}"><a href="${createLink(uri: '/')}"><span class="fa fa-home"></span> Inicio</a></li>

<sec:access expression="hasRole('ROLE_SUPERADMIN')">
    <li class="dropdown ${current == 'administradores' ? 'active' : ''}">
        <a href="#" class="dropdown-toggle" data-toggle="dropdown">
            <span class="fa fa-users"></span> Administradores <span class="caret"></span>
        </a>
        <ul class="dropdown-menu" role="menu">
            <li><a href="${createLink(uri: '/administradores')}"><span class="fa fa-eye"></span> Ver administradores</a></li>
            <li><a href="${createLink(uri: '/administradores/nuevo')}"><span class="fa fa-user-plus"></span> Registrar administrador</a></li>
        </ul>
    </li>
    <li class="dropdown ${current == 'empleados' ? 'active' : ''}">
        <a href="#" class="dropdown-toggle" data-toggle="dropdown">
            <span class="fa fa-users"></span> Empleados <span class="caret"></span>
        </a>
        <ul class="dropdown-menu" role="menu">
            <li><a href="${createLink(uri: '/empleado')}"><span class="fa fa-eye"></span> Ver empleados</a></li>
            <li><a href="${createLink(uri: '/')}"><span class="fa fa-user-plus"></span> Registrar empleado</a></li>
        </ul>
    </li>
    <li class="dropdown">
        <a href="#" class="dropdown-toggle" data-toggle="dropdown">
            <span class="fa fa-file-text"></span> Reportes <span class="caret"></span>
        </a>
        <ul class="dropdown-menu" role="menu">
            <li><a href="${createLink(uri: '/')}"><span class="fa fa-files-o"></span> Generar reporte</a></li>
        </ul>
    </li>

</sec:access>

<sec:access expression="hasRole('ROLE_ADMIN')">
    <li class="dropdown ${current == 'empleados' ? 'active' : ''}">
        <a href="#" class="dropdown-toggle" data-toggle="dropdown">
            <span class="fa fa-users"></span> Empleados <span class="caret"></span>
        </a>
        <ul class="dropdown-menu" role="menu">
            <li><a href="${createLink(uri: '/empleado')}"><span class="fa fa-eye"></span> Ver empleados</a></li>
            <li><a href="${createLink(uri: '/')}"><span class="fa fa-user-plus"></span> Registrar empleado</a></li>
        </ul>
    </li>
    <li class="dropdown">
        <a href="#" class="dropdown-toggle" data-toggle="dropdown">
            <span class="fa fa-file-text"></span> Reportes <span class="caret"></span>
        </a>
        <ul class="dropdown-menu" role="menu">
            <li><a href="${createLink(uri: '/')}"><span class="fa fa-files-o"></span> Generar reporte</a></li>
        </ul>
    </li>
</sec:access>

<li><a href="${createLink(uri: '/')}"><span class="fa fa-question-circle"></span> Acerca de</a></li>
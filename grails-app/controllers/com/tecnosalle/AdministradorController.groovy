package com.tecnosalle

import grails.plugin.springsecurity.annotation.Secured

@Secured('ROLE_SUPERADMIN')
class AdministradorController {

    def index() {
        def rolAdmin = Rol.findByAuthority("ROLE_ADMIN")
        [administradores: UsuarioRol.findAllByRol(rolAdmin).usuario*.empleado]
    }
}

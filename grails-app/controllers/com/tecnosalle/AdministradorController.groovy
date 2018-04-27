package com.tecnosalle

import grails.plugin.springsecurity.annotation.Secured

@Secured('ROLE_SUPERADMIN')
class AdministradorController {

    def index() {
        def rolAdmin = Rol.findByAuthority("ROLE_ADMIN")
        [administradores: UsuarioRol.findAllByRol(rolAdmin).usuario*.empleado]
    }

    def nuevo(Empleado empleado) {
        if (!request.post)  {
            return [empleado: new Empleado()]
        }

        println(empleado.domicilio.properties)

        if (empleado.hasErrors()) {
            return [empleado: empleado]
        }

        empleado.save()

        def rolAdmin = Rol.findByAuthority("ROLE_ADMIN")
        UsuarioRol.create empleado.usuario, rolAdmin

        UsuarioRol.withSession {
            it.flush()
            it.clear()
        }

        flash.icon = "check"
        flash.messageType = "success"
        flash.title = "Administrador registrado"
        flash.message = "El administrador se ha registrado correctamente"

        redirect(action: "index")
    }

}

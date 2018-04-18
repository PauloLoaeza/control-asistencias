package control.asistencias

import com.tecnosalle.Rol
import com.tecnosalle.Usuario
import com.tecnosalle.UsuarioRol
import grails.util.Environment

class BootStrap {

    def init = { servletContext ->
        if (Environment.current == Environment.DEVELOPMENT) {
            def superRole = new Rol(authority: "ROLE_SUPERADMIN")
                    .save(failOnError: true)
            def adminRole = new Rol(authority: "ROLE_ADMIN")
                    .save(failOnError: true)
            def checkerRole = new Rol(authority: "ROLE_CHECADOR")
                    .save(failOnError: true)

            def superUser = new Usuario(username: "super@tecnosalle.com", password: "super")
                    .save(failOnError: true)

            def adminUser = new Usuario(username: "admin@tecnosalle.com", password: "admin")
                    .save(failOnError: true)
            def checkerUser = new Usuario(username: "checador@tecnosalle.com", password: "checador")
                    .save(failOnError: true)

            UsuarioRol.create superUser, superRole
            UsuarioRol.create adminUser, adminRole
            UsuarioRol.create checkerUser, checkerRole

            UsuarioRol.withSession {
                it.flush()
                it.clear()
            }
        }
    }
    def destroy = {
    }
}

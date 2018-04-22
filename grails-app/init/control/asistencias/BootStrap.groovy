package control.asistencias

import com.tecnosalle.Departamento
import com.tecnosalle.Domicilio
import com.tecnosalle.Empleado
import com.tecnosalle.Genero
import com.tecnosalle.Rol
import com.tecnosalle.Usuario
import com.tecnosalle.UsuarioRol
import grails.util.Environment

class BootStrap {

    def init = { servletContext ->
        if (Environment.current == Environment.DEVELOPMENT) {
            //def superRole = new Rol(authority: "ROLE_SUPERADMIN")
                    //.save(failOnError: true)
            def adminRole = new Rol(authority: "ROLE_ADMIN")
                    .save(failOnError: true)
            //def checkerRole = new Rol(authority: "ROLE_CHECADOR")
                    //.save(failOnError: true)

            //def superUser = new Usuario(username: "super@tecnosalle.com", password: "super")
            def adminUser = new Usuario(username: "luis.loaezagar@gmail.com", password: "admin")
            //def checkerUser = new Usuario(username: "checador@tecnosalle.com", password: "checador")

            def rey = new Empleado(
                    codigo: 'RERJ16651',
                    nombre: 'Rey Juan',
                    apellidoPaterno: "Rendon",
                    apellidoMaterno: 'Herrera',
                    telefonoCasa: '5145688',
                    telefonoCelular: '9516513456',
                    cargo: 'Administrador del sistema SCA',
                    genero: Genero.MASCULINO,
                    domicilio: new Domicilio(
                            calle: 'Calle',
                            colonia: 'Colonia',
                            municipio: 'Zimatlán de Álvarez',
                            entidadFederativa: 'Oaxaca',
                            numeroExterior: '5',
                            codigoPostal: '68156'
                    ),
                    departamento: new Departamento(
                            codigo: 'ADM0001',
                            nombre: 'Administración'
                    ),
                    usuario: adminUser
            ).save(failOnError: true)


            //UsuarioRol.create superUser, superRole
            UsuarioRol.create adminUser, adminRole
            //UsuarioRol.create checkerUser, checkerRole

            UsuarioRol.withSession {
                it.flush()
                it.clear()
            }
        }
    }
    def destroy = {
    }
}

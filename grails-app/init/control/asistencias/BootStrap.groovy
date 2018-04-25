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
            def superRole = new Rol(authority: "ROLE_SUPERADMIN")
                    .save(failOnError: true)
            def adminRole = new Rol(authority: "ROLE_ADMIN")
                    .save(failOnError: true)
            def checkerRole = new Rol(authority: "ROLE_CHECADOR")
                    .save(failOnError: true)

            def pauloUser = new Usuario(username: "luis.loaezagar@gmail.com", password: "super")
            def reyUser = new Usuario(username: "uckorey@gmail.com", password: "admin")
            def yuBanUser = new Usuario(username: "yubanmenazabala@outlook.com", password: "super")
            def vianeyUser = new Usuario(username: "rebel15.ac@gmail.com", password: "admin")
            def checkerUser = new Usuario(username: "checador@tecnosalle.com", password: "checador").save(failOnError: true)

            Departamento administracion = new Departamento(
                    codigo: "ADM000",
                    nombre: "Adminisración"
            )

            def paulo = new Empleado(
                    codigo: 'LOGL656',
                    nombre: 'Luis Paulo',
                    apellidoPaterno: "Loaeza",
                    apellidoMaterno: 'Garcia',
                    telefonoCasa: '5145688',
                    telefonoCelular: '9516513456',
                    cargo: 'Administrador del sistema SCA',
                    genero: Genero.MASCULINO,
                    domicilio: new Domicilio(
                            calle: '21 de octubre',
                            colonia: 'Unidad Modelo',
                            municipio: 'Oaxaca de Juárez',
                            entidadFederativa: 'Oaxaca',
                            numeroExterior: '5',
                            codigoPostal: '68156'
                    ),
                    departamento: administracion,
                    usuario: pauloUser
            ).save(failOnError: true)

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
                    departamento: administracion,
                    usuario: reyUser
            ).save(failOnError: true)

            def yuban = new Empleado(
                    codigo: 'MEZY6516',
                    nombre: 'Yu Ban',
                    apellidoPaterno: "Mena",
                    apellidoMaterno: 'Zabala',
                    telefonoCasa: '5145688',
                    telefonoCelular: '9516513456',
                    cargo: 'Administrador del sistema SCA',
                    genero: Genero.MASCULINO,
                    domicilio: new Domicilio(
                            calle: 'Calle',
                            colonia: 'Colonia',
                            municipio: 'Volcanes',
                            entidadFederativa: 'Oaxaca',
                            numeroExterior: '5',
                            codigoPostal: '68156'
                    ),
                    departamento: administracion,
                    usuario: yuBanUser
            ).save(failOnError: true)

            def vianey = new Empleado(
                    codigo: 'CAMV4651',
                    nombre: 'Vianey Andres',
                    apellidoPaterno: "Carrillo",
                    apellidoMaterno: 'Matias',
                    telefonoCasa: '5145688',
                    telefonoCelular: '9516513456',
                    cargo: 'Administrador del sistema SCA',
                    genero: Genero.MASCULINO,
                    domicilio: new Domicilio(
                            calle: 'Calle',
                            colonia: 'Colonia',
                            municipio: 'Oaxaca de Juárez',
                            entidadFederativa: 'Oaxaca',
                            numeroExterior: '5',
                            codigoPostal: '68156'
                    ),
                    departamento: administracion,
                    usuario: vianeyUser
            ).save(failOnError: true)

            UsuarioRol.create pauloUser, superRole
            UsuarioRol.create reyUser, adminRole
            UsuarioRol.create yuBanUser, superRole
            UsuarioRol.create vianeyUser, adminRole
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

package com.tecnosalle

import grails.plugin.springsecurity.annotation.Secured

import java.text.ParseException

@Secured(["ROLE_SUPERADMIN", "ROLE_ADMIN"])
class AsistenciaController {

    def home() {
        if (!request.post) {
            def asistencias = Asistencia.withCriteria {
                def hoy = new Date().clearTime()
                def manana = hoy + 1

                between("entrada", hoy, manana)
            }
            return [asistencias: asistencias]
        }

        def fecha = Date.parse("dd/MM/yyyy", params.fecha)
        def siguiente = fecha + 1

        def asistencias = Asistencia.withCriteria {
            between("entrada", fecha, siguiente)
        }

        return [asistencias: asistencias]
    }

    def index(Empleado empleado) {
        [empleado: empleado]
    }

    def parseException(ParseException e) {
        flash.message = "La fecha debe tener el siguiente formato: dd/mm/aaaa"
        flash.messageType = "warning"
        flash.icon = "warning"
        flash.title = "Formato de fecha no admitido"

        return [action: "index"]
    }
}

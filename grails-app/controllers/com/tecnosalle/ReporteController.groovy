package com.tecnosalle

import grails.plugin.springsecurity.annotation.Secured

@Secured(["ROLE_SUPERADMIN", "ROLE_ADMIN"])
class ReporteController {

    def index(Integer empleado, String inicio, String fin) {
        def empleados = Empleado.where {
            isAdmin == false
        }.list()

        if (!request.post) {
            def asistencias = Asistencia.withCriteria {
                def hoy = new Date().clearTime()

                between("entrada", hoy, hoy + 1)
            }

            return [
                    empleados: empleados,
                    asistencias: asistencias,
                    seleccionado: null,
                    inicio: new Date().toLocaleString(),
                    fin: new Date().toLocaleString()]
        }

        def fechaInicio = Date.parse("dd/MM/yyyy hh:mm:ss", inicio)
        def fechaFin = Date.parse("dd/MM/yyyy hh:mm:ss", fin)

        def seleccionado = Empleado.findById(empleado)
        def asistencias = Asistencia.withCriteria {
            if (seleccionado) {
                eq("empleado", seleccionado)
            }
            between("entrada", fechaInicio, fechaFin)
        }

        return [
                empleados: empleados,
                asistencias: asistencias,
                seleccionado: seleccionado,
                inicio: inicio,
                fin: fin
        ]
    }

    def generar() {

    }
}

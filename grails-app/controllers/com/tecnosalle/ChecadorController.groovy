package com.tecnosalle

import grails.plugin.springsecurity.annotation.Secured

@Secured("ROLE_CHECADOR")
class ChecadorController {

    def index() { }

    def checar(String codigo) {
        if (!request.post) {
            redirect(uri: "/")
            return
        }

        def empleado = Empleado.findByCodigo(codigo)

        if (!empleado) {
            flash.message = "No se ha encontrado el empleado con código: " + codigo
            flash.messageType = "danger"
            flash.icon = "warning"
            flash.title = "Empleado no encontrado"

            redirect(uri: "/")
            return
        }

        def hoy = new Date().clearTime()

        //La asistencia (sin salida) del día de hoy
        def asistencia = Asistencia.withCriteria {
            eq("empleado", empleado)
            isNull("salida")

            between("entrada", hoy, hoy + 1)
        }.find()

        if (asistencia) {
            asistencia.salida = new Date()
            asistencia.save(failOnError: true, flush: true)

            flash.message = "Se ha registrado la salida: " + asistencia.salida.format("hh:mm:ss a")
            flash.messageType = "success"
            flash.icon = "check"
            flash.title = "Salida registrada"
        } else {
            def entrada = new Date()
            empleado.addToAsistencias(entrada: entrada).save(failOnError: true, flush: true)

            flash.message = "Se ha registrado la entrada: ${entrada.format("hh:mm:ss a")}"
            flash.messageType = "success"
            flash.icon = "check"
            flash.title = "Entrada registrada"
        }

        redirect(uri: "/")
    }
}

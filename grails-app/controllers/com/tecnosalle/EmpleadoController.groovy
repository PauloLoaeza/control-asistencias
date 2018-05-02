package com.tecnosalle

import grails.gorm.transactions.Transactional
import grails.plugin.springsecurity.annotation.Secured

@Secured(['ROLE_SUPERADMIN', 'ROLE_ADMIN'])
class EmpleadoController {

    def index() {
        def empleados = Empleado.where {
            isAdmin == false
        }.list()

        def admins = Empleado.where {
            isAdmin == true
        }.list()

        [empleados: empleados, administradores: admins]
    }

    @Transactional
    def nuevo(Empleado empleado) {
        if (!request.post) {
            return [empleado: new Empleado()]
        }

        if (empleado.hasErrors()) {
            return [empleado: empleado]
        }

        empleado.save(flush: true)

        flash.icon = "check"
        flash.messageType = "success"
        flash.title = "Empleado registrado"
        flash.message = "El empleado se ha registrado correctamente"

        redirect(action: "index")
    }

    def mostrar(Empleado empleado) {
        if (empleado == null) {
            notFound()
            return
        }

        [empleado: empleado]
    }

    @Transactional
    def editar(Empleado empleado) {
        if (empleado == null) {
            notFound()
            return
        }

        if (!request.post) {
            return [empleado: empleado]
        }

        if (empleado.hasErrors()) {
            return [empleado: empleado]
        }

        empleado.save(flush: true)

        flash.icon = "check"
        flash.messageType = "success"
        flash.title = "Empleado actualizado"
        flash.message = "Se ha actualizado el empleado correctamente"

        redirect(action: "index")
    }

    @Transactional
    def eliminar(Empleado empleado) {
        if (empleado == null) {
            notFound()
            return
        }

        if (!request.post) {
            return [empleado: empleado]
        }

        empleado.delete(flush: true)

        flash.icon = "check"
        flash.messageType = "success"
        flash.title = "Empleado eliminado"
        flash.message = "Se ha eliminado correctamente el empleado"

        redirect(action: "index")
    }

    protected void notFound() {
        flash.icon = "warning"
        flash.messageType = "warning"
        flash.title = "Empleado no encontrado"
        flash.message = "No se ha encontrado el empleado solicitado"

        redirect(action: "index")
    }

}

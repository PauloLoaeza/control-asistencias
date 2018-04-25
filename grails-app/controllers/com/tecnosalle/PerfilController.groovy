package com.tecnosalle

import grails.gorm.transactions.Transactional
import grails.plugin.springsecurity.annotation.Secured

@Secured(['ROLE_SUPERADMIN', 'ROLE_ADMIN'])
class PerfilController {

    def springSecurityService
    def mailService

    def index() {
        [usuario: Empleado.findByUsuario(springSecurityService.currentUser)]
    }

    def editar() {
        [empleado: Empleado.findByUsuario(springSecurityService.currentUser)]
    }

    @Transactional
    def guardar(Empleado empleado) {
        Empleado nuevo = Empleado.get(params.id)
        nuevo.properties = empleado.properties

        if (nuevo == null) {
            transactionStatus.setRollbackOnly()
            respond empleado.errors, view: 'editar'
            return
        }

        if (nuevo.hasErrors()) {
            transactionStatus.setRollbackOnly()
            respond empleado.errors, view: 'editar'
            return
        }

        nuevo.save(flush: true)

        flash.icon = "check"
        flash.messageType = "success"
        flash.title = "Perfil actualizado"
        flash.message = "Su información ha sido actualizada correctamente"

        redirect(action: "index")
    }

    @Transactional
    def actualizarPassword(PerfilCommand command) {
        if (command.hasErrors()) {
            transactionStatus.setRollbackOnly()

            flash.icon = "warning"
            flash.messageType = "warning"
            flash.title = "Contraseña no actualizada"
            flash.message = "La contraseña no se pudo actualizar. Verifica la información proporcionada"

            redirect(action: "index", fragment: 'cambiar')
            return
        }

        command.actualizarPassword()

        flash.icon = "check"
        flash.messageType = "success"
        flash.title = "Contraseña actualizada"
        flash.message = "La contraseña ha sido actualizada correctamente"

        redirect(action: "index", fragment: 'cambiar')
    }

}

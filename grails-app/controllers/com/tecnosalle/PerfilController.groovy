package com.tecnosalle

import grails.gorm.transactions.Transactional
import grails.plugin.springsecurity.annotation.Secured
import org.springframework.transaction.interceptor.TransactionAspectSupport

@Secured(['IS_AUTHENTICATED_FULLY'])
class PerfilController {

    def springSecurityService

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
}

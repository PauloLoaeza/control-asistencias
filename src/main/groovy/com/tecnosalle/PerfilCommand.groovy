package com.tecnosalle

import grails.validation.Validateable

class PerfilCommand implements Validateable {

    def springSecurityService
    def passwordEncoder

    String password
    String newPassword
    String confirmPassword

    static constraints = {
        password blank: false, password: true, validator: { val, obj ->
            def currentPassword = obj.springSecurityService.currentUser.password
            return obj.passwordEncoder.isPasswordValid(currentPassword, val, null)
        }
        newPassword blank: false, password: true, validator: { val, obj ->
            val == obj.confirmPassword
        }
        confirmPassword blank: false, password: true
    }

    Usuario actualizarPassword() {
        Usuario usuario = springSecurityService.currentUser

        usuario.password = newPassword
        usuario.save(flush: true)
    }
}

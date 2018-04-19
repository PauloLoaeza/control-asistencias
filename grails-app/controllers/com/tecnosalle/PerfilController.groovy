package com.tecnosalle

import grails.plugin.springsecurity.annotation.Secured

class PerfilController {

    def springSecurityService

    @Secured(['IS_AUTHENTICATED_FULLY'])
    def index() {
        [usuario: springSecurityService.currentUser]
    }

}

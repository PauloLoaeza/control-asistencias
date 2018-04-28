package com.tecnosalle

import grails.plugin.springsecurity.annotation.Secured

@Secured("ROLE_SUPERADMIN")
class DepartamentoController {

    def index() {
        [departamentos: Departamento.list()]
    }

    def nuevo(Departamento departamento) {
        if (!request.post) {
            return [departamento: new Departamento()]
        }

        if (departamento.hasErrors()) {
            return [departamento: departamento]
        }

        departamento.save(flush: true)

        flash.icon = "check"
        flash.messageType = "success"
        flash.title = "Departamendo creado"
        flash.message = "Se ha creado el departamento correctamente"

        redirect(action: "index")
    }

    def editar(Departamento departamento) {
        if (departamento == null) {
            notFound()
            return
        }

        if (!request.post) {
            return [departamento: departamento]
        }

        if (departamento.hasErrors()) {
            return [departamento: departamento]
        }

        println(departamento.properties)
        departamento.save(flush: true)

        flash.icon = "check"
        flash.messageType = "success"
        flash.title = "Departamendo actualizado"
        flash.message = "Se ha actualizado el departamento correctamente"

        redirect(action: "index")
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = "No se encotró en departamento"
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}

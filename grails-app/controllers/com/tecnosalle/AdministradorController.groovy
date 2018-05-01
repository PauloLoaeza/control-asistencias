package com.tecnosalle

import grails.gorm.transactions.Transactional
import grails.plugin.springsecurity.annotation.Secured

@Secured('ROLE_SUPERADMIN')
class AdministradorController {

    def index() {
        def rolAdmin = Rol.findByAuthority("ROLE_ADMIN")
        [administradores: UsuarioRol.findAllByRol(rolAdmin).usuario*.empleado]
    }

    @Transactional
    def nuevo(Empleado empleado) {
        if (!request.post)  {
            return [empleado: new Empleado()]
        }

        if (empleado.hasErrors()) {
            return [empleado: empleado]
        }

        empleado.save()

        def rolAdmin = Rol.findByAuthority("ROLE_ADMIN")
        UsuarioRol.create empleado.usuario, rolAdmin

        UsuarioRol.withSession {
            it.flush()
            it.clear()
        }

        flash.icon = "check"
        flash.messageType = "success"
        flash.title = "Administrador registrado"
        flash.message = "El administrador se ha registrado correctamente"

        redirect(action: "index")
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
        flash.title = "Adminstrador actualizado"
        flash.message = "Se ha actualizado el administrador correctamente"

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

        UsuarioRol.findByUsuario(empleado.usuario)*.delete(flush: true)
        empleado.delete(flush: true)

        flash.icon = "check"
        flash.messageType = "success"
        flash.title = "Administrador eliminado"
        flash.message = "Se ha eliminado correctamente el administrador"

        redirect(action: "index")
    }

    def mostrar(Empleado empleado) {
        [empleado: empleado]
    }

    protected void notFound() {
        flash.icon = "warning"
        flash.messageType = "warning"
        flash.title = "Administrador no encontrado"
        flash.message = "No se ha encontrado el administrador solicitado"

        redirect(action: "index")
    }
}

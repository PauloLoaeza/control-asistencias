package control.asistencias

class UrlMappings {

    static mappings = {

        group "/administradores", {
            "/" (controller: "administrador", action: "index")
            "/nuevo" (controller: "administrador", action: "nuevo")
            "/mostrar/$id" (controller: "administrador", action: "mostrar")
            "/editar/$id" (controller: "administrador", action: "editar")
            "/eliminar/$id" (controller: "administrador", action: "eliminar")
        }

        group "/departamentos", {
            "/" (controller: "departamento", action: "index")
            "/nuevo" (controller: "departamento", action: "nuevo")
            "/editar/$id"(controller: "departamento", action: "editar")
        }

        "/$controller/$action?/$id?(.$format)?"{
            constraints {
                // apply constraints here
            }
        }

        "/"(view:"/index")
        "500"(view:'/error')
        "404"(view:'/notFound')
    }
}

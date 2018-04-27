package control.asistencias

class UrlMappings {

    static mappings = {

        "/administradores" (controller: "administrador")

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

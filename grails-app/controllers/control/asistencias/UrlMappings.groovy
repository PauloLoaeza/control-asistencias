package control.asistencias

class UrlMappings {

    static mappings = {

        group "/administradores", {
            "/" (controller: "administrador", action: "index")
            "/nuevo" (controller: "administrador", action: "nuevo")
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

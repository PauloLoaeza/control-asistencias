package control.asistencias

class UrlMappings {

    static mappings = {
        "/$controller/$action?/$id?(.$format)?"{
            constraints {
                // apply constraints here
            }
        }

        "/"(view:"/index")
        "/olvidePassword"(view: '/olvidePassword')
        "500"(view:'/error')
        "404"(view:'/notFound')
    }
}

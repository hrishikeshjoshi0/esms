class UrlMappings {

	static mappings = {
		"/$controller/$action?/$id?"{
			constraints {
				// apply constraints here
			}
		}

		"/"(controller : "dashboard", action : "index")
		"/dashboard"(view:"/dashboard")
		"500"(view:'/error')
	}
}

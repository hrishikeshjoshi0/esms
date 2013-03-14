class UrlMappings {

	static mappings = {
		"/$controller/$action?/$id?"{
			constraints {
				// apply constraints here
			}
		}

		"/"(view:"/index")
		"/dashboard"(view:"/dashboard")
		"500"(view:'/error')
	}
}

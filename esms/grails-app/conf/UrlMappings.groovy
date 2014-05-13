class UrlMappings {

	static mappings = {
		"/$controller/$action?/$id?"{
			constraints {
				// apply constraints here
			}
		}
		
		"/login/$action?"(controller: "login")
		"/logout/$action?"(controller: "logout")
		
		"/"(controller : "dashboard", action : "index")
		"/dashboard"(view:"/dashboard")
		"500"(view:'/error')
		
		"/event/list.json"(controller:"event", action:"list") {
			format = "json"
		}		
	}
}

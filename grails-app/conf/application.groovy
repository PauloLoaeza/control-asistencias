

// Added by the Spring Security Core plugin:
grails.plugin.springsecurity.userLookup.userDomainClassName = 'com.tecnosalle.Usuario'
grails.plugin.springsecurity.userLookup.authorityJoinClassName = 'com.tecnosalle.UsuarioRol'
grails.plugin.springsecurity.authority.className = 'com.tecnosalle.Rol'
grails.plugin.springsecurity.controllerAnnotations.staticRules = [
	[pattern: '/',               access: ['IS_AUTHENTICATED_FULLY']],
	[pattern: '/error',          access: ['permitAll']],
	[pattern: '/index',          access: ['IS_AUTHENTICATED_FULLY']],
	[pattern: '/index.gsp',      access: ['IS_AUTHENTICATED_FULLY']],
	[pattern: '/shutdown',       access: ['permitAll']],
	[pattern: '/assets/**',      access: ['permitAll']],
	[pattern: '/**/js/**',       access: ['permitAll']],
	[pattern: '/**/css/**',      access: ['permitAll']],
	[pattern: '/**/images/**',   access: ['permitAll']],
	[pattern: '/**/fonts/**',    access: ['permitAll']],
	[pattern: '/**/favicon.ico', access: ['permitAll']],

	[pattern: '/olvidePassword', access: ['permitAll']]

]

grails.plugin.springsecurity.filterChain.chainMap = [
	[pattern: '/assets/**',      filters: 'none'],
	[pattern: '/**/js/**',       filters: 'none'],
	[pattern: '/**/css/**',      filters: 'none'],
	[pattern: '/**/images/**',   filters: 'none'],
	[pattern: '/**/favicon.ico', filters: 'none'],
	[pattern: '/**',             filters: 'JOINED_FILTERS']
]

grails.gorm.default.constraints = {
	domicilio nullable: false, size: 3..40
	personName nullable: false, size: 3..35, matches: "^[a-zA-ZàáâäãåąčćęèéêëėįìíîïłńòóôöõøùúûüųūÿýżźñçčšžÀÁÂÄÃÅĄĆČĖĘÈÉÊËÌÍÎÏĮŁŃÒÓÔÖÕØÙÚÛÜŲŪŸÝŻŹÑßÇŒÆČŠŽ∂ð ']+\$"
}

grails.mail.host = 'smtp.gmail.com'
grails.mail.port = 465
grails.mail.username = 'tecnosalle.help@gmail.com'
grails.mail.password = 'ulsaoaxaca'
grails.mail.props = [
		"mail.smtp.auth":"true",
		"mail.smtp.socketFactory.port": "465",
		"mail.smtp.socketFactory.class": "javax.net.ssl.SSLSocketFactory",
		"mail.smtp.socketFactory.fallback": "false"
]

grails.plugin.springsecurity.ui.password.validationRegex='^([a-zA-Z0-9ñ])+$'


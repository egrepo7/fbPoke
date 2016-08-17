from system.core.router import routes

routes['default_controller'] = 'Pokes'
routes['/userpage'] = 'Pokes#userpage'
routes['/logout'] = 'Pokes#logout'
routes['/pokeuser/<id1>/<id2>'] = 'Pokes#poke_user'

routes['POST']['/register'] = 'Pokes#register'
routes['POST']['/login'] = 'Pokes#login'
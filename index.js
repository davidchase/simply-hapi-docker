'use strict'

const { Server } = require('hapi')

const server = new Server()

server.connection({
    port: 8001,
    host: '0.0.0.0'
})

server.route([{
    method: 'GET',
    path: '/',
    handler: (_, reply) => reply('Hello, world')
}, {
    method: 'GET',
    path: '/{uname*}',
    handler: (request, reply) => reply(`Hello ${request.params.uname}`)
}])

server.start(err => {
    if (err) throw err
    console.log(`Server running at: ${server.info.uri}`)
})

process.env.NODE_ENV = process.env.NODE_ENV || 'development'

const environment = require('./environment')
const chokidar = require('chokidar')

// https://github.com/rubyapi/rubyapi/pull/742
environment.config.merge({
    devServer: {
        before: (app, server, compiler) => {
            chokidar.watch([
                'app/views/**/*',
                'app/content/**/*'
            ]).on('change', () => {
                // Wait a second for DB to update.
                setTimeout(() => {
                    server.sockWrite(server.sockets, 'content-changed')
                }, 500)
            })
        }
    }
})

module.exports = environment.toWebpackConfig()
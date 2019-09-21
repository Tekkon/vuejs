const { environment } = require('@rails/webpacker')
const { VueLoaderPlugin } = require('vue-loader')
const vue = require('./loaders/vue')
const pugLoader = require('./loaders/pug')
const babelLoaderQuasar = require('./loaders/babel-loader-quasar')
const stylusLoader = require('./loaders/stylus')
const sassLoader = require('./loaders/sass')
const aliases = require('./utils/aliases')

environment.plugins.prepend('VueLoaderPlugin', new VueLoaderPlugin())
environment.loaders.prepend('vue', vue)
environment.loaders.prepend('pug', pugLoader)
environment.loaders.prepend('sass', sassLoader)
environment.loaders.prepend('js', babelLoaderQuasar)
environment.loaders.prepend('stylus', stylusLoader)

environment.config.merge(aliases)
module.exports = environment

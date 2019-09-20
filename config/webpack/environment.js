const { environment } = require('@rails/webpacker')
const { VueLoaderPlugin } = require('vue-loader')
const vue = require('./loaders/vue')
const pugLoader = require('./loaders/pug')
const sassLoader = require('./loaders/sass')
const aliases = require('./utils/aliases')

environment.plugins.prepend('VueLoaderPlugin', new VueLoaderPlugin())
environment.loaders.prepend('vue', vue)
environment.loaders.prepend('pug', pugLoader)
environment.loaders.prepend('sass', sassLoader)

environment.config.merge(aliases)
module.exports = environment

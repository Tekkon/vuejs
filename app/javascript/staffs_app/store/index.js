import Vue from 'vue'
import Vuex from 'vuex'
import createPersistedState from 'vuex-persistedstate'

Vue.use(Vuex)

import clients from './modules/clients'

export default new Vuex.Store({
  state: {},
  mutations: {},
  actions: {},
  modules: {
    clients
  },
  plugins: [createPersistedState()]
})
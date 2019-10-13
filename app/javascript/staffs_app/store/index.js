import Vue from 'vue'
import Vuex from 'vuex'
import createPersistedState from 'vuex-persistedstate'

Vue.use(Vuex)

import organizations from './modules/organizations'

export default new Vuex.Store({
  state: {},
  mutations: {},
  actions: {},
  modules: {
    organizations
  },
  plugins: [createPersistedState()]
})
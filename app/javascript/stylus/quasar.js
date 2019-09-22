import Vue from 'vue'

import '../assets/styles/quasar.styl'
import iconSet from 'quasar/icon-set/fontawesome-v5.js'
import '@quasar/extras/fontawesome-v5/fontawesome-v5.css'
import 'quasar/dist/quasar.ie.polyfills'
import {
  Quasar,
  QLayout,
  QHeader,
  QDrawer,
  QPageContainer,
  QPage,
  QSpinner,
  QToolbar,
  QTable,
  QForm,
  QInput,
  QBtn,
  QSelect
} from 'quasar'

Vue.use(Quasar, {
  config: {},
  components: {
    QLayout,
    QHeader,
    QDrawer,
    QPageContainer,
    QPage,
    QSpinner,
    QToolbar,
    QTable,
    QForm,
    QInput,
    QBtn,
    QSelect
  },
  directives: {
  },
  iconSet: iconSet,
  plugins: {
  }
})

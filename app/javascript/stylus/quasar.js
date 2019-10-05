import Vue from 'vue'

import '../assets/styles/quasar.styl'
import iconSet from 'quasar/icon-set/fontawesome-v5.js'
import '@quasar/extras/fontawesome-v5/fontawesome-v5.css'
import 'quasar/dist/quasar.ie.polyfills'
import {
  ClosePopup,
  Quasar,
  QBtn,
  QCard,
  QCardSection,
  QCardActions,
  QDrawer,
  QDialog,
  QForm,
  QHeader,
  QInput,
  QLayout,
  QPageContainer,
  QPage,
  QSelect,
  QSpinner,
  QToolbar,
  QTable
} from 'quasar'

Vue.use(Quasar, {
  config: {},
  components: {
    ClosePopup,
    QBtn,
    QCard,
    QCardSection,
    QCardActions,
    QDrawer,
    QDialog,
    QHeader,
    QForm,
    QInput,
    QLayout,
    QPageContainer,
    QPage,
    QSelect,
    QSpinner,
    QToolbar,
    QTable
  },
  directives: [
    ClosePopup
  ],
  iconSet: iconSet,
  plugins: {
  }
})

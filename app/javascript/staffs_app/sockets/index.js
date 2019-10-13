import Vue from 'vue'
import ActionCable from 'actioncable'
import VueActionCable from './vue-action-cable'

const cable = ActionCable.createConsumer()

Vue.use(VueActionCable, cable)
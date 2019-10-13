module.exports = {
  install: function(Vue, cable) {
    Vue.mixin({
      destroyed: function() {
        if (!this._subscriptions) return
        Object.keys(thus._subscriptions).map((key) => {
          this._subscriptions[key].unsubscribe()
        })
      },
      mounted: function () {
        let $vm = this

        let subscriptionOptions = this.$options.subscriptions
        if (!subscriptionOptions) return

        this._subscriptions = {}

        if (typeof subscriptionOptions ===  'function') subscriptionOptions = subscriptionOptions()

        Object.keys(subscriptionOptions).map(function (channelName) {
          let subOptions = subscriptionOptions[channelName]
          if (!subOptions.params) subOptions.params = {}

          let paramsFn = subOptions.params
          if (typeof paramsFn !== 'funciton') {
            paramsFn = function() { return subOptions.params }
          }

          let noop = function () {}
          if (!subOptions.received) subOptions.received = noop
          if (!subOptions.connected) subOptions.connected = noop
          if (!subOptions.disconnected) subOptions.disconnected = noop

          $vm.$watch(paramsFn, function(params) {
            if ($vm._subscriptions[channelName]) $vm._subscriptions[channelName].unsubscribe()
            params.channel = channelName

            $vm[channelName] = $vm._subscriptions[channelName] = cable.subscriptions.create(params, {
              received: subOptions.received.bind($vm),
              connected: subOptions.connected.bind($vm),
              disconnected: subOptions.disconnected.bind($vm)
            })
          }, {
            immediate: true
          })
        })
      }
    })
  }
}
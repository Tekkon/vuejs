const path = require('path')

resolve_path = function(dir) {
  return path.join(__dirname, '../../../app/javascript/', dir)
}

module.exports = {
  resolve: {
    alias: {
      'images': resolve_path('assets/images'),
      'client_components': resolve_path('clients_app/components'),
      'staff_components': resolve_path('staffs_app/components')
    }
  }
}

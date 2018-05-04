const path = require('path');

module.exports = {
  mode: 'production',
  entry: {
    'application': [
      path.resolve(__dirname, './src/javascripts/application.js')
    ]
  },
  output: {
    filename: '[name].js',
    path: path.resolve(__dirname, './../app/assets/javascripts'),
    publicPath: '/'
  },
  module: {
    rules: [
      {
        test: /\.(js|jsx)$/,
        exclude: /node_modules/,
        use: 'babel-loader'
      }
    ]
  },
  resolve: {
    extensions: ['.js', '.jsx']
  }
}

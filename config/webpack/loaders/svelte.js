module.exports = {
  test: /\.svelte$/,
  exclude: [
	"/node_modules/",
	"/**/.#.*"
  ],
  use: [{
    loader: 'svelte-loader',
    options: {
      hotReload: false
    }
  }],
}

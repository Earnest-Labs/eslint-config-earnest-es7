import { CLIEngine } from 'eslint'
import { execSync } from 'child_process'

describe('Linting', () => {
  describe('StandardJS Exemplar - Bittorrent DHT Client', () => {
    it('passes linting', () => {
      var res = eslint(`${__dirname}/data/bittorrent-dht-client.js`)
      if (res) throw new Error(res)
    })
  })

  describe('Linting Rules Config', () => {
    it('passes linting', () => {
      var res = eslint(`${__dirname}/../index.js`)
      if (res) throw new Error(res)
    })
  })
})

function eslint (path) {
  const command = './node_modules/.bin/eslint --no-eslintrc -c index.js ' + path
  const opts = { cwd: __dirname + '/..', encoding: 'utf8' }
  try { return execSync(command, opts) } catch (ex) { return ex.stdout }
}

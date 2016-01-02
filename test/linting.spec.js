import fs from 'fs'
import { linter } from 'eslint'

describe('Linting', () => {
  describe('StandardJS Exemplar - Bittorrent DHT Client', () => {
    it('passes linting', () => {
      const filename = `${__dirname}/data/bittorrent-dht-client.js`
      const code = fs.readFileSync(filename, 'utf8')
      const rules = require('../')
      const messages = linter.verify(code, { rules: rules }, { filename: filename })

      if (messages.length) throw new Error(JSON.stringify(messages, null, 2))
    })
  })

  describe('Linting Rules Config', () => {
    it('passes linting', () => {
      const filename = `${__dirname}/../index.js`
      const code = fs.readFileSync(filename, 'utf8')
      const rules = require('../')
      const messages = linter.verify(code, { rules: rules }, { filename: filename })

      if (messages.length) throw new Error(JSON.stringify(messages, null, 2))
    })
  })
})

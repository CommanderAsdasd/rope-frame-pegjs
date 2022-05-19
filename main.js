
const fs = require('fs');
const pegjs = require('pegjs')
const parser_lib = require('./public/rope-frame-a1.js')



let parser_text = fs.readFileSync('public/rope-frame-a.pegjs', 'utf8')
let parser = pegjs.generate(parser_text)
let result = parser.parse("(a)")
let result = parser_lib.parse("(a)")

let ropes = {}
let frames = {};

console.log('parsed result: ', result)
console.log('parsed result: ', result[0]['value'][0]['value'])
console.log('ropes: ', ropes)
console.log('frames: ', frames)

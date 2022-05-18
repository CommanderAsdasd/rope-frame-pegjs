
const fs = require('fs');
const pegjs = require('pegjs')


let parser_text = fs.readFileSync('public/rope-frame-a.pegjs', 'utf8')
let parser = pegjs.generate(parser_text)
let result = parser.parse("(a)")

let ropes = {}
let frames = {};

console.log('parsed result: ', result)
console.log('ropes: ', ropes)
console.log('frames: ', frames)

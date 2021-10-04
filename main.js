import pegjs from 'pegjs';
import fs from 'fs';

let parser_text = fs.readFileSync('rope-frame.pegjs', 'utf8')
let parser = pegjs.generate(parser_text)
let result = parser.parse("[()]")
console.log(result)

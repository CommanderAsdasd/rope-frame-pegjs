stream = expression*

expression = atom / rope / frame

frame = whitespace? frame_LParen items:(whitespace? rope/frame/atom )* frame_RParen whitespace? {return {type:"frame", value:items}}

rope = whitespace? rope_LParen items:(whitespace? rope/frame/atom )*  rope_RParen whitespace? {return {type:"rope", value:items}}

frame_RParen = "]"
frame_LParen = "["

rope_RParen = ")"
rope_LParen = "("

atom = content:(string  / number / identifier ) whitespace? {return {type:"atom", value:content} }

//broken
//longstring = '"""' (chars:.*[\n]*) '""""' {return {type:"longstring", value:chars.join("")}}

string = '"' chars:[^"]* '"' {return {type:"string", value:chars.join("")}}

number = hex / decimal

decimal = digits:[0-9]+ {return {type:"number",base: 10, value:parseInt(digits.join(""),10)};}

hex = "0x" digits:[0-9A-Fa-f]+ {return {type:"number",base: 16, value:parseInt(digits.join(""),16)};}

identifier = whitespace content:[^ \t\n\r\[\](\) ]+ {return {type:"identifier",value:content.join("")}}

whitespace
  = [ \t\n\r ]*
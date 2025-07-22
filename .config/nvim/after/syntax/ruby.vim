" " Ruby-specific concealing for constants and operators
" syntax match rubyOperator "=>" conceal cchar=⇒
" syntax match rubyOperator "::" conceal cchar=∷
" syntax match rubyOperator "<<" conceal cchar=≪
" syntax match rubyOperator ">>" conceal cchar=≫
"
" " String interpolation
" syntax region rubyInterpolation start="#{" end="}" contained conceal cchar=◦
"
" " Common patterns
" syntax match rubyComment "#.*$" contains=@Spell conceal cchar=◦
"
" " Hash rocket alternative (if you prefer)
" " syntax match rubyHashRocket "=>" conceal cchar=→
"
" " Regex delimiters
" syntax match rubyRegexp "/.*/" conceal cchar=∿

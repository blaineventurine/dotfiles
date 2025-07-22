; uncomment this if you feel like making Ruby unreadable
; ;; extends
;
; ; Keywords
; ("def" @keyword (#set! conceal "ƒ"))
; ("class" @keyword (#set! conceal "⟨"))
; ("module" @keyword (#set! conceal "⟪"))
; ("end" @keyword (#set! conceal "⟩"))
; ("return" @keyword (#set! conceal "←"))
; ("yield" @keyword (#set! conceal "⇒"))
;
; ; Control flow
; ("if" @keyword (#set! conceal "?"))
; ("unless" @keyword (#set! conceal "¿"))
; ("else" @keyword (#set! conceal "∶"))
; ("elsif" @keyword (#set! conceal "⁇"))
; ("case" @keyword (#set! conceal "⟨?"))
; ("when" @keyword (#set! conceal "→"))
;
; ; Loops
; ("while" @keyword (#set! conceal "↻"))
; ("until" @keyword (#set! conceal "↺"))
; ("for" @keyword (#set! conceal "∀"))
; ("break" @keyword (#set! conceal "⊥"))
; ("next" @keyword (#set! conceal "⇾"))
;
; ; Exception handling
; ("begin" @keyword (#set! conceal "⌊"))
; ("rescue" @keyword (#set! conceal "⚠"))
; ("ensure" @keyword (#set! conceal "✓"))
; ((identifier) @keyword (#eq? @keyword "raise") (#set! conceal "⚡"))
;
; ; Boolean operators
; ("and" @keyword (#set! conceal "∧"))
; ("or" @keyword (#set! conceal "∨"))
; ("not" @keyword (#set! conceal "¬"))
;
; ; Literals
; ((true) (#set! conceal "⊤"))
; ((false) (#set! conceal "⊥"))
; ((nil) (#set! conceal "∅"))
;
; ; Other keywords
; ((super) @keyword (#set! conceal "↑"))
; ((self) @keyword (#set! conceal "⋄"))
;
; ; enumerable methods
; ((call method: (identifier) @method (#eq? @method "each")) (#set! conceal "∀"))
; ((call method: (identifier) @method (#eq? @method "map")) (#set! conceal "↦"))
; ((call method: (identifier) @method (#eq? @method "select")) (#set! conceal "⊆"))
; ((call method: (identifier) @method (#eq? @method "reject")) (#set! conceal "⊄"))
; ((call method: (identifier) @method (#eq? @method "reduce")) (#set! conceal "∑"))
; ((call method: (identifier) @method (#eq? @method "inject")) (#set! conceal "∑"))
; ((call method: (identifier) @method (#eq? @method "find")) (#set! conceal "∃"))
; ((call method: (identifier) @method (#eq? @method "any?")) (#set! conceal "∃?"))
; ((call method: (identifier) @method (#eq? @method "all?")) (#set! conceal "∀?"))

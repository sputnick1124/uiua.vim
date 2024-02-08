use std::path::Path;

use uiua::{PrimClass, Primitive};

fn gen_group(prims: impl Iterator<Item = Primitive> + Clone) -> String {
    let glyphs = prims
        .clone()
        .flat_map(|p| {
            p.glyph()
                .into_iter()
                .chain(p.ascii().into_iter().flat_map(|ascii| {
                    Some(ascii.to_string())
                        .filter(|s| s.len() == 1)
                        .into_iter()
                        .flat_map(|s| s.chars().collect::<Vec<_>>())
                }))
        })
        .collect::<String>()
        .replace('-', r#"\-"#);
    let sys_names: Vec<_> = prims
        .clone()
        .map(|p| p.name())
        .filter_map(|n| n.strip_prefix('&'))
        .collect();
    let sys_names = if !sys_names.is_empty() {
        format!(r#"\|&\%({}\)"#, sys_names.join(r#"\|"#))
    } else {
        "".into()
    };

    let format_names: String = prims
        .clone()
        .filter_map(|p| {
            let name = p.name();
            if name.starts_with('&') {
                None
            } else {
                let min_len = (2..=name.len())
                    .find(|&n| Primitive::from_format_name(&name[..n]) == Some(p))
                    .unwrap();
                let mut start: String = name.chars().take(min_len).collect();
                let mut end = String::new();
                for c in name.chars().skip(min_len) {
                    start.push_str(r#"\%("#);
                    start.push(c);
                    end.push_str(r#"\)\?"#);
                }
                Some(format!("{}{}", start, end))
            }
        })
        .collect::<Vec<_>>()
        .join("\\|");
    let format_names = format!(r#"\%({}\)"#, format_names);

    format!(r#"[{glyphs}]\|\([a-zA-Z]\)\@<!\({format_names}{sys_names}\)\([a-zA-Z]\)\@!"#)
}

fn main() {
    let stack_functions = gen_group(
        Primitive::non_deprecated()
            .filter(|p| p.class() == PrimClass::Stack && p.modifier_args().is_none())
            .chain(Some(Primitive::Identity)),
    );
    let noadic_functions = gen_group(Primitive::non_deprecated().filter(|p| {
        p.class() != PrimClass::Stack && p.modifier_args().is_none() && p.args() == Some(0)
    }));
    let monadic_functions = gen_group(Primitive::non_deprecated().filter(|p| {
        ![PrimClass::Stack, PrimClass::Planet].contains(&p.class())
            && p.modifier_args().is_none()
            && p.args() == Some(1)
    }));
    let dyadic_functions = gen_group(Primitive::non_deprecated().filter(|p| {
        p.class() != PrimClass::Stack && p.modifier_args().is_none() && p.args() == Some(2)
    }));
    let monadic_modifiers =
        gen_group(Primitive::non_deprecated().filter(|p| matches!(p.modifier_args(), Some(1))));
    let dyadic_modifiers: String = gen_group(
        Primitive::non_deprecated().filter(|p| matches!(p.modifier_args(), Some(n) if n >= 2)),
    );

    let text = format!(
        r##"if exists('b:current_syntax')
    finish
endif

syn match uiuaidents "\<[a-zA-Z]\+\>"
syn match uiuacomments "#.*$"
syn match uiuacharacters "@\%(\\\%(x[0-9A-Fa-f]{{2}}\|u[0-9A-Fa-f]{{4}}\|.\)\|.\)"
syn match uiuanumbers "[`¯]\?[0-9]\+\%([./][0-9]\+\%(e[+-]\?[0-9]\+\)\?\)\?"
syn match uiuastrand "_"
syn match uiuastack "{stack_functions}"
syn match uiuanoadic "{noadic_functions}"
syn match uiuamonadic "{monadic_functions}"
syn match uiuadyadic "{dyadic_functions}"
syn match uiuamod1 "{monadic_modifiers}"
syn match uiuamod2 "{dyadic_modifiers}"

syn match uiuaquote /""/ contained
syn region uiuastringsnormal matchgroup=uiuastringsnormal start=/"/ end=/"/ contains=uiuaquote
syn region uiuastringsformat matchgroup=uiuastringsformat start=/\$"/ end=/"/ contains=uiuaquote
syn region uiuastringsmultil matchgroup=uiuastringsmultil start=/\$ / end=/$/ contains=uiuaquote
syn sync fromstart

hi link uiuaidents Identifier
hi link uiuacomments Comment
hi link uiuacharacters Character
hi link uiuanumbers Number
hi link uiuastringsnormal String
hi link uiuastringsformat String
hi link uiuastringsmultil String
hi link uiuastrand Comment
hi link uiuastack Normal
hi link uiuanoadic Special
hi link uiuamonadic Macro
hi link uiuadyadic Function
hi link uiuamod1 Type
hi link uiuamod2 Keyword

if has ('nvim')
    hi link @lsp.type.string String
    hi link @lsp.type.number Number
    hi link @lsp.type.comment Comment
    hi link @lsp.type.stack_function Normal
    hi link @lsp.type.noadic_function Special
    hi link @lsp.type.monadic_function Macro
    hi link @lsp.type.dyadic_function Function
    hi link @lsp.type.monadic_modifier Type
    hi link @lsp.type.dyadic_modifier Keyword
endif

let b:current_syntax='uiua'
"##
    );

    let filename = Path::new(env!("CARGO_MANIFEST_DIR")).join("../syntax/uiua.vim");
    std::fs::write(filename, text).expect("Failed to write syntax file");
}

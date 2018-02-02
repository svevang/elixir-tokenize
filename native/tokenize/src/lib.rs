#[macro_use] extern crate rustler;
#[macro_use] extern crate rustler_codegen;
#[macro_use] extern crate lazy_static;

extern crate natural;
use natural::tokenize::tokenize;

use rustler::{NifEnv, NifTerm, NifResult, NifEncoder};

mod atoms {
    rustler_atoms! {
        atom ok;
        //atom error;
        //atom __true__ = "true";
        //atom __false__ = "false";
    }
}

rustler_export_nifs! {
    "Elixir.Tokenize",
    [("rust_tokenize", 1, rust_tokenize)],
    None
}

fn rust_tokenize<'a>(env: NifEnv<'a>, args: &[NifTerm<'a>]) -> NifResult<NifTerm<'a>> {
    let incoming_string: String = try!(args[0].decode());
    let owned_strings = tokenize(&incoming_string).iter().map(|&s| String::from(s) ).collect::<Vec<String>>();

    Ok((atoms::ok(), owned_strings).encode(env))
}

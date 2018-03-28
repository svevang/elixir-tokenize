#[macro_use] extern crate rustler;
#[macro_use] extern crate rustler_codegen;
#[macro_use] extern crate lazy_static;

extern crate natural;
extern crate pipclient_tokenize;

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
    let owned_strings = pipclient_tokenize::python_tokenize(&incoming_string).unwrap();

    Ok((atoms::ok(), owned_strings).encode(env))
}

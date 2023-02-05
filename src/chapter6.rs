trait Functor<A> {
    fn fmap<B>(self: &Self, f: fn(A) -> B) -> Self;
}

struct Reader<Fn> {
    f: Fn,
}

impl<A, B> Functor<B> for Reader<Box<dyn Fn(A) -> B>> {
    fn fmap<R>(self: &Self, f: fn(B) -> R) -> Reader<Box<(dyn Fn(A) -> R + 'static)>> {
        Reader {
            f: Box::new(move |a| f((self.f)(a))),
        }
    }
}

// i don't know if it's possible. I give up. i hate Rust. the easier thing that works is ...
use crate::compose;

fn fmap<A, B, C>(g: fn(A) -> B, f: fn(B) -> C) -> impl Fn(A) -> C {
    compose(f, g)
}

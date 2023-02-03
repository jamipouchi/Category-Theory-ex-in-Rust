use crate::compose;

fn fmap<A, B, R>(f: fn(A) -> B, g: fn(R) -> A) -> impl Fn(R) -> B {
    compose(f, g)
}

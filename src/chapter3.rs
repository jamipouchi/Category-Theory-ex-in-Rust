fn compose<A, B, C>(f: fn(B) -> Option<C>, g: fn(A) -> Option<B>) -> impl Fn(A) -> Option<C> {
    move |x| match g(x) {
        Some(y) => f(y),
        None => None,
    }
}

fn id<A>(x: A) -> Option<A> {
    Some(x)
}

fn safe_reciprocal(x: f32) -> Option<f32> {
    match x {
        0.0 => None,
        _ => Some(1.0 / x),
    }
}

fn safe_root(x: f32) -> Option<f32> {
    match x {
        0.0 => None,
        _ => Some(x.sqrt()),
    }
}

fn safe_root_reciprocal() -> impl Fn(f32) -> Option<f32> {
    compose(safe_root, safe_reciprocal)
}

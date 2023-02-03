pub mod chapter2;
pub mod chapter3;
pub mod chapter5;
pub mod chapter6;
pub mod chapter7;

fn id<T>(x: T) -> T {
    x
}

fn compose<A, B, C>(f: fn(B) -> C, g: fn(A) -> B) -> impl Fn(A) -> C {
    move |x| f(g(x))
}

#[cfg(test)]
mod tests {

    struct A {}
    struct B {}
    #[derive(Debug, PartialEq)]
    struct C {}

    use super::*;
    #[test]
    fn test_compose() {
        let g = |_: A| B {};
        let f = |_: B| C {};

        let g_after_f = compose(f, g);
        assert_eq!(g_after_f(A {}), f(g(A {})))
    }
}

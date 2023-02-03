fn bimap<A, B, C, D>(f: fn(A) -> B, g: fn(C) -> D, p: (A, C)) -> (B, D) {
    let (a, c) = p;
    (f(a), g(c))
}

fn first<A, B, C>(f: fn(A) -> B, p: (A, C)) -> (B, C) {
    let (a, c) = p;
    (f(a), c)
}

fn second<A, C, D>(g: fn(C) -> D, p: (A, C)) -> (A, D) {
    let (a, b) = p;
    (a, g(b))
}

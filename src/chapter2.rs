use std::collections::HashMap;

struct Memoize<K, V, F: FnOnce(K) -> V> {
    memoized_values: HashMap<K, V>,
    f: F,
}

impl<K, V, F> Memoize<K, V, F>
where
    K: std::hash::Hash + std::cmp::Eq + std::marker::Copy,
    V: std::marker::Copy,
    F: FnMut(K) -> V,
{
    fn new(f: F) -> Self {
        Memoize {
            memoized_values: HashMap::new(),
            f: f,
        }
    }
    fn call(&mut self, k: K) -> V {
        match self.memoized_values.get(&k) {
            Some(value) => *value,
            None => {
                let v = (self.f)(k);
                self.memoized_values.insert(k, v);
                v
            }
        }
    }
}
